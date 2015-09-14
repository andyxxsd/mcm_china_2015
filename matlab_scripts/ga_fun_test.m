function dif = ga_fun_test(X)
	% ga testing (using question 1 solution)
    syms W
    time = 9:0.5:15;
    LengthOfShadow = subs(shadow_length_calculator(3, 0.6965, -2.0314, 2015, 294, W), 9:0.5:15);
    
    lat = X(1);
    long = X(2);
    Lg = X(3);
    N = X(4);

    Y = 2015;
    
    dif = 0;
    for i = 1:length(time)
        Ly = shadow_length_calculator(Lg, lat, long, ...
            Y, N, time(i));
        dif = dif + (Ly - LengthOfShadow(i)) * (Ly - LengthOfShadow(i));
    end
end
