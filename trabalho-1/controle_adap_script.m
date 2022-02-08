close all;
clear all;

% reference
ref_pulse_T = 18;

ref_sin_freq = 1/ref_pulse_T;

switch_ref = 0;

% reference plant
am = 5;
bm = 1;

% real plant
ap = 1;
bp = 1;


% parameters
alpha = 1;
beta = 1;

out = sim('controle_adap',ref_pulse_T+2);


%optimal k and theta
k_opt = bm/bp;
theta_opt = (am-ap)/bp;

% Plots
% y,ym and r
plot(out.y)
hold on
plot(out.ym)
hold on
plot(out.r)
title({'$y(t),y_m(t),r(t)$'},'Interpreter','latex')
xtitle({'$t$'},'Interpreter','latex')
