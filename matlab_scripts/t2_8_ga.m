clear, clc;
% Question 2 solution (use ga to calc solution, and divide into several part by the length of stick) (which greatly influence the longitude)

A = [[-1,0,0,0,0,0],
[1,0,0,0,0,0],
[0,-1,0,0,0,0],
[0,1,0,0,0,0],
[0,0,-1,0,0,0],
[0,0,1,0,0,0]];

out=fopen('t2.txt','w');

for Lg_min = 0:1:3
    dif = 1e8;
    lat = 0.;
    long = 0.;
    Lg = 0.;
    for i = 1:4
        b = [pi/2, pi/2, pi, pi, -Lg_min, Lg_min+1];
        x = ga(@t2_ga_fun, 6, A, b);
        if t2_ga_fun(x) < dif
            dif = t2_ga_fun(x);
            lat = x(1);
            long = x(2);
            Lg = x(3);
        end
        disp([lat, long, Lg, Lg_min, dif]);
    end
    disp([lat, long, Lg, 'CHOSEN FOR ', Lg_min]);
    fprintf(out, '%f\r%f\r%f\n', lat, long, Lg);
end