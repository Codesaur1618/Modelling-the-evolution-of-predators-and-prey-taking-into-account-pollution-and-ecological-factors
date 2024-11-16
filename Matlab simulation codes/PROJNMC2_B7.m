% Fixed parameters and initial conditions
x0 = 4;
y0 = 10;
a = 3;
b = 0.5;
c = 4;
d = 0.5;
T = 8;

% Array of subdivision numbers
subdivision_numbers = [1000, 100];

% Run simulations for each subdivision count
figure;
hold on;
for i = 1:length(subdivision_numbers)
    N = subdivision_numbers(i);
    h = T / N;  % Step size based on subdivisions
    t = linspace(0, T, N+1);

    % Initialize populations
    x = zeros(1, N+1);
    y = zeros(1, N+1);
    x(1) = x0;
    y(1) = y0;

    % Euler method iteration
    for n = 1:N
        x(n+1) = x(n) + h * x(n) * (a - b * y(n));
        y(n+1) = y(n) + h * y(n) * (d * x(n) - c);
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
    title(sprintf('Scenario %d: Populations over Time', i));
    
    subplot(2,1,2);
    plot(x, y, 'k', 'DisplayName', 'Predator vs Prey');
    xlabel('Prey Population x(t)');
    ylabel('Predator Population y(t)');
    legend;
    title(sprintf('Scenario %d: Phase Plot of Predator vs Prey Population', i));

end

