%Assume A is a n x n matrix

function x = myownLU(A, b)
n = size(A,1);
U = A;
L = eye(n);

for i = 1:(n-1) % Works rightwards
    for j = (i+1):n % Works downwards
        factor = -U(j,i)/U(i,i); % Factor of diagonal element required
        L(j,i) = -factor; % Adds together all E-1's
        U(j,:) = U(j,:)+(factor.*U(i,:)); % Create a zero in (j,i)
    end 
end
y = L\b;
x = U\y;
end