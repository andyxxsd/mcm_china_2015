clear, clc;
% Question 4 solution (use ga to calc solution)

A = [[-1,0,0,0],
[1,0,0,0],
[0,-1,0,0],
[0,1,0,0]];

out=fopen('t4.txt','w');

dif = 1e8;
lat = 0.;
long = 0.;
for i = 1:8
    b = [0, pi/2, pi, pi];
    x = ga(@t4_ga_fun, 4, A, b);
    if t4_ga_fun(x) < dif
        dif = t4_ga_fun(x);
        lat = x(1);
        long = x(2);
    end
    disp([lat, long, t4_ga_fun(x)]);
end
% disp([lat, long, Lg, 'CHOSEN FOR ', Lg_min]);
disp('-------------------------------------');
fprintf(out, '%f\r%f\r%f\n', lat, long);
