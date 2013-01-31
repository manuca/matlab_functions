function punto_1a
  % Grafica el diagrama de ojo del sistem

  [xn x_up xt yt mfo yn, errores_ubic] = simular_awgn(1000);
  eyediagram(mfo, 10);
end

% vim: ff=unix fileencoding=latin1

