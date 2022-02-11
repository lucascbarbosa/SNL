close all;
clear all;

%% Variables
s=tf('s');
G=exp(-s)*zpk([],[-1 -2 -3],6);
R = 1; %reference
%% K prop
K_crit =2.11; %rlocus
T_estr=4.92; %secs
%% PID
Kp=0.6*K_crit;
Ti=T_estr/2;
Fi = 1/Ti;
Td=T_estr/8;

%% relé
M=5;

%% relay
A = 6.2/2;
T_estr_relay = 4.4;
K_critr_relay = 4*M/(pi*A);
Kp_relay = 0.6*K_critr_relay;
Ti_relay = T_estr_relay/2;
Td_relay = T_estr_relay/8;

%% autotuning

out = sim('PID_auto.slx',40);

%% plots
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

figure;
plot(out.y_PID_auto);
hold on;
plot(out.D_auto);
xlabel({'$t$'},'Interpreter','latex');
ylabel('y');
title("Resposta para controle por PID autoajustável com distúrbio");
yline(R);
legend({'$y_{auto}$','$D_{auto}$','Rerence'},'Interpreter','latex');
