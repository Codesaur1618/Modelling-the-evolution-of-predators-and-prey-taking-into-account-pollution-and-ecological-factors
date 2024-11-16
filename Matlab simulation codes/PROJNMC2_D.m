% General Parameters
dt = 4 / 20000;  % Time step size
N = 20000;       % Number of steps
t_final = 4;     % End time
t = linspace(0, t_final, N+1); % Time vector

% Scenario parameters
scenarios = [
    struct('K', 10, 'a', 8, 'b', 0.5, 'c', 6, 'd', 0.5, 'title', 'Scenario 1: K=10, c=6'),
    struct('K', 10, 'a', 8, 'b', 0.5, 'c', 2, 'd', 0.5, 'title', 'Scenario 2: K=10, c=2'),
    struct('K', 13, 'a', 8, 'b', 0.5, 'c', 2, 'd', 0.5, 'title', 'Scenario 3: K=13, c=2')
];

% Initial conditions
x0 = 15;  % Initial prey population
y0 = 8;   % Initial predator population

% Plot results for each scenario
figure;

for i = 1:length(scenarios)
    % Extract parameters for the current scenario
    K = scenarios(i).K;
    a = scenarios(i).a;
    b = scenarios(i).b;
    c = scenarios(i).c;
    d = scenarios(i).d;
    
    % Initialize populations
    x = zeros(1, N+1);
    y = zeros(1, N+1);
    x(1) = x0;
    y(1) = y0;
    
    % Euler method iteration with carrying capacity
    for n = 1:N
        dx = x(n) * (a - a * x(n) / K - b * y(n));
        dy = y(n) * (d * x(n) - c);
        
        x(n+1) = x(n) + dt * dx;
        y(n+1) = y(n) + dt * dy;
    end
    
    % Plot x(t) and y(t)
    subplot(3, 2, 2*i-1);
    plot(t, x, 'b', 'DisplayName', 'Prey Population x(t)');
    hold on;
    plot(t, y, 'r', 'DisplayName', 'Predator Population y(t)');
    xlabel('Time');
    ylabel('Population');
    legend;
    title(['Population Dynamics - ', scenarios(i).title]);
    
    % Plot y(t) vs x(t) (Phase Plot)
    subplot(3, 2, 2*i);
    plot(x, y, 'k', 'DisplayName', 'Predator vs Prey');
    xlabel('Prey Population x(t)');
    ylabel('Predator Population y(t)');
    legend;
    title(['Phase Plot - ', scenarios(i).title]);
end
