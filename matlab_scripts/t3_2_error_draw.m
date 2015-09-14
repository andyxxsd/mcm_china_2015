clear, clc;
% 0.497622 -1.956489 2.877535 11.012725 1 1.5 (28.5116403929, 112.098562364, ???????????????????????????) 0.0
% 0.664148 -1.824183 6.423762 103.220454 2 6 (38.0528773721, 104.51798696, ?????????????????????????????????????????????) 0.1067
% 0.439697 -1.780341 4.827020 294.774313 4 4.5 (25.1927823646, 102.006025394, ???????????????????????????????????????) 0.0
time = [13.15, 13.2, 13.25, 13.3, 13.35, 13.4, 13.45, 13.5, 13.55, 13.6, 13.65, 13.7, 13.75, 13.8, 13.85, 13.9, 13.95, 14.0, 14.05, 14.1, 14.15];
LengthOfShadow = [3.5331421836659787, 3.546768028783388, 3.561797643044871, 3.5781007154634423, 3.5957507825209465, 3.614934280177165, 3.635425983292742, 3.657218272129789, 3.68054111510794, 3.7051678356047515, 3.731278025020382, 3.7589179107823036, 3.7880878883679556, 3.818701014743102, 3.8508096187685, 3.884585219814337, 3.9199118280900147, 3.9568759924971113, 3.9955347902377225, 4.0357508347270405, 4.077863059250519];
    
syms W

x = 13.1:0.1:14.2
y1 = @(x) double(subs(shadow_length_calculator(2.877535, 0.497622, -1.956489, 2015, 11.012725, W), x))
y2 = @(x) double(subs(shadow_length_calculator(6.423762, 0.664148, -1.824183, 2015, 103.220454, W), x))
y3 = @(x) double(subs(shadow_length_calculator(4.827020, 0.439697, -1.780341, 2015, 294.774313, W), x))

plot(x, y1(x), 'r-', x, y2(x), 'g-', x, y3(x), 'b-', time, LengthOfShadow, 'r^')
xlabel('\fontsize{14} W \rightarrow');
ylabel('\fontsize{14} Ly \rightarrow');
title('')
