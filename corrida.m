% vim: ff=unix fileencoding=latin1
function [x_n, y_n] = corrida(n)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)

  if(nargin == 0)
    n = 10;
  end

  % Apertura de la PAM
  A = 0.85;
  ts = 1/10;

  x_n = secuencia_pam(n, A);

  subplot(5, 1, 1);
  stem(x_n);
  title('Secuencia 4PAM - x[n]');

  x_t = modular_pam(x_n, ts);
  x_t = extraer(x_t, 10);

  subplot(5, 1, 2);
  stem(x_t);
  title('Señal modulada - x(t)');

  subplot(5, 1, 3);
  stem(awgn(x_t, 18.57, 'measured'));
  title('Señal modulada con ruido 18.57 dB');

  pulso_formador = sinc([-1:ts:1]);
  norma_pulso = energia(pulso_formador, ts);
  deteccion = conv(x_t, pulso_formador/norma_pulso) * ts ; % Aplico esta normalización
  deteccion = extraer(deteccion, 10);

  subplot(5, 1, 4);
  stem(deteccion);
  title('Señal luego de filtro adaptado - y(t)');

  y_n = deteccion(1:ceil(1/ts):end-10);

  subplot(5, 1, 5);
  stem(y_n);
  title('Señal detectada - y[k]');
end

function s = extraer(signal, n)
  % Eliminamos n primeros elementos 
  % y n últimos elementos
  s = signal(n:end-n);
end
