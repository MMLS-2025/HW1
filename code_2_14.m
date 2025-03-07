A = [0,0.0043,0.1132,0;
    0.9775,0.9111,0,0;
    0,0.0736,0.9534,0;
    0,0,0.0452,0.9804];
[V, D] = eig(A);


eigenvalues = diag(D);
[max_eigenvalue, index] = max(eigenvalues);
principal_eigenvalue = eigenvalues(index);
principal_eigenvector = V(:, index);
clear sum;
principal_eigenvector = principal_eigenvector / sum(principal_eigenvector);


for k = 1:4
    clear x;
    x(:,1) = [0;0;0;0];
    x(k,1) = 250;
    r1 = zeros(50, 1);
    r2 = zeros(50, 1);
    r3 = zeros(50, 1);
    r4 = zeros(50, 1);
    n_s = zeros(50, 1);
    
    for t = 1:50
        n = sum(x);
        r1(t) = x(1) / n;
        r2(t) = x(2) / n;
        r3(t) = x(3) / n;
        r4(t) = x(4) / n;
        n_s(t) = n;
        x = A * x;
    end
    
    % 绘制比例变化图
    subplot(4, 3,3*k);
    hold on;
    plot(1:50, r1, 'b', 'LineWidth', 1.5); % 第一阶段比例
    plot(1:50, r2, 'r', 'LineWidth', 1.5); % 第二阶段比例
    plot(1:50, r3, 'g', 'LineWidth', 1.5); % 第三阶段比例
    plot(1:50, r4, 'k', 'LineWidth', 1.5); % 第四阶段比例
    legend('Stage 1', 'Stage 2', 'Stage 3', 'Stage 4', 'Location', 'best');
    title('Proportion of Each Stage Over Time');
    xlabel('Time Step');
    ylabel('Proportion');
    hold off;
    
    % 绘制总种群数变化图
    subplot(4, 3, 3*k-1);
    plot(1:50, n_s, 'm', 'LineWidth', 1.5);
    title('Total Population Over Time');
    xlabel('Time Step');
    ylabel('Total Population');
    
    lambda = zeros(49,1);
    for t = 1:49
        lambda(t) = n_s(t + 1) / n_s(t);
    end
    subplot(4, 3, 3*k-2);
    cla; % 清除当前轴的内容
    plot(1:49, lambda, 'b', 'LineWidth', 1.5); % 绘制 lambda 曲线
    title('Lambda Over Time');
    xlabel('Time Step');
    ylabel('Lambda');

end