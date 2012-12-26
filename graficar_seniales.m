function graficar_seniales(x_n, x_up, x_t, y_t, mfo, y_n, errores_ubic)
% Grafica en graficos verticales (x_n, x_t, y_t, mfo, y_n)
  subplot(7, 1, 1);
  stem(x_n);
  title('Secuencia 4PAM - x[n]');

  subplot(7, 1, 2);
  stem(x_up);
  title('x[n] sobremuestreada');

  subplot(7, 1, 3);
  stem(x_t);
  title('Señal modulada - x(t)');

  subplot(7, 1, 4);
  stem(y_t);
  title('Señal modulada con ruido - y(t)');

  subplot(7, 1, 5);
  stem(mfo);
  title('Señal luego de filtro adaptado - mfo(t)');

  subplot(7, 1, 6);
  stem(y_n);
  title('Señal detectada - y[k]');

  subplot(7, 1, 7);
  stem(errores_ubic);
  title('Errores');
end
% vim: ff=unix fileencoding=latin1
