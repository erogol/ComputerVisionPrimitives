function [accel_C cpu_Time gpu_Time] = comparePerformance2C(elements, attributes, numClusters)
% function [acce_C] = comparePerformance2C(M, N, K)
%
% Generates an M-by-N random dataset and runs two versions of k-means,
% a serial and on the cpu writen in C and a parallel one on the GPU using the same 
% starting K centroids and the same number of iterations. 
% It compares the execution time of the two versions 
% and returns the GPU acceleration.
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr


dataset = 100*rand(elements, attributes) - 50;
Objects = size(dataset, 1);
dataset_gpu= [dataset; dataset(1:ceil(Objects/128)*128 - Objects,:)];

    
init_cemtroids = dataset(ceil(elements*rand(numClusters, 1)),:);


[Centroids_gpu Indx_gpu SizeofClusters_gpu gpu_Time] = cudaKmeans_Timedemo(single(dataset_gpu), single(dataset_gpu'), numClusters, single(init_cemtroids'));



[Centroids_cpu Indx_cpu SizeofClusters_cpu cpu_Time] = kmeans_serial_Timedemo(single(dataset'), numClusters, single(init_cemtroids'));


accel_C = cpu_Time / gpu_Time;


end