function J = residuestim(x, data, Cw)
A = reshape(x(1:4), [2, 2]);
B = reshape(x(5:6), [2, 1]);
C = reshape(x(7:end), [2, 1]);
[x,y] = ode45(@(t,y)linearmodeln(t, y, A, B, C, data), [min(data(:,1)), max(data(:,1))], data(1,2:3));
X = spline(x.',y.', data(:,1));
J = sum(sum((data(:, 2:3) - X.').^2).*Cw);
end