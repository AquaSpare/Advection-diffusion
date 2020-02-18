function x = gs(A, b, TOL)
M = tril(A);
G = M\(M-A);
iter = 0;
sze = size(A);
x = zeros(sze(1), 1);

while norm(A*x-b) > TOL
    x = G*x + inv(M)*b;
    iter = iter+1;
end

fprintf('%g iterations: ', iter);

end