function corrida(n)
  % Corre la simulación
  % n: Número de símbolos a transmitir (default: 10)

  if(nargin == 0)
    n = 10;
  end

  % Apertura de la PAM
  A = 0.85;

  x_n = secuencia_pam(n, A);
  % stem(x_n);
end
