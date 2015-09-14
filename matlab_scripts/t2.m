clear;
% Question 2 attempt (direct solve equation) (answers too random and too inaccurate)

% [ float(row.split(',')[0].split(':')[0])+float(row.split(',')[0].split(':')[1])/60 for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
time = [14.7, 14.75, 14.8, 14.85, 14.9, 14.95, 15.0, 15.05, 15.1, 15.15, 15.2, 15.25, 15.3, 15.35, 15.4, 15.45, 15.5, 15.55, 15.6, 15.65, 15.7];
% [ float(row.split(',')[1]) for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
x = [1.0365, 1.0699, 1.1038, 1.1383, 1.1732, 1.2087, 1.2448, 1.2815, 1.3189, 1.3568, 1.3955, 1.4349, 1.4751, 1.516, 1.5577, 1.6003, 1.6438, 1.6882, 1.7337, 1.7801, 1.8277];
% [ float(row.split(',')[2]) for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
y = [0.4973, 0.5029, 0.5085, 0.5142, 0.5198, 0.5255, 0.5311, 0.5368, 0.5426, 0.5483, 0.5541, 0.5598, 0.5657, 0.5715, 0.5774, 0.5833, 0.5892, 0.5952, 0.6013, 0.6074, 0.6135];
% [ math.sqrt(x[i]**2 + y[i]**2) for i in xrange(0,21) ]
LengthOfShadow = [1.149625826084296, 1.1821989764840775, 1.215296955480429, 1.2490510517989248, 1.2831953397670988, 1.3179931486923595, 1.3533640493230192, 1.389387091490345, 1.4261528564638504, 1.4633998530818568, 1.5014816215991456, 1.5402318169678226, 1.5798533159758852, 1.6201445151590645, 1.6612706131151542, 1.7032906328633408, 1.7462059099659466, 1.790050915476987, 1.8350142724240595, 1.8808750011630226, 1.927918447445327];

Y = 2015; % Year
N = 107; % DayOfYear
syms th D Lg;

chosen = [9, 15, 20];

for i = chosen
    W = time(i);
    Ly = LengthOfShadow(i);
    L = D/15; % Longtitude Correction
    dN = (W + L)/24; % Delta of time
    N0 = 79.6764 + 0.2422 * (Y - 1985) - floor(0.25 * (Y - 1985));
    Ct = W; % Standard Time
    Lc = ((-120)-D*180/pi)*4/60; % Longtitude Correction 
    Tm = Ct + Lc; % Avg. real sun time

    Q = (2 * pi * 57.3 * (N + dN - N0) / 365.2422)/180*pi;
    Eq = (0.0028 - 1.9857 * sin(Q) + 9.9059 * sin(2 * Q) ...
        - 7.0924 * cos(Q) - 0.6882 * cos(2 * Q))/60; % Time equation

    TT = Tm + Eq; % Real sun time
    De = (0.3723 + 23.2567 * sin(Q) + 0.1149 * sin(2 * Q) ...
        - 0.1712 * sin(3 * Q) - 0.7580 * cos(Q) + 0.3656 * cos(2 * Q) ...
        + 0.0201 * cos(3 * Q))/180*pi; % Solar Declination

    t = ((TT - 12) * 15)/180*pi; % Solar Angle

    % atan(Lg/Ly) == asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t)); % Solar height angle

    if i == chosen(1)
        eq1 = atan(Lg/Ly) == abs(asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t)));
    elseif i == chosen(2)
        eq2 = atan(Lg/Ly) == abs(asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t)));
    elseif i == chosen(3)
        eq3 = atan(Lg/Ly) == abs(asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t)));
    end
end

sol = solve(eq1, eq2, eq3);

D = subs(sol.D);
th = subs(sol.th);
Lg = subs(sol.Lg);
disp(double(D*180/pi));
disp(double(th*180/pi));
disp(Lg);

L = D/15; % Longtitude Correction
dN = (W + L)/24; % Delta of time
N0 = 79.6764 + 0.2422 * (Y - 1985) - floor(0.25 * (Y - 1985));
Ct = W; % Standard Time
Lc = ((-120)-D*180/pi)*4/60; % Longtitude Correction 
Tm = Ct + Lc; % Avg. real sun time

Q = (2 * pi * 57.3 * (N + dN - N0) / 365.2422)/180*pi;
Eq = (0.0028 - 1.9857 * sin(Q) + 9.9059 * sin(2 * Q) ...
    - 7.0924 * cos(Q) - 0.6882 * cos(2 * Q))/60; % Time equation

TT = Tm + Eq; % Real sun time
De = (0.3723 + 23.2567 * sin(Q) + 0.1149 * sin(2 * Q) ...
    - 0.1712 * sin(3 * Q) - 0.7580 * cos(Q) + 0.3656 * cos(2 * Q) ...
    + 0.0201 * cos(3 * Q))/180*pi; % Solar Declination

t = ((TT - 12) * 15)/180*pi; % Solar Angle

h = asin(sin(th)*sin(De) + cos(th)*cos(De)*cos(t)); % Solar height angle
Ly = Lg / tan(h);
