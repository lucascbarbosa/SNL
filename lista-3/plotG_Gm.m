function [U,V,Vm,w] = plotG_Gm(G,K,q)
close all;
figure;
w = 0:0.1:10;
[M,P] = bode(G,w);
M = reshape(M,[length(M) 1]);
P = reshape(P,[length(P) 1]);
U = M.*cos(deg2rad(P));
V = M.*sin(deg2rad(P));
Um = U;
for i=1:length(V)
    Vm(i) = w(i)*V(i);
end
Vm = Vm';
plot(U,V);
xlim([-1 1]);
ylim([-1 1]);
hold on;
plot(U,Vm,'--');
hold on;
x = -5:0.1:5;
y = x/q + 1/K;
plot(x,y);
legend('G','G^m','Popov');
grid on;
end