close all
clear

%% Variables
s=tf('s');
G=6*exp(-s)/((s+1)*(s+2)*(s+3));

%% K prop
k_estr=2.1; %val achado no simulink
T_estr=4.9; %sec
%% PID
Kp=0.6*k_estr;
Ti=T_estr/2;
Td=T_estr/8;
%% relé
M=5;

%% switch
A=6.3/2;
T_estr=4.9;
K_estr=4*M/(pi*A);
Kp_s=0.6*k_estr;
Ti_s=T_estr/2;
Td_s=T_estr/8;




% for i =1:0.1:2.2
%     k=i;
%     out = sim('PID_simulink.slx',100);
%     if abs(out.y.signals.values(end))<3
%         converg=abs(out.y.signals.values(end)-out.y.signals.values(end-2));
%         if converg>0.01
%             k_estr=k;
%             Break
%         end
%     end
% end
