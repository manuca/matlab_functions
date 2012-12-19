% vim: ff=unix fileencoding=latin1
function corrida(n)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)

  if(nargin == 0)
    n = 10;
  end

  % Apertura de la PAM
  A = 0.85;
  ts = 1/10;

  x_n = secuencia_pam(n, A);
  x_t = modular_pam(x_n, ts);

  pulso_formador = sinc([-1:ceil(1/ts):1]);
  deteccion = conv(x_t, pulso_formador);

  subplot(4, 1, 1);
  stem(x_n);
  title('Secuencia 4PAM');

  subplot(4, 1, 2);
  stem(x_t);
  title('Señal modulada');
end
