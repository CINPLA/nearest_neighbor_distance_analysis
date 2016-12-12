function [h, g, M_E, M_R, M_O] = NND_analysis( points, R, L )
%NND_ANALYSIS This analyses the distribution of points on the surface
%of a cylinder of radius R and length L.
%   points must be an Mx3 matrix containing all positions of the points
%   R is the radius of the cylinder
%   L is the length of the cylinder
% Author: Andreas V. Solbrå
% contact: a.v.solbra@fys.uio.no

N = length(points);

[ neighbor_idx, nearest_dist, dist] = NND(points);
M_E = mean(nearest_dist);

rr = linspace(0, 2*max(nearest_dist));
[ f ] = pdf_random_points_on_cylinder(rr, N, R, L);
M_R = trapz(rr, rr.*f);

M_O = NND_optimal_distribution( L,R,N );

g = (M_E - M_R)/(M_O - M_R);

h = histogram(nearest_dist, 'normalization', 'pdf'); 
hold on
plot(rr, f, 'linewidth', 2)
plot([M_E,M_E], [0,0.1], 'k-')
plot([M_R,M_R], [0,0.1], 'k--')
plot([M_O,M_O], [0,0.1], 'k:')
l = legend('Data', 'Random', 'Average distance', 'Expected value (random)', 'Expected value (uniform)'); 
set(l, 'fontsize', 12)
end

