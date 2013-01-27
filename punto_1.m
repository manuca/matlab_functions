function punto_1()
  % Simula la transmisión de una señal 4-PAM a través de un canal ideal
  % y su detección con un filtro adaptado.

  [xn x_up xt yt mfo yn, errores_ubic] = simular_awgn(1000);
  graficar_seniales(xn, x_up, xt, yt, mfo, yn, errores_ubic);
end

% vim: ff=unix fileencoding=latin1
