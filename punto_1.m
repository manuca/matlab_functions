function punto_1()
  % Simula la transmisión de una señal 4-PAM a través de un canal ideal
  % y su detección con un filtro adaptado.

  [xn xt yt mfo yn] = simular_awgn(10);
  graficar_seniales(xn, xt, yt, mfo, yn);
end

% vim: ff=unix fileencoding=latin1
