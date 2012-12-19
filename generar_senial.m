function [secuencia, s] = generar_senial(n)
  % [secuencia, s] = generar_senial(n)
  % secuencia: Secuencia aleatoria 4-PAM
  % s: Señal modulada por pulso formador
  %
  % Genera la señal real con n símbolos

  A = 1;
  ts = 1/10;

  secuencia = secuencia_pam(n, A);
  secuencia = upsample(secuencia, 1/ts);

  x = -1:ts:1;
  p = sinc(x);

  s = conv(secuencia, p);
end
