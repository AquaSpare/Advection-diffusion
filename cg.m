function x = cg(A, b, TOL)
r = b;
p = r;

iter = 0;
sze = size(A);
x = zeros(sze(1), 1);

while norm(A*x-b) > TOL
    alpha = (r.'*r)/(p.'*A*p);
    x = x + alpha*p;
    r1 = r - alpha*A*p;
    beta = (r1.'*r1)/(r.'*r);
    p = r1 + beta*p;
    r = r1;
    iter = iter+1;
end

fprintf('%g iterations: ', iter);

end