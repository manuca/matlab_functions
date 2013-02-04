function [mfo] = salida_filtro_adaptado(y_t, ts)
  pulso_formador = sinc([-10:ts:10]);
  norma_pulso = energia(pulso_formador, ts);

  mfo = conv(y_t, pulso_formador/norma_pulso) * ts ; % Normalizo con ts
end
% vim: ff=unix fileencoding=latin1
