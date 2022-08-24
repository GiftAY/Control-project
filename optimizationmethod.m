function [u_opt] = optimizationmethod(Fund, Fint, A, L, Q, B, X_t0, x_us, u_up, u_down)
    %S for x, Q for u, L for x_t1
    F_xx = Fund(1:size(A,1), 1:size(A,1));
    F_xp = Fund(1:size(A,1), size(A,1)+1:end);
    F_px = Fund(size(A,1)+1:end, 1:size(A,1));
    F_pp = Fund(size(A,1)+1:end, size(A,1)+1:end);
    grid
    Fint_x = Fint(1:size(A,1),1);
    Fint_p = Fint(size(A,1)+1:end,1);
    Psi_t0 = (F_pp + L*F_xp)^(-1)*(L*x_us - (L*F_xx + F_px)*X_t0 - L*Fint_x - Fint_p);
    Psi_T = F_px*X_t0 +  F_pp*Psi_t0 + Fint_p;
    grid
    u_opt = Q.^(-1)*B.'*Psi_T;
    if(u_opt > u_up) 
        u_opt = u_up; 
    elseif(u_opt < u_down) 
        u_opt = u_down;
    end
end
