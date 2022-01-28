function [U,V,Fd_invx,Fd_invy] = plotG_Fd_ideal(G,rele_M,axisxlim,axisylim)
    figure;
    w = 0.01:0.01:100;
    A = 0:0.01:100;
    
    [M,P] = bode(G,w);
    M = reshape(M,[length(M) 1]);
    P = reshape(P,[length(P) 1]);
    U = M.*cos(deg2rad(P));
    V = M.*sin(deg2rad(P));
    Fd_invx = -pi*A/(4*rele_M);
    Fd_invy = 0*ones(size(Fd_invx));
    
    plot(U,V);
    hold on;
    plot(Fd_invx,Fd_invy);
    legend('G','F_d');
    grid on;
    xlim(axisxlim);
    ylim(axisylim);
end