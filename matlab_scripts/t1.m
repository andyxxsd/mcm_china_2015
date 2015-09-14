clear;
syms W;
% Question 1 solution (direct computation)

% W = 9;
th = (39 + 54/60 + 26/3600)/180*pi; % Lat
D = -(116 + 23/60 + 29/3600)/180*pi; % Long
Y = 2015; % Year
N = 294; % DayOfYear
Lg = 3;

Ly = shadow_length_calculator(Lg, th, D, Y, N, W);
h = ezplot(Ly, 9:15);
Ly_fun = @(x) double(subs(Ly, x));
x_min = fminunc(Ly_fun, 9, 15);
hold on
plot(x_min, Ly_fun(x_min), 'ro');
text(12, 4, sprintf('\\fontsize{12}W=%f', x_min));
text(12, 3.8, sprintf('\\fontsize{12}Ly=%f', Ly_fun(x_min)));
xlabel('\fontsize{14} W \rightarrow');
ylabel('\fontsize{14} Ly \rightarrow');
title('')