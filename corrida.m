% vim: ff=unix fileencoding=latin1
function [x_n, x_t, y_t, y_n] = corrida(n)
  % Corre la simulaci�n
  % n: N�mero de s�mbolos a transmitir (default: 10)

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
  title('Se�al modulada - x(t)');

  subplot(5, 1, 3);
  stem(awgn(x_t, 18.57, 'measured'));
  title('Se�al modulada con ruido 18.57 dB');

  pulso_formador = sinc([-1:ts:1]);
  norma_pulso = energia(pulso_formador, ts);
  y_t = conv(x_t, pulso_formador/norma_pulso) * ts ; % Aplico esta normalizaci�n
  y_t = extraer(y_t, 10);

  subplot(5, 1, 4);
  stem(y_t);
  title('Se�al luego de filtro adaptado - y(t)');

  y_n = y_t(1:ceil(1/ts):end-9);

  subplot(5, 1, 5);
  stem(y_n);
  title('Se�al detectada - y[k]');
end

function s = extraer(signal, n)
  % Eliminamos n primeros elementos 
  % y n �ltimos elementos
  s = signal(n:(end-n-1));
end
