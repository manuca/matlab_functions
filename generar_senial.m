function [secuencia, s] = generar_senial(n)
  % [secuencia, s] = generar_senial(n)
  % secuencia: Secuencia aleatoria 4-PAM
  % s: Se�al modulada por pulso formador
  %
  % Genera la se�al real con n s�mbolos

  A = 1;
  ts = 1/10;

  secuencia = secuencia_pam(n, A);
  secuencia = upsample(secuencia, 1/ts);

  x = -1:ts:1;
  p = sinc(x);

  s = conv(secuencia, p);
end
