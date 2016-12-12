% This is a small test of the function pdf_random_points_on_cylinder, which 
% finds the pdf of the nearest neighbor distance for random points on a 
% cylinder. We run a Monte Carlo simulation and compare it to the analytic
% expression.
%
% Author: Andreas V. Solbrå
% contact: a.v.solbra@fys.uio.no

length = 546;  %length of fiber 
radius = 20.8;   %radius of fiber
circumference = 2*radius*pi; 

n_nuclei = 37; 
n_experiments = 10000;

distlist = zeros(n_experiments, n_nuclei-2);
for i=1:n_experiments
    x = sort(length*rand(n_nuclei,1));
    phi = 2*pi*rand(n_nuclei,1);
    y = radius*sin(phi);
    z = radius*cos(phi);
    xyz=[x,y,z];
    [ neighbor_idx, nearest_dist, dist ] = nearest_neighbor( xyz );
    distlist(i,:) = nearest_dist(2:end-1);
end
distlist = reshape(distlist,[],1);
figure
histogram(distlist, 400, 'normalization', 'pdf')

l = n_nuclei/(length*circumference);

rr = linspace(0,100,1001); 
f = pdf_random_points_on_cylinder(rr, n_nuclei, radius, length);

hold on 
plot(rr,f,'r', 'linewidth', 2)