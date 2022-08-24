clear all
clc
    initial_v = 0;
    initial_x = 0;
    amplitude = 0.5;
    dt = 0.1;
    max_time = 70;
    initial_t = 0;
    artificial_data = artificialdatastep(initial_v, initial_x, amplitude, dt, max_time, initial_t);
% % graph x(t)
%     figure
%     plot(artificial_data(:,1), artificial_data(:,2), '-'); 
%     xlabel('t'); ylabel('x'); grid
%     %graph v(t)
%     figure
%     plot(artificial_data(:,1), artificial_data(:,3), '-'); 
%     xlabel('t'); ylabel('v'); grid
%     %graph u(t)
%     figure
%     plot(artificial_data(:,1), artificial_data(:,4), '-'); 
%     xlabel('t'); ylabel('v'); grid

%estimate matrix
%initial matrix
    A = [1 0; 0 0]; B = [0; 1]; C = [0; 0];
    [Ae, Be, Ce] = estimmatrix(A,B,C, artificial_data(1:100, :));
%check of the estimation
    t = [min(artificial_data(1:100,1)), max(artificial_data(1:100,1))];
    [x,y]  = ode45(@(t,y)linearmodeln(t, y, Ae, Be, Ce, artificial_data(1:100, :)), t, artificial_data(1,2:3)');
    X = spline(x', y',artificial_data(1:100,1));
    dy = artificial_data(1:100,2:3) - X.';
    figure
    plot(artificial_data(1:100,2), artificial_data(1:100,3), X(1,1:100), X(2,1:100));
    legend('artificial', 'estimate'); xlabel('x'); ylabel('v'); grid;
%%%%%%%parametres%%%%%%%%%%
    S =[1 0; 0 1]; Q = 1; L = eye(size(Ae)); d = 0; % delta_t;

filename = 'Simulation_data_predict.csv';
fid_predict = fopen(filename, 'w');

for k=1:1:40

end







