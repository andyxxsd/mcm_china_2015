clear, clc;
% ga testing

A = [[-1,0,0,0,0,0,0,0],
[1,0,0,0,0,0,0,0],
[0,-1,0,0,0,0,0,0],
[0,1,0,0,0,0,0,0],
[0,0,-1,0,0,0,0,0],
[0,0,1,0,0,0,0,0],
[0,0,0,-1,0,0,0,0],
[0,0,0,1,0,0,0,0]];
b = [-0/180*pi, 60/180*pi, pi, pi, -2.5, 3.5, -293, 295];
% ga_fun_test([0.6,-2,3,294,0,0,0,0])
x = ga(@ga_fun_test_2, 8, A, b)

% -1.5718    0.8684    1.4580   31.7987
% 0.5318   -2.1347    2.7787   12.4969
% 0.9384   -2.0300    1.7485  294.9818
% 0.6980   -2.0313    2.9854  294.1720 