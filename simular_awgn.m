function [x_n, x_up, x_t, y_t, mfo, y_n, errores_ubic] = simular_awgn(n)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)
  % Retorna
  % x_n: Secuencia de símbolos
  % x_up: Upsample de x_n
  % x_y: Secuencia modulada por sinc
  % y_t: Secuencia con AWGN
  % mfo: Matched filter output
  % y_n: Secuencia de símbolos detectada

  if(nargin == 0)
    n = 10;
  end

  % Apertura de la PAM
  A = 0.85;
  ts = 1/10;
  SNR = 42.77;

  % x_n
  x_n = secuencia_pam(n, A);

  % x_t
  [x_up x_t] = modular_pam(x_n, ts);
  % x_t = x_t(1:(end));

  % y_t
  y_t = x_t;
  % y_t = awgn(x_t, 42.77, 'measured');

  % mfo
  pulso_formador = sinc([-7:ts:7]);
  norma_pulso = energia(pulso_formador, ts);
  mfo = conv(x_t, pulso_formador/norma_pulso) * ts ; % Normalizo con ts
  % Nro mágico para corregir diferecias en los gráficos
  factor_normalizacion_empirico = 1/1.1;
  mfo = mfo(71:(end-70)) * factor_normalizacion_empirico;

  % y_n
  periodo_discreto = ceil(1/ts);
  y_n = mfo(71:(10):end);

  % Para alinear y restar
  y_n = y_n(1:end-7);

  % errores_ubic = [];
  [error_count, errores_ubic] = detectar_errores_pam(x_n, y_n, A);
  disp(sprintf('Se detectaron %i errores en %i elementos', error_count, length(x_n)));
end

% vim: ff=unix fileencoding=latin1
