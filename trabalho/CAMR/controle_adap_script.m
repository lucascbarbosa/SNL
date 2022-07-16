close all;
clear all;

% reference
ref_pulse_T = 18;

ref_sin_freq = 1/ref_pulse_T;

switch_ref = 0;
ref = ["pulse" "sine"];
ref = ref(switch_ref+1);

% reference plant
am = -1;
bm = 1;

% real plant
ap = 1;
bp = 1;
b = 10;

% parameters
alpha = 1;
beta = 1;

out = sim('controle_adap',8*ref_pulse_T);

%optimal k and theta
k_opt = bm/bp;
theta_opt = (am-ap)/bp;

% Plots

% y,ym and r
figure;
plot(out.y)
hold on
plot(out.ym)
hold on
plot(out.r)
legend({'$y(t)$','$y_m(t)$','$r(t)$'},'Interpreter','latex')
xlabel({'$t$'},'Interpreter','latex')
title('Saída do sistema');
saveas(gcf,"imgs/yymr_"+ref+".png");

% k and theta
figure;
plot(out.K)
hold on 
plot(out.theta)
yline(k_opt,'-','$K^*$','Interpreter','latex');
yline(theta_opt,'-','$\theta^*$','Interpreter','latex');
legend({'$K$','$\theta$'},'Interpreter','latex');
xlabel({'$t$'},'Interpreter','latex');
title('Ganhos adaptativos');
saveas(gcf,"imgs/ktheta_"+ref+".png");

% v
figure;
plot(out.v);
xlabel({'$t$'},'Interpreter','latex');
title('Sinal de controle');
saveas(gcf,"imgs/v_"+ref+".png");

