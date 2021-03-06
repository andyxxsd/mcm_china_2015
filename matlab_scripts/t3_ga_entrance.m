clear, clc;
% Question 3 tool (ga performance adjust) (parameter finding)

A = [[-1,0,0,0,0,0,0,0],
[1,0,0,0,0,0,0,0],
[0,-1,0,0,0,0,0,0],
[0,1,0,0,0,0,0,0],
[0,0,-1,0,0,0,0,0],
[0,0,1,0,0,0,0,0],
[0,0,0,-1,0,0,0,0],
[0,0,0,1,0,0,0,0]];
b = [pi/2, pi/2, 100/180*pi, -60/180*pi, -0.5, 1.3, 0, 365];

x = ga(@t3_1_ga_fun, 8, A, b)

% Rough Data
% -0.7760   -0.8618    0.7599   28.6352
% 0.6078   -1.1088    1.0633  102.7831
% -0.6638   -1.0907    1.0002   44.5318
% -------------------------------------

% Lg = 0.7 ~ 1.9
% 0.3369   -1.2952
% 0.4121   -1.2424    1.0563   65.5030
% 0.3303   -1.2573    1.0336   50.8519
% -0.1300   -1.1588    0.9817  159.3981
% -------------------------------------

% Lg = 0.5 ~ 1.3
% 0.3957   -1.2164    0.9497   56.9511
% -0.6840   -1.0535    0.9654   40.2432
% 0.2943   -1.2080    0.8890   34.3234 
