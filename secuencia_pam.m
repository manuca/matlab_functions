function s = secuencia_pam(n, A)
% secuencia_pam(n)
% 
%    |--|--|--0--|--|--|
%   -3A   -A     A     3A
%
% Devuelve una secuencia aleatoria de n elementos
% con valores posibles [-3A, -A, A, 3A] de una 4-PAM
    s = (randi(4, 1, n)*2 - 5);
    s = s.*A;
end
