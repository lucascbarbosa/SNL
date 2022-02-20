clear all;
close all;
alpha = 1;
beta = 1;
G = zpk([],[0 -1 -4],5);
K = 5;
q = 1;
s = tf('s');
G_ = G/(1+G*alpha+beta*s);
[U,V,Vm,w] = plotG_Gm(G_,K,q,[-15 6],[-20 4]);
saveas(gcf,'imgs/questao28_G_.png')