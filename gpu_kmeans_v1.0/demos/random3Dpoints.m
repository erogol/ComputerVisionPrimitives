function [] = random3Dpoints(elements, numClusters)
% function [] = random3Dpoints(M, K)
%
% Patritions a random array of M-by-3 into K Clusters
% using GPU k-means toolbox. The result is presented  
% in a 3D plot
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr

Attributes = 3;

dataset = 100*rand(elements, Attributes) - 50;

[centroids Index] = kmeans_gpu(dataset, numClusters);

plot3D(dataset, Index, numClusters)


end