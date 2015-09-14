function dif = t2_ga_fun(X)
	% Question 2 tool (ga optimization function)
    time = [14.7, 14.75, 14.8, 14.85, 14.9, 14.95, 15.0, 15.05, 15.1, 15.15, 15.2, 15.25, 15.3, 15.35, 15.4, 15.45, 15.5, 15.55, 15.6, 15.65, 15.7];
    LengthOfShadow = [1.149625826084296, 1.1821989764840775, 1.215296955480429, 1.2490510517989248, 1.2831953397670988, 1.3179931486923595, 1.3533640493230192, 1.389387091490345, 1.4261528564638504, 1.4633998530818568, 1.5014816215991456, 1.5402318169678226, 1.5798533159758852, 1.6201445151590645, 1.6612706131151542, 1.7032906328633408, 1.7462059099659466, 1.790050915476987, 1.8350142724240595, 1.8808750011630226, 1.927918447445327];

    lat = X(1);
    long = X(2);
    Lg = X(3);
    
    Y = 2015;
    N = 107;
    
    dif = 0;
    for i = 1:20
        Ly = shadow_length_calculator(Lg, lat, long, ...
            Y, N, time(i));
        dif = dif + (Ly - LengthOfShadow(i)) * (Ly - LengthOfShadow(i));
    end
end
