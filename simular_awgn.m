% vim: ff=unix fileencoding=latin1
function [x_n, x_t, y_t, mfo, y_n] = simular_awgn(n)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)
  % Retorna
  % x_n: Secuencia de símbolos
  % x_y: Secuencia modulada por sinc
  % y_t: Secuencia con AWGN
  % mfo: Matched filter output
  % y_n: Secuencia de símbolos detectada

  if(nargin == 0)
    n = 10;
  end

  % Apertura de la PAM
  A = 0.85;
  ts = 1/10;

  % x_n
  x_n = secuencia_pam(n, A);

  % x_t
  x_t = modular_pam(x_n, ts);
  x_t = extraer(x_t, 10);

  % y_t
  y_t = awgn(x_t, 18.57, 'measured');

  % mfo
  pulso_formador = sinc([-1:ts:1]);
  norma_pulso = energia(pulso_formador, ts);
  mfo = conv(x_t, pulso_formador/norma_pulso) * ts ; % Normalizo con ts
  mfo = extraer(mfo, 10);

  % y_n
  y_n = mfo(1:ceil(1/ts):end-9);
end

function s = extraer(signal, n)
  % Eliminamos n primeros elementos 
  % y n-1 últimos elementos
  s = signal(n:(end-n-1));
end
