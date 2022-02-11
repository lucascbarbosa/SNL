close all;
clear all;

%% Variables
s=tf('s');
G=exp(-s)*zpk([],[-1 -2 -3],6);
R = 1; %reference
%% K prop
K_est =2.11; %rlocus
T_estr=4.92; %secs
%% PID
Kp=0.6*K_est;
Ti=T_estr/2;
Fi = 1/Ti;
Td=T_estr/8;

%% relé
M=5;

%% relay
A = 6.2/2;
T_estr_s = 4.4;
K_estr_s = 4*M/(pi*A);
Kp_s = 0.6*K_estr_s;
Ti_s = T_estr_s/2;
Td_s = T_estr_s/8;

out = sim('PID_auto2.slx',30);

%Plots
figure;
plot(out.y_PID);
xlabel({'$t$'},'Interpreter','latex');
ylabel('y');
title("Resposta para $K_p^*$",'Interpreter','latex');
yline(R,'label','Reference')

figure;
plot(out.y_relay);
xlabel({'$t$'},'Interpreter','latex');
ylabel('y');
title("Resposta para controle por relay");
yline(R,'label','Reference')
