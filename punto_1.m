function punto_1()
  % Simula la transmisi�n de una se�al 4-PAM a trav�s de un canal ideal
  % y su detecci�n con un filtro adaptado.

  [xn x_up xt yt mfo yn, errores_ubic] = simular_awgn(1000);
  graficar_seniales(xn, x_up, xt, yt, mfo, yn, errores_ubic);
end

% vim: ff=unix fileencoding=latin1
