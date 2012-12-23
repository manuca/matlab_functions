function graficar_seniales(x_n, x_t, y_t, mfo, y_n)
% Grafica en graficos verticales (x_n, x_t, y_t, mfo, y_n)
  subplot(5, 1, 1);
  stem(x_n);
  title('Secuencia 4PAM - x[n]');

  subplot(5, 1, 2);
  stem(x_t);
  title('Señal modulada - x(t)');

  subplot(5, 1, 3);
  stem(y_t);
  title('Señal modulada con ruido - y(t)');

  subplot(5, 1, 4);
  stem(mfo);
  title('Señal luego de filtro adaptado - mfo(t)');

  subplot(5, 1, 5);
  stem(y_n);
  title('Señal detectada - y[k]');
end
% vim: ff=unix fileencoding=latin1
