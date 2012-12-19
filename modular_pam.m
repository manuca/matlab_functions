function s = modular_pam(secuencia_pam, periodo_muestreo)
  % s = modular_pam(secuencia_pam, periodo_muestreo = 1/10)
  %
  % Retorna:
  % s: Se�al modulada por pulso formador (sinc de per�odo 1 y energ�a 1)

  if (nargin == 1)
    ts = 1/10;
  else
    ts = periodo_muestreo;
  end

  simbolos = upsample(secuencia_pam, ceil(1/ts));

  x = -1:ts:1;
  p = sinc(x);

  s = conv(simbolos, p);
end
