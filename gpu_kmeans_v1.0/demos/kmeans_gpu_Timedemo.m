function [Centroids Indx SizeofClusters gpu_Time] = kmeans_gpu_Timedemo(dataset, numClusters)
%K-means Clustering using the gpu
% Same as kmeans_gpu(...) but uses a version of the program that runs 
% always for 50 iterations. To be used only for Performance Tests.
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr


    Objects  = size(dataset,1);
    dataset = [dataset; dataset(1:ceil(Objects/128)*128 - Objects,:)];
    
    [Centroids Indx SizeofClusters gpu_Time] = cudaKmeans_Timedemo(single(dataset), single(dataset'), numClusters);
    
    
    Centroids = Centroids';
    u = unique(Indx(Objects+1:end)) + 1;
    SizeofClusters(u) = SizeofClusters(u) - hist(Indx(Objects+1:end), unique(Indx(Objects+1:end)))';
    Indx = Indx(1:Objects);

end