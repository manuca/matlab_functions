function [x_up, s] = modular_pam(secuencia_pam, ts, periodo)
  % s = modular_pam(secuencia_pam, periodo_muestreo = 1/10)
  %
  % Retorna:
  % x_up:  Secuencia sobremuestreada según período de muestreo
  % s: Señal modulada por pulso formador (sinc de período 1 y energía 1)

  if (nargin == 1)
    ts = 1/10;
    periodo = 10;
  elseif (nargin == 2)
    periodo = 10;
  end

  simbolos = upsample(secuencia_pam, periodo);

  x_up = simbolos;

  x = -10:ts:10;
  p = sinc(x);
  norma_p = energia(p, ts);

  s = conv(simbolos, p);
end
% vim: ff=unix fileencoding=latin1
