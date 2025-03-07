A = [0,0.0043,0.1132,0;
    0.9775,0.9111,0,0;
    0,0.0736,0.9534,0;
    0,0,0.0452,0.9804];

[V, D] = eig(A);
eigenvalues = diag(D);

[max_eigenvalue, index] = max(eigenvalues);
principal_eigenvalue = eigenvalues(index);
principal_eigenvector = V(:, index);
principal_eigenvector = principal_eigenvector / sum(principal_eigenvector);
initial_population = 250 * principal_eigenvector;

T = 250; 

harvest_juvenile = 5; 
harvest_adult = 3; 


population_juvenile = zeros(4, T);
population_adult = zeros(4, T);

population_juvenile(:,1) = initial_population;
population_adult(:,1) = initial_population;


for t = 2:T
    h_juvenile = [0; harvest_juvenile; 0; 0]; 
    population_juvenile(:,t) = A * population_juvenile(:,t-1) - h_juvenile;
    population_juvenile(population_juvenile(:,t) < 0, t) = 0;

    h_adult = [0; 0; harvest_adult; 0]; 
    population_adult(:,t) = A * population_adult(:,t-1) - h_adult;
    population_adult(population_adult(:,t) < 0, t) = 0;
end

total_population_juvenile = sum(population_juvenile,1);
total_population_adult = sum(population_adult,1);

figure;

subplot(2,2,1);
hold on;
plot(1:T, population_juvenile(1,:), 'b', 'LineWidth', 1.5); 
plot(1:T, population_juvenile(2,:), 'r', 'LineWidth', 1.5); 
plot(1:T, population_juvenile(3,:), 'g', 'LineWidth', 1.5); 
plot(1:T, population_juvenile(4,:), 'k', 'LineWidth', 1.5); 
plot(1:T, total_population_juvenile, 'm--', 'LineWidth', 2); 
legend('Yearlings', 'Juveniles (Harvested)', 'Adults', 'Postreproductive', 'Total', 'Location', 'best');
title('Population Change (5 Juvenile Harvesting)');
xlabel('Year');
ylabel('Population Size');
grid on;
hold off;


subplot(2,2,3);
hold on;
plot(1:T, population_adult(1,:), 'b', 'LineWidth', 1.5); 
plot(1:T, population_adult(2,:), 'r', 'LineWidth', 1.5); 
plot(1:T, population_adult(3,:), 'g', 'LineWidth', 1.5); 
plot(1:T, population_adult(4,:), 'k', 'LineWidth', 1.5); 
plot(1:T, total_population_adult, 'm--', 'LineWidth', 2); 
legend('Yearlings', 'Juveniles', 'Adults (Harvested)', 'Postreproductive', 'Total', 'Location', 'best');
title('Population Change (3 Adult Harvesting)');
xlabel('Year');
ylabel('Population Size');
grid on;
hold off;

harvest_juvenile = 6; 
harvest_adult = 4; 

population_juvenile = zeros(4, T);
population_adult = zeros(4, T);

population_juvenile(:,1) = initial_population;
population_adult(:,1) = initial_population;

for t = 2:T
    h_juvenile = [0; harvest_juvenile; 0; 0]; 
    population_juvenile(:,t) = A * population_juvenile(:,t-1) - h_juvenile;
    population_juvenile(population_juvenile(:,t) < 0, t) = 0; 

    h_adult = [0; 0; harvest_adult; 0]; 
    population_adult(:,t) = A * population_adult(:,t-1) - h_adult;
    population_adult(population_adult(:,t) < 0, t) = 0;
end

total_population_juvenile = sum(population_juvenile,1);
total_population_adult = sum(population_adult,1);


subplot(2,2,2);
hold on;
plot(1:T, population_juvenile(1,:), 'b', 'LineWidth', 1.5); 
plot(1:T, population_juvenile(2,:), 'r', 'LineWidth', 1.5); 
plot(1:T, population_juvenile(3,:), 'g', 'LineWidth', 1.5); 
plot(1:T, population_juvenile(4,:), 'k', 'LineWidth', 1.5); 
plot(1:T, total_population_juvenile, 'm--', 'LineWidth', 2); 
legend('Yearlings', 'Juveniles (Harvested)', 'Adults', 'Postreproductive', 'Total', 'Location', 'best');
title('Population Change (6 Juvenile Harvesting)');
xlabel('Year');
ylabel('Population Size');
grid on;
hold off;

subplot(2,2,4);
hold on;
plot(1:T, population_adult(1,:), 'b', 'LineWidth', 1.5); 
plot(1:T, population_adult(2,:), 'r', 'LineWidth', 1.5); 
plot(1:T, population_adult(3,:), 'g', 'LineWidth', 1.5); 
plot(1:T, population_adult(4,:), 'k', 'LineWidth', 1.5); 
plot(1:T, total_population_adult, 'm--', 'LineWidth', 2); 
legend('Yearlings', 'Juveniles', 'Adults (Harvested)', 'Postreproductive', 'Total', 'Location', 'best');
title('Population Change (4 Adult Harvesting)');
xlabel('Year');
ylabel('Population Size');
grid on;
hold off;

