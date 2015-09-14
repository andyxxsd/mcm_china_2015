clear, clc;
% 0.504278 -1.504183 2.186512 102.986708 2 2 (28.8930011013, -86.1833375153, 西藏自治区日喀则地区聂拉木县) 0.0
% 0.711311 -1.439355 2.124679 191.374165 3 2 (40.7551182212, -82.4689667211, 新疆维吾尔自治区阿克苏地区沙雅县) 4.50059515808
% 0.644784 -1.620742 3.079904 197.013940 3 3 (36.9434018976, -92.8616762796, 青海省海西蒙古族藏族自治州格尔木市) 3.76251303906
time = [12.683333333333334, 12.733333333333333, 12.783333333333333, 12.833333333333334, 12.883333333333333, 12.933333333333334, 12.983333333333333, 13.033333333333333, 13.083333333333334, 13.133333333333333, 13.183333333333334, 13.233333333333333, 13.283333333333333, 13.333333333333334, 13.383333333333333, 13.433333333333334, 13.483333333333333, 13.533333333333333, 13.583333333333334, 13.633333333333333, 13.683333333333334];
LengthOfShadow = [1.2472562046347977, 1.2227945902726263, 1.198921486169966, 1.1754289642509241, 1.1524395732531925, 1.1299174704375536, 1.1078354796629324, 1.0862542059757467, 1.0650810720316084, 1.0444462647738273, 1.024264126092484, 1.0046403137441777, 0.9854909081265032, 0.9667904943678335, 0.9485847352767173, 0.9309278812024055, 0.9137517496563277, 0.897109051342143, 0.8809737623788804, 0.8654922587753169, 0.8505044679482877];

syms W

x = 12.6:0.1:13.8
y1 = @(x) double(subs(shadow_length_calculator(2.186512, 0.504278, -1.504183, 2015, 102.986708, W), x))
y2 = @(x) double(subs(shadow_length_calculator(2.124679, 0.711311, -1.439355, 2015, 191.374165, W), x))
y3 = @(x) double(subs(shadow_length_calculator(3.079904, 0.644784, -1.620742, 2015, 197.013940, W), x))

plot(x, y1(x), 'r-', x, y2(x), 'g-', x, y3(x), 'b-', time, LengthOfShadow, 'r^')
xlabel('\fontsize{14} W \rightarrow');
ylabel('\fontsize{14} Ly \rightarrow');
title('')