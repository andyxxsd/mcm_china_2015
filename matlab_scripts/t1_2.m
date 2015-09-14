clear;
syms W;
% Question 1 attempt (angle unit mismatch) (spend: 4 hours)

%W = 12;
th = (39 + 54/60 + 26/3600)/180*pi; % Lat
D = -(116 + 23/60 + 29/3600)/180*pi; % Long
Y = 2015; % Year
N = 294; % DayOfYear
Lg = 3; % Length of the stick

De = -0.4092797 * cos(2*pi/365*(N+10)); % Solar Declination
TT = (W-8) - 12/pi * D; % Real sun time
t = ((TT - 12) * 15)/180*pi; % Solar Angle

% atan(Lg/Ly) == asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t)); % Solar height angle

h = asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t));

Ly = Lg / tan(h); % Length of shadow

disp(Ly);
ezplot(Ly, 9:15);
