function [U,V,Fd_invx,Fd_invy] = plotG_Fd_hist(G,h,rele_M,axisxlim,axisylim)
    figure;
    w = 0.01:0.1:20;
    A = 0:0.1:20;
    
    [M,P] = bode(G,w);
    M = reshape(M,[length(M) 1]);
    P = reshape(P,[length(P) 1]);
    U = M.*cos(deg2rad(P));
    V = M.*sin(deg2rad(P));
    Fd_invx = real((-pi*A./(4*rele_M)).*sqrt(1-(ones(size(A))*h./A).^2));
    Fd_invy = -pi*h/(4*rele_M)*ones(size(Fd_invx));
    
    plot(U,V);
    hold on;
    plot(Fd_invx,Fd_invy);
    legend('G','F_d');
    grid on;
    xlim(axisxlim);
    ylim(axisylim);
end