function y = euler_lotka(lambda, f1, f2)
    y = f1 * exp(-lambda) + f2 * exp(-2 * lambda) - 1;
end

f1 = 1;
f2 = 5;

initial_guess = 1.0;

lambda_solution = fzero(@(lambda) euler_lotka(lambda, f1, f2), initial_guess);

lambda_solution