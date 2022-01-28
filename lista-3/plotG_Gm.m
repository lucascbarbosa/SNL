function [U,V,Vm,w] = plotG_Gm(G,K,q,axisxlim,axisylim)
    figure;
    w = 0.01:0.001:10000;
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
    hold on;
    plot(U,Vm,'--');
    hold on;
    x = axisxlim(1):0.1:axisxlim(2);
    y = x/q + 1/K;
    plot(x,y);
    legend({'$\hat{G}$','$\hat{G}^m$','Popov'},'Interpreter','latex');
    grid on;
    xlim(axisxlim);
    ylim(axisylim);
end