n = [400];
m = [120];
for j = 2:31;
    n(j) = n(j-1) * 1.1;
    m(j) = m(j-1) * 1.2;
end;

plot(1:31,log(n),1:31,log(m));
xlabel("Time(day)");
ylabel("The number of parasites(log-scale)");
title("Time vs The number of parasites")
legend('Parasites in ''my'' body', 'Parasites in the assistant''s body', 'FontSize', 12);
