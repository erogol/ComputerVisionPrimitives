function [accel_matlab cpu_Time gpu_Time] = comparePerformance2matlab(elements, attributes, numClusters)
% function [acce_matlab] = comparePerformance2matlab(M, N, K)
%
% Generates an M-by-N random dataset and runs two versions of k-means,
% The matlab kmeans(...) function (Statistics Toolbox) and a parallel one 
% on the GPU using the same number of clusters K and for the same number of iterations. 
% It compares the execution time of the two versions 
% and returns the GPU acceleration.
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr


dataset = 100*rand(elements, attributes) - 50;
Objects = size(dataset, 1);
dataset_gpu= [dataset; dataset(1:ceil(Objects/128)*128 - Objects,:)];

    
tic
[Centroids_gpu Indx_gpu SizeofClusters_gpu gpu_Time1] = kmeans_gpu_Timedemo(dataset_gpu, numClusters);
gpu_Time = toc;


opts = statset('MaxIter', 50);

tic
Id = kmeans(dataset, numClusters, 'options', opts);
cpu_Time = toc;

accel_matlab = cpu_Time / gpu_Time;


end