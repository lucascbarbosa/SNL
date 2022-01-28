clear all;
close all;
alpha = 1;
beta = 1;
G = zpk([-1/beta],[0 -1 -3],5);
K = 5;
q = 1;
s = tf('s');
G_ = G/(1+G*alpha);
[U,V,Vm,w] = plotG_Gm(G,K,q,[-2 2],[-2 2]);
% saveas(gcf,'imgs/questao29_G_.png')