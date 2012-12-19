function [energiaout] = energia(senal,Ts)
  % [energiaout] = energia(senal,Ts)
  %
  % Recibe una senal y su Tiempo de muestreo. calcula la energia
  % como sum(X*conj(x))*Ts

  energiaout = sum(senal.*conj(senal))*Ts;
end
