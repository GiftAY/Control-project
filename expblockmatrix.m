function [Fund] = expblockmatrix(A, B, S, Q, T, t0)
    %S for x, Q for u
    M = [A B*Q.^(-1)*B.'; S -A.'];
    Fund = expm(M*(T-t0));
end
