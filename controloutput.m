function [u_opt] = controloutput(input_data, input_traj, A, B, C, S, Q, L, u_up, u_down, dist, n)
    input_data_end = input_data(end, 2:3);
    t0 = input_data(end,1);
    x_us = closestpoint(input_data_end, input_traj, dist, n);
    v = x_us(1,2);
    delta_t = ( x_us(1,1) - input_data(end,2) )/abs(v);
    T = t0 + delta_t;
    X_t0 = input_data(end, 2:3).';
    Fund = expblockmatrix(A, B, S, Q, T, t0);
    x_us = x_us.';
    Fint = expintblockmatrix(A, B, C, Q, S, T, t0, x_us);
    u_opt = optimizationmethod(Fund, Fint, A, L, Q, B, X_t0, x_us, u_up, u_down);
end