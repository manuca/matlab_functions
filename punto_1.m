function punto_1(simbolos, show_plot)
  % Simula la transmisión de una señal 4-PAM a través de un canal ideal
  % y su detección con un filtro adaptado.
  
  if (nargin == 0)
    simbolos = 1000000;
    show_plot = false;
  elseif (nargin == 1)
    show_plot = false;
  end

  [xn x_up xt yt mfo yn, errores_ubic] = simular_awgn(simbolos);

  if (show_plot)
    graficar_seniales(xn, x_up, xt, yt, mfo, yn, errores_ubic);
  end
end

% vim: ff=unix fileencoding=latin1
