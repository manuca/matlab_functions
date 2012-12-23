function count = detectar_errores_pam(x_n, y_n, umbral)
% errores = detectar_errores_pam(x_n, y_n)
%
% Retorna la cantidad de elementos con error en y_n al aplicar las regiones de
% decisión y comparar con x_n

count = 0;
errores = abs(y_n - x_n);

for i = errores
  if i > umbral
    count = count + 1;
  end
end

end
% vim: ff=unix fileencoding=latin1
