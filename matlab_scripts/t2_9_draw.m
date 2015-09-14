clear;
% Question 2 attempt (got the longitude, polyfit the [x, y]) (found polyfit realy inaccurative)


% [ float(row.split(',')[0].split(':')[0])+float(row.split(',')[0].split(':')[1])/60 for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
time = [14.7, 14.75, 14.8, 14.85, 14.9, 14.95, 15.0, 15.05, 15.1, 15.15, 15.2, 15.25, 15.3, 15.35, 15.4, 15.45, 15.5, 15.55, 15.6, 15.65, 15.7];
% [ float(row.split(',')[1]) for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
x = [1.0365, 1.0699, 1.1038, 1.1383, 1.1732, 1.2087, 1.2448, 1.2815, 1.3189, 1.3568, 1.3955, 1.4349, 1.4751, 1.516, 1.5577, 1.6003, 1.6438, 1.6882, 1.7337, 1.7801, 1.8277];
% [ float(row.split(',')[2]) for row in open('data/appendix_1.csv').read().split('\r\n')[3:] ]
y = [0.4973, 0.5029, 0.5085, 0.5142, 0.5198, 0.5255, 0.5311, 0.5368, 0.5426, 0.5483, 0.5541, 0.5598, 0.5657, 0.5715, 0.5774, 0.5833, 0.5892, 0.5952, 0.6013, 0.6074, 0.6135];
% [ math.sqrt(x[i]**2 + y[i]**2) for i in xrange(0,21) ]
LengthOfShadow = [1.149625826084296, 1.1821989764840775, 1.215296955480429, 1.2490510517989248, 1.2831953397670988, 1.3179931486923595, 1.3533640493230192, 1.389387091490345, 1.4261528564638504, 1.4633998530818568, 1.5014816215991456, 1.5402318169678226, 1.5798533159758852, 1.6201445151590645, 1.6612706131151542, 1.7032906328633408, 1.7462059099659466, 1.790050915476987, 1.8350142724240595, 1.8808750011630226, 1.927918447445327];

syms x_min;
coefs = polyfit(time, LengthOfShadow, 2);
parabola =coefs(1) * x_min * x_min + coefs(2) * x_min + coefs(3);

ezplot(parabola, 12:16)
dy = diff(parabola);
x_min = solve(dy);
W = double(x_min);

hold on
plot(W, double(subs(parabola, W)), 'ro');
text(12.6, 0.7, sprintf('\\fontsize{12}W=%f', W));
text(12.6, 0.6, sprintf('\\fontsize{12}Ly=%f', double(subs(parabola, W))));
xlabel('\fontsize{14} W \rightarrow');
ylabel('\fontsize{14} Ly \rightarrow');
title('')
