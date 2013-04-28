function [] = plot2D(dataset, Index, numClusters)
% function [] = plot2D(dataset, Index, numClusters)
%
% Presents the result of k-means clustering according
% to the cluster index of the initial dataset in a 2D plot
%
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr

if size(dataset, 2)~=2
   error('The data must be 2D'); 
end

colors = ['r' 'g' 'b' 'k' 'm' 'y'];

if numClusters > length(colors)
   error(['To many clusters. Number of clusters must be less than or equal to ' num2str(length(colors))]); 
end

figure
for i=1:numClusters
    plot(dataset(Index == i,1), dataset(Index == i,2),['o' colors(i)]);
    hold on
end 
hold off

end