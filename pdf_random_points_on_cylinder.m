function [ f ] = pdf_random_points_on_cylinder(rr, N, R, L)
%PDF_RANDOM_POINTS_ON_CYLINDER(rr, N, R, L) Generates the pdf of the NND 
%for N random points on a cylinder of length L and radius R.
%   rr is a vector with the points where the pdf should be evaluated.
%   Example use: 
%   rr = linspace(0,200,201);
%   N = 10;
%   L = 100;
%   R = 20;
%   f = pdf_random_points_on_cylinder(rr, N, R, L);
%   plot(rr, f)

% Author: Andreas V. Solbrå
% contact: a.v.solbra@fys.uio.no

n = length(rr);
F = zeros(1,n);
for i=1:n
    r = rr(i);
    r1 = linspace(0,min(L,r),n);
    h = (2/L)*(1-r1/L).*(2/pi).*asin(min(2*R, sqrt(r^2-r1.^2))/(2*R));
    F(i) = trapz(r1,h);
    
    
end



p = 1-F;
pN = p.^N;


dp = diff(1-pN)/(rr(2)-rr(1)); 
dp(end+1) = dp(end);

f = dp;


end

