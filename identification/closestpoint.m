function point = closestpoint(Y_star_end, Y_prog, dist)
dist_v = [dist, 0];
Y_star_end = Y_star_end + dist_v; 
dist2 = sum((Y_star_end - Y_prog).^2, 2);
L = min(dist2);
k = find(dist2 == min(dist2));
if(L == 0)
    k = k+4;
end
point = Y_prog(k, :);
if Y_prog(k, :) == Y_prog(end, :)
    point = Y_prog(k, :);
else
    if sum( (Y_star_end - Y_prog(k, :)).^2, 2) < sum( (Y_star_end - Y_prog(k+1, :)).^2, 2)
        if Y_star_end(:,1) > Y_prog(k,1)
            point = Y_prog(k+4, :);
        end
    end
end
end



