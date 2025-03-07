x = [1;1];
A = [1,1;1,0];
f = [1,1];
for i=3:100
    x = A * x;
    f(i) = x(1);
end
r = zeros(1,99);
for i=1:99
    r(i)=f(i+1) / f(i);
end
plot(1:99,r)
xlabel("n")
ylabel("r")
title("n v.s. r")