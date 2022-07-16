function [Kp,Fi,Td,max_hist,min_hist,t1,t2] = autotune_PID(y,time,y_prev,M,max_hist,min_hist,t1,t2)

    if y >= max_hist
        max_hist = y;
    end
    if y <= min_hist
        min_hist = y;
    end
    if y_prev >= max_hist && y <= y_prev && time < 8
        t1 = time-1;
    end
    if y_prev <= min_hist && y >= y_prev && time < 8
        t2 = time-1;
    end
    T_crit = 2*(t2-t1);
    A_crit = (max_hist-min_hist)/2;
    K_crit = 4*M/(pi*A_crit);
    Kp = 0.6*K_crit;
    Ti = T_crit/2;
    Fi = 1/Ti;
    Td = T_crit/8;
end