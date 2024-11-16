% General parameters
dt = 4 / 20000;  % Step size
N = 20000;       % Number of steps
t_final = 4;     % End time
t = linspace(0, t_final, N+1); % Time vector

% Initial conditions and parameters
x0 = 20;         % Initial prey population
y0 = 20;         % Initial predator population
a = 10;          % Prey growth rate
b = 3;           % Predation rate
c = 7;           % Predator mortality rate
d = 1;           % Predator reproduction rate
epsilon = 10; % Sensitivity to pesticides for both prey and predator

% Arrays for populations without pesticides (Model S1)
x1 = zeros(1, N+1);
y1 = zeros(1, N+1);
x1(1) = x0;
y1(1) = y0;

% Arrays for populations with pesticides (Model S2)
x2 = zeros(1, N+1);
y2 = zeros(1, N+1);
x2(1) = x0;
y2(1) = y0;

% Euler method iteration for Model S1 (without pesticides)
for n = 1:N
    dx1 = x1(n) * (a - b * y1(n));
    dy1 = y1(n) * (d * x1(n) - c);
    
    x1(n+1) = x1(n) + dt * dx1;
    y1(n+1) = y1(n) + dt * dy1;
end

% Euler method iteration for Model S2 (with pesticides)
for n = 1:N
    dx2 = x2(n) * ((a - epsilon) - b * y2(n));
    dy2 = y2(n) * (d * x2(n) - (c + epsilon));
    
    x2(n+1) = x2(n) + dt * dx2;
    y2(n+1) = y2(n) + dt * dy2;
end

% Plotting results to compare both models in separate graphs
figure;

% Plot for Model S1 (without pesticides)
subplot(2, 1, 1);  % Create first subplot
plot(t, x1, 'b', 'DisplayName', 'Prey Population');
hold on;
plot(t, y1, 'r', 'DisplayName', 'Predator Population');
xlabel('Time');
ylabel('Population');
legend;
title('Predator-Prey Populations without Pesticides');
hold off;

% Plot for Model S2 (with pesticides)
subplot(2, 1, 2);  % Create second subplot
plot(t, x2, 'b--', 'DisplayName', 'Prey Population with Pesticide');
hold on;
plot(t, y2, 'r--', 'DisplayName', 'Predator Population with Pesticide');
xlabel('Time');
ylabel('Population');
legend;
title('Predator-Prey Populations with Pesticides');
hold off;

% Overall title for the figure
sgtitle('Comparison of Predator-Prey Populations with and without Pesticides');
