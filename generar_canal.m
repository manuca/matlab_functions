function [ h_t ] = generar_canal(ts)
 % Genera la respuesta impulsiva de un canal
 % de característica h(t) = e^(-t/tau).
 % se genera desde t=0 hasta t=5*tau
  tau = 3;
  e = 2.71828182846;
  t = [0:ts:5*tau];
  h_t = e.^-(t/3);
end
% vim: ff=unix fileencoding=latin1
