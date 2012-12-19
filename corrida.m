% vim: ff=unix fileencoding=latin1
function corrida(n)
  % Corre la simulaci�n
  % n: N�mero de s�mbolos a transmitir (default: 10)

  if(nargin == 0)
    n = 10;
  end

  % Apertura de la PAM
  A = 0.85;
  ts = 1/10;

  x_n = secuencia_pam(n, A);
  x_t = modular_pam(x_n, ts);
  % Eliminamos colas
  x_t = x_t(10:end-10);

  pulso_formador = sinc([-1:ceil(1/ts):1]);
  deteccion = conv(x_t, pulso_formador);
  y_t = deteccion(1:ceil(1/ts):end-10);

  subplot(4, 1, 1);
  stem(x_n);
  title('Secuencia 4PAM');

  subplot(4, 1, 2);
  stem(x_t);
  title('Se�al modulada');

  subplot(4, 1, 3);
  stem(deteccion);
  title('Se�al luego de filtro adaptado');

  subplot(4, 1, 4);
  stem(y_t);
  title('Se�al detectada');
end
