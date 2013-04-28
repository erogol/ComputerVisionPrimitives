function [] = random2Dpoints(elements, numClusters)
% function [] = random2Dpoints(M, K)
%
% Patritions a random array of M-by-2 into K Clusters
% using GPU k-means toolbox. The result is presented  
% in a 2D plot
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr

Attributes = 2;

dataset = 100*rand(elements, Attributes) - 50;

[centroids Index] = kmeans_gpu(dataset, numClusters);

plot2D(dataset, Index, numClusters);

end
