% vim: ff=unix fileencoding=latin1
function [energiaout] = energia(senal,Ts)
  % [energiaout] = energia(senal,Ts)
  %
  % Recibe una se�al y su Tiempo de muestreo. calcula la energ�a
  % como sum(X*conj(x))*Ts

  energiaout = sum(senal.*conj(senal))*Ts;
end
