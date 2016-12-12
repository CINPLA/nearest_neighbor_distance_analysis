function d= NND_optimal_distribution( L,R,N )
%UNIFORM_DISTANCE(L,R,N) Finds the NND for N points on a cylinder of length
%L and radius R, if the points are spread out on a d
%   

% Author: Andreas V. Solbrå
% contact: a.v.solbra@fys.uio.no

C = 2*pi*R; 
A = L*C;

r = C/L;

Nx = round(sqrt(N/r));
Ny = round(Nx*r);

dx = L/Nx; 
dy = C/Ny; 

d = mean([dx,dy]);


end

