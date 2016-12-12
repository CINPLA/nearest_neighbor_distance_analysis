function [ neighbor_idx, nearest_dist, dist ] = NND( x )
%NND(x) finds the distances and indices of nearest neighbors
%   in a set of points, as well as a matrix containing all distances
%   Author: Andreas Våvang Solbrå
%   Date: 01-12-2015 (dd-mm-yyyy)
%
%   Description: 
%   Input matrix must be Nx3
%
%   Example: 
%   x = rand(4,3); 
%   [idx,nearest_dist, dist] = nearest_neighbor(x);
%   
% Author: Andreas V. Solbrå
% contact: a.v.solbra@fys.uio.no


if (size(x,2) ~= 3)
    msg = 'Input matrix has wrong dimensions! Must be Nx3.'; 
    error(msg)
end

y = pdist(x);
Y = squareform(y);
Y(logical(eye(size(Y)))) = Inf; 
[nearest_dist,neighbor_idx] = min(Y);
Y(logical(eye(size(Y)))) = 0;
dist=Y;
end

