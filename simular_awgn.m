function [x_n, x_t, y_t, mfo, y_n] = simular_awgn(n)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)
  % Retorna
  % x_n: Secuencia de símbolos
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
  x_t = modular_pam(x_n, ts);
  x_t = x_t(11:(end-10));

  % y_t
  y_t = x_t;
  % y_t = awgn(x_t, 42.77, 'measured');

  % mfo
  pulso_formador = sinc([-1:ts:1]);
  norma_pulso = energia(pulso_formador, ts);
  mfo = conv(x_t, pulso_formador/norma_pulso) * ts ; % Normalizo con ts
  % Nro mágico para corregir diferecias en los gráficos
  factor_normalizacion_empirico = 1;
  mfo = mfo(11:(end-10)) * factor_normalizacion_empirico;

  % y_n
  periodo_discreto = ceil(1/ts);
  y_n = mfo(1:periodo_discreto:end);

  error_count = detectar_errores_pam(x_n, y_n, A);
  disp(sprintf('Se detectaron %i errores en %i elementos', error_count, length(x_n)));
end

% vim: ff=unix fileencoding=latin1
