function dif = ga_fun_test_2(X)
	% ga testing (using question 1 solution) (greatly speed enhance)
    time = 9:0.5:15;
    LengthOfShadow = [6.53415991147178,5.45619192404090,4.72402549146253,4.22274629845824,3.89414298118230,3.70845346757885,3.65174457880193,3.72018324701638,3.91843705774968,4.26161777943995,4.78149437850369,5.54007470613908,6.66029793612229];
    
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

