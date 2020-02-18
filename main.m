clear all;
clc;

A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6;25;-11;15];

w = 100;
N = 1000;
TOL = 10^-5;
A = rand(N) + diag(w*ones(N,1));
b = rand(N,1);

tic;
x1 = A\b;
fprintf ('Backslash took %g sec \n' , toc );

tic;
x2 = jacobi(A ,b , TOL);
fprintf ('Jacobi took %g sec \n' , toc );

tic ;
x3 = gs(A ,b , TOL);
fprintf ('GS took %g sec \n' , toc );

tic ;
x4 = cg(A ,b , TOL );
fprintf ('CG took %g sec \n' , toc );

tic ;
x5 = myownLU(A , b );
fprintf ('myownLU took %g sec \n' , toc );

tic ;
[L , U] = lu(A);
y = L \ b ;
x6 = U \ y ;
fprintf ('Matlab LU took %g sec \n' , toc );