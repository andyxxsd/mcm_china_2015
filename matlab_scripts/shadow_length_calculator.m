function Ly = shadow_length_calculator(Lg, th, D, Y, N, W)
	% core (reference our paper plz)
    L = D/15; % Long Correction
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
    Ly = Lg / tan(h); % Length of shadow
end