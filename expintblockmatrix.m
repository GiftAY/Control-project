function [Fint] = expintblockmatrix(A, B, C, Q, S, T, t0, x_us) 
    %S for x, Q for u
    N = [C; -S*x_us];
    M = [A B*Q.^(-1)*B.'; S -A.'];
    Fint =  integral(@(t) expm(M.*t)*N, t0, T, 'ArrayValued', true);
end