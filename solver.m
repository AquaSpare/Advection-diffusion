% Constants
N = 160;
L = 1;
h = L/N;
epsilon = 0;

x = linspace(0,L,N); % Generate N elements between 0 and L
u = zeros(length(x));
u_x = zeros(length(x));

for i=1:N % Generate initial conditions
    u(1, i) = init(i*h);
end

u_x(1 , :) = centDiff(x, u, h);
u_t = -u_x;

%%%%%%%% FUNCTIONS %%%%%%%%

function u_x = centDiff(x, u, h)
u_x = zeros(1, length(x));

for i=1:length(x) % generate u_x with central difference
    if i == 1
        u_x(i) = (1/(h^2))* (u(1,length(x)) - 2*u(1,i) + u(1,i+1));
    elseif i == length(x)
        u_x(i) = (1/(h^2))* (u(1,i-1) - 2*u(1,i) + u(1,1));
    else
        u_x(i) = (1/(h^2))* (u(1,i-1) - 2*u(1,i) + u(1,i+1));
    end
end
end

function u0 = init(x) % Initial conditions
if abs(2*x-0.3) <= 0.25
    u0 = exp(-300*(2*x-0.3)^2);
else
    u0 = 0;
end
end

