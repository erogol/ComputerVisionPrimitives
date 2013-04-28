function [] = plot3D(dataset, Index, numClusters)
% function [] = plot3D(dataset, Index, numClusters)
%
% Presents the result of k-means clustering according
% to the cluster index of the initial dataset in a 3D plot
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr

if size(dataset, 2)~=3
   error('The data must be 3D'); 
end

colors = ['r' 'g' 'b' 'k' 'm' 'y'];

if numClusters > length(colors)
   error(['To many clusters. Number of clusters must be less than or equal to ' num2str(length(colors))]); 
end

figure
for i=1:numClusters
    plot3(dataset(Index == i,1), dataset(Index == i,2), dataset(Index == i, 3), ['o' colors(i)]);
    hold on
end 
hold off

end