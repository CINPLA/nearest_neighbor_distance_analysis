%This is a test program to showcase the NND analysis. We load an 
%experimental dataset and run the analysis on the dataset.
%
% Author: Andreas V. Solbrå
% contact: a.v.solbra@fys.uio.no

close all; clear all;

load example_points;
NND_analysis(xyz, R, L);