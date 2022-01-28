clear all;
close all;
alpha = 1;
s = tf('s');
G = (1-alpha*s)/(1+alpha*s)^2;
K = 1;
q = 0.5;
[U,V,Vm,w] = plotG_Gm(G,K,q,[-1 1],[-1 1]);
saveas(gcf,'imgs/questao26_G_Gm.png');