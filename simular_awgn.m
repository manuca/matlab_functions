function [x_n, x_up, x_t, y_t, mfo, y_n, errores_ubic] = simular_awgn(n, aplicar_canal)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)
  % Retorna
  % x_n: Secuencia de símbolos
  % x_up: Upsample de x_n
  % x_y: Secuencia modulada por sinc
  % y_t: Secuencia con AWGN
  % mfo: Matched filter output
  % y_n: Secuencia de símbolos detectada

  if(nargin == 1)
    aplicar_canal = false;
  end

  % Apertura de la PAM
  A = 0.85;
  ts = 1/10;
  periodo_discreto = 10;
  SNR = 18.57;

  % x_n
  x_n = secuencia_pam(n, A);

  % x_t
  [x_up x_t] = modular_pam(x_n, ts);

  % y_t
  if(aplicar_canal)
    h_t = generar_canal(ts);
    y_t = conv(x_t, h_t)*ts;
    offset_mfo = 208;
  else
    y_t = x_t;
    offset_mfo = 201;
  end

  % y_t + AWGN
  y_t = awgn(y_t, SNR, 'measured');

  % mfo
  mfo = salida_filtro_adaptado(y_t, ts);

  % Alinear y_n
  y_n = mfo(offset_mfo:periodo_discreto:end);
  % Extraer los n símbolos detectados
  y_n = y_n(1:n);

  errores_ubic  = [];
  errores_count = 0;

  [error_count, errores_ubic] = detectar_errores_pam(x_n, y_n, A);
end

% vim: ff=unix fileencoding=latin1
