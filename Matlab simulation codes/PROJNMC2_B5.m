% Define common parameters
t0 = 0;      % Initial time
T = 8;       % Final time
N = 10000;   % Number of steps
h = (T - t0) / N;  % Step size
t = linspace(t0, T, N+1); % Time array

% Array to store results
results = cell(4, 1);

% Scenarios
scenarios = {
    [4, 10, 3, 0.5, 4, 0.5],   % Scenario 1
    [10, 2, 3, 0.5, 4, 0.5],   % Scenario 2
    [4, 10, 3, 0.5, 4, 2],     % Scenario 3
    [4, 10, 8, 0.5, 4, 0.5]    % Scenario 4
};

% Loop over each scenario
for i = 1:4
    % Extract parameters for this scenario
    x0 = scenarios{i}(1);
    y0 = scenarios{i}(2);
    a = scenarios{i}(3);
    b = scenarios{i}(4);
    c = scenarios{i}(5);
    d = scenarios{i}(6);
    
    % Initialize populations
    x = zeros(1, N+1);
    y = zeros(1, N+1);
    x(1) = x0;
    y(1) = y0;
    
    % Euler method iteration
    for n = 1:N
        x(n+1) = x(n) + h * x(n) * (a - b * y(n));  % Update prey
        y(n+1) = y(n) + h * y(n) * (d * x(n) - c);  % Update predator
    end
    
    % Store results for this scenario
    results{i} = struct('t', t, 'x', x, 'y', y, 'a', a, 'b', b, 'c', c, 'd', d);
    
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
