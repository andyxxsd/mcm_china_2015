clear;
% Question 2 attempt (polyfit the curve before solve equation) (found no improvement)

% [ float(row.split(',')[0].split(':')[0])+float(row.split(',')[0].split(':')[1])/60 for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
time = [12, 12.1, 12.2];
% [ float(row.split(',')[1]) for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
% x = [1.0365, 1.0699, 1.1038, 1.1383, 1.1732, 1.2087, 1.2448, 1.2815, 1.3189, 1.3568, 1.3955, 1.4349, 1.4751, 1.516, 1.5577, 1.6003, 1.6438, 1.6882, 1.7337, 1.7801, 1.8277];
% [ float(row.split(',')[2]) for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
% y = [0.4973, 0.5029, 0.5085, 0.5142, 0.5198, 0.5255, 0.5311, 0.5368, 0.5426, 0.5483, 0.5541, 0.5598, 0.5657, 0.5715, 0.5774, 0.5833, 0.5892, 0.5952, 0.6013, 0.6074, 0.6135];
% [ math.sqrt(x[i]**2 + y[i]**2) for i in xrange(0,21) ]
% LengthOfShadow = [];
% for i = 1:20
%     LengthOfShadow(end + 1) = sqrt(x(i)*x(i) + y(i)*y(i)); %#ok<SAGROW>
% end
LengthOfShadow = [3.6517, 3.6554, 3.6554];

Y = 2015; % Year
N = 294; % DayOfYear
syms Lg D;

% coefs = polyfit(time, LengthOfShadow, 2);
% parabola = @(x) coefs(1) * x * x + coefs(2) * x + coefs(3);

th = (39 + 54/60 + 26/3600)/180*pi; % Lat
% D = -(116 + 23/60 + 29/3600)/180*pi; % Long
chosen = [2, 3];

W = time(chosen(1));
Ly = LengthOfShadow(chosen(1));
De = -0.4092797 * cos(2 * pi / 365 * (N + 10)); % Solar Declination
TT = (W - 8) - 12/pi * D; % Real sun time
t = ((TT - 12) * 15)/180*pi; % Solar Angle
h = asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t));
cond1 = h >= 0;
cond2 = h <= pi/2;
eq1 = Lg/Ly == tan(h);

W = time(chosen(2));
Ly = LengthOfShadow(chosen(2));
De = -0.4092797 * cos(2 * pi / 365 * (N + 10)); % Solar Declination
TT = (W - 8) - 12/pi * D; % Real sun time
t = ((TT - 12) * 15)/180*pi; % Solar Angle
h = asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t));
cond3 = h >= 0;
cond4 = h <= pi/2;
eq2 = Lg/Ly == tan(h);

sol = solve(eq1, eq2, cond1, cond2, cond3, cond4);

% D = subs(sol.D);
% th = subs(sol.th);
% Lg = subs(sol.D);
% disp(double(D));
% disp(double(th));
disp(sol.D);
