function [count, errores_ubic] = detectar_errores_pam(x_n, y_n, umbral)
% errores = detectar_errores_pam(x_n, y_n)
%
% Retorna la cantidad de elementos con error en y_n al aplicar las regiones de
% decisión y comparar con x_n

count = 0;
errores = abs(y_n - x_n);
errores_ubic = [];

for i = 1:length(errores)
  if errores(i) > umbral
    count = count + 1;
    errores_ubic(i) = 1;
  else
    errores_ubic(i) = 0;
  end
end

end
% vim: ff=unix fileencoding=latin1
