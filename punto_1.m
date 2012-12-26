function punto_1()
  % Simula la transmisi�n de una se�al 4-PAM a trav�s de un canal ideal
  % y su detecci�n con un filtro adaptado.

  [xn xt yt mfo yn] = simular_awgn(10);
  graficar_seniales(xn, xt, yt, mfo, yn);
end

% vim: ff=unix fileencoding=latin1
