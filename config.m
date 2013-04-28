addpath(genpath('utils'));
addpath(genpath('vlfeat-0.9.16'));
addpath(genpath('gpu_kmeans_v1.0'));

run vlfeat-0.9.16/toolbox/vl_setup
try
    matlabpool;
catch
    display('Matlab instances are already active');
end