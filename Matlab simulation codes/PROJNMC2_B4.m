% Define parameters
a = 3;      % Prey reproduction rate
b = 0.5;    % Prey mortality rate due to predators
c = 4;      % Predator mortality rate
d = 0.5;    % Predator reproduction rate per prey

% Define time parameters
t0 = 0;      % Initial time
T = 8;       % Final time
N = 10000;   % Number of steps
h = (T - t0) / N;  % Step size

% Initial conditions
x0 = 4;      % Initial prey population
y0 = 10;     % Initial predator population

% Initialize arrays for time and populations
t = linspace(t0, T, N+1); % Time array
x = zeros(1, N+1);        % Prey population array
y = zeros(1, N+1);        % Predator population array

% Set initial conditions in arrays
x(1) = x0;
y(1) = y0;

% Euler method iteration
for n = 1:N
    x(n+1) = x(n) + h * x(n) * (a - b * y(n));  % Update prey
    y(n+1) = y(n) + h * y(n) * (d * x(n) - c);  % Update predator
end

% Plot results
figure;
subplot(2,1,1);
plot(t, x, 'b', 'DisplayName', 'Prey Population x(t)');
hold on;
plot(t, y, 'r', 'DisplayName', 'Predator Population y(t)');
xlabel('Time');
ylabel('Population');
legend;
title('Population Dynamics of Prey and Predators over Time');

subplot(2,1,2);
plot(x, y, 'k', 'DisplayName', 'Predator vs Prey');
xlabel('Prey Population x(t)');
ylabel('Predator Population y(t)');
legend;
title('Phase Plot of Predator vs Prey Population');
