% Constants
N = 160;
L = 1;
h = L/N;
epsilon = 0;

x = linspace(0,L,N); % Generate N elements between 0 and L
u = zeros(1, length(x));

for i=1:N % Generate initial conditions
    u(i) = init(i*h);
end

for i=1:length(x) % generate u_x with central difference
    if i == 1
        u_x = (1/(h^2))* (u(length(x)) - 2*u(i) + u(i+1));
    elseif i == length(x)
        u_x = (1/(h^2))* (u(i-1) - 2*u(i) + u(1));
    else
        u_x = (1/(h^2))* (u(i-1) - 2*u(i) + u(i+1));
    end
end

%test

%%%%%%%% FUNCTIONS
function u0 = init(x) % Initial conditions
if abs(2*x-0.3) <= 0.25
    u0 = exp(-300*(2*x-0.3)^2);
else
    u0 = 0;
end
end

