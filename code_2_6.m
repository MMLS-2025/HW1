% Ex 2.6
L=[0 1 5; .5 0 0; 0 .25 0];
n0=[1;0;0];
t=1:50;
N=zeros(1, 50);
w=zeros(3, 50);

ni=n0;
for i=t
    ni=L*ni;
    N(i)=sum(ni);
    w(:, i)=ni/N(i);
end

subplot(3,1,1)
plot(t, log(N), 'k-', 'LineWidth', 1.5)
xlabel('Time');
ylabel('log(Population)');
title('Population Growth (Log Scale)');
grid on;

subplot(3,1,2)
hold on;
plot(t, w(1,:), 'b-', 'LineWidth', 1.5);
plot(t, w(2,:), 'r--', 'LineWidth', 1.5);
plot(t, w(3,:), 'g:', 'LineWidth', 1.5);
grid on;
hold off;
xlabel('Time');
ylabel('Proportion');
title('Proportion of Each Stage');
legend('Stage 1', 'Stage 2', 'Stage 3', 'Location', 'best');

% Ex 2.7
fun=@(x) 0.5*x^(-2)+0.625*x^(-3)-1;
x0=1;
sol=fzero(fun, x0);
lam=zeros(1, 49);
for i=1:49
    lam(i)=N(i+1)/N(i);
end

subplot(3,1,3)
plot(1:49, lam, 1:49, sol*ones(1,49))
grid on;
xlabel('Time')
ylabel('Growth Rate')
title('The rate of population growth approaches the solution of Euler-Lotka equation')
legend('Growth Rate', 'Solution', 'Location', 'best')