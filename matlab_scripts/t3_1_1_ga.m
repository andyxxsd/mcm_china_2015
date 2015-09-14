clear, clc;

A = [[-1,0,0,0,0,0,0,0],
[1,0,0,0,0,0,0,0],
[0,-1,0,0,0,0,0,0],
[0,1,0,0,0,0,0,0],
[0,0,-1,0,0,0,0,0],
[0,0,1,0,0,0,0,0],
[0,0,0,-1,0,0,0,0],
[0,0,0,1,0,0,0,0]];

% Data for 2015
season_begin_date = [0, 91, 182, 274, 365]

out=fopen('t3_1.txt','w');

for season = 1:4
	for Lg_min = 0:1:3
	    dif = 1e8;
	    lat = 0.;
	    long = 0.;
	    Lg = 0.;
	    N = 0.;
	    for i = 1:4
	        b = [pi/2, pi/2, pi, pi, -Lg_min, Lg_min+1, -season_begin_date(season), season_begin_date(season+1)];
	        x = ga(@t3_1_ga_fun, 8, A, b);
	        if t3_1_ga_fun(x) < dif
	            dif = t3_1_ga_fun(x);
	            lat = x(1);
	            long = x(2);
	            Lg = x(3);
	            N = x(4);
	        end
	        disp([lat, long, Lg, N, season, Lg_min, dif]);
	    end
	    disp([lat, long, Lg, N, 'CHOSEN FOR ', Lg_min]);
	    fprintf(out, '%f\r%f\r%f\r%f\r%d\r%d\n', lat, long, Lg, N, season, Lg_min);
	end
end