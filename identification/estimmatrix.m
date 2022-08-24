function [Af, Bf, Cf]  = estimmatrix(A, B, C, data)
%weights
Cw = [1, 1];
%optimize
%opt = optimset('PlotFcns', @optimplotfval, 'MaxIter', 1000);
x0 = [A(:); B(:); C(:)];
[x, ~] = fminsearch(@(x)residuestim(x, data, Cw), x0);
Af = reshape(x(1:4), [2, 2]);
Bf = reshape(x(5:6), [2, 1]);
Cf = reshape(x(7:end), [2, 1]);
end

