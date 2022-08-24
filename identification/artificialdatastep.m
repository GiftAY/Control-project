function [artificial_data] = artificialdatastep(velocity, coordinate, amplitude, dt, max_time, initial_t)
    filename = 'Artificialdata.csv';
    fid = fopen(filename, 'w');
    t = initial_t;
    n = 1;
    for k = 0:dt:max_time
        n = n + 1;
        r =  0.01 + (0.02 - 0.01)*rand(1,1);
        u = amplitude*sin(t/max_time) + r; %control
        t  = t + dt;
        coordinate = coordinate + velocity*dt;
      if(n >= 300)
        u = r;
      else
         velocity = velocity + u*dt;
      end
        %+ (-1 + (1-1)*rand(1,1)) v:(-0.1 + (0.1+0.1)*rand(1,1))
         fprintf(fid, ['%d', ',' , '%d', ',', '%d', ',' , '%d', '\n'], k, coordinate + (-0.1 + (0.1-0.1)*rand(1,1)), ...
         velocity + (-0.01 + (0.01+0.01)*rand(1,1)), u);
    end
    artificial_data = readmatrix('Artificialdata.csv');
end
%end
