function [x_up, s] = modular_pam(secuencia_pam, periodo_muestreo)
  % s = modular_pam(secuencia_pam, periodo_muestreo = 1/10)
  %
  % Retorna:
  % s: Señal modulada por pulso formador (sinc de período 1 y energía 1)

  if (nargin == 1)
    ts = 1/10;
  else
    ts = periodo_muestreo;
  end

  period = ceil(1/ts);
  simbolos = upsample(secuencia_pam, period);
  simbolos = simbolos(1:end-(period-1));

  x_up = simbolos;

  x = -3:ts:3;
  p = sinc(x);
  norma_p = energia(p, ts);

  s = conv(simbolos, p);
end
% vim: ff=unix fileencoding=latin1
