function dy = linearmodeln(t, y, A, B, C, data)
u = data( sum( data(:, 1) <= t ), 4)';
dy = A*y + B*u + C;
end