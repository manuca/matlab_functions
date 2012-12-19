function s = secuencia_pam(n, A)
  % secuencia_pam(n)
  % 
  %    |--|--|--0--|--|--|
  %   -3A   -A     A     3A
  %
  % Devuelve una secuencia aleatoria de n elementos
  % con valores posibles [-3A, -A, A, 3A] de una 4-PAM
  % n: Elementos (default: 10)
  % A: Apertura de la PAM (default: 1)

  if (nargin == 0)
    n = 10;
    A = 1;
  elseif (nargin == 1)
    A = 1;
  end

  randi = ceil(rand(1, n) * 4);

  s = (randi*2 - 5);
  s = s.*A;
end
