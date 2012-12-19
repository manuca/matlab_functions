function s = generar_senial(secuencia_pam)
  % s = generar_senial(secuencia_pam)
  %
  % Retorna:
  % s: Se�al modulada por pulso formador (sinc de per�odo 1 y energ�a 1)

  % Tiempo de muestreo
  ts = 1/10;

  simbolos = upsample(secuencia_pam, 1/ts);

  x = -1:ts:1;
  p = sinc(x);

  s = conv(simbolos, p);
end
