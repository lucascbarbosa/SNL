clear all;
close all;
alpha = 1;
G = zpk([],[-2 -2 -2],8);
K = 5;
q = 0.5;
[U,V,Vm,w] = plotG_Gm(G,K,q,[-0.3 1.2],[-0.8 0.4]);
saveas(gcf,'imgs/questao27_G_Gm.png');