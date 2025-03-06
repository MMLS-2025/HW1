L1 = [0, 0.1, 0.2, 1;
      0.8, 0, 0, 0;
      0, 0.4, 0, 0;
      0, 0, 0.6, 0];
n = size(L1, 1);
for j = 1:n^2 - 2*n + 2
    L1_power = L1^j;
    min_value = min(L1_power(:));
    fprintf('For j = %d, the smallest value in L1^j is: %f\n', j, min_value);
end

L2 = [0, 0, 2, 0;
      0.9, 0, 0, 0;
      0, 1, 0, 0;
      0, 0, 0.9, 0];

x = [1; 0; 0; 0];

r1 = zeros(30, 1);
r2 = zeros(30, 1);
r3 = zeros(30, 1);
r4 = zeros(30, 1);
n_s = zeros(30, 1);
for j = 1:n^2 - 2*n + 2
    L2_power = L2^j;
    min_value = min(L2_power(:));
    fprintf('For j = %d, the smallest value in L2^j is: %f\n', j, min_value);
end

for t = 1:30
    n = sum(x);
    r1(t) = x(1) / n;
    r2(t) = x(2) / n;
    r3(t) = x(3) / n;
    r4(t) = x(4) / n;
    n_s(t) = n;
    x = L2 * x;
end

% 绘制比例变化图
subplot(2, 1, 1);
hold on;
plot(1:30, r1, 'b', 'LineWidth', 1.5); % 第一阶段比例
plot(1:30, r2, 'r', 'LineWidth', 1.5); % 第二阶段比例
plot(1:30, r3, 'g', 'LineWidth', 1.5); % 第三阶段比例
plot(1:30, r4, 'k', 'LineWidth', 1.5); % 第四阶段比例
legend('Stage 1', 'Stage 2', 'Stage 3', 'Stage 4', 'Location', 'best');
title('Proportion of Each Stage Over Time');
xlabel('Time Step');
ylabel('Proportion');
hold off;

% 绘制总种群数变化图
subplot(2, 1, 2);
plot(1:30, n_s, 'm', 'LineWidth', 1.5);
title('Total Population Over Time');
xlabel('Time Step');
ylabel('Total Population');