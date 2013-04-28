function [ KDTREE ] = createKdtree( TEXTONS )
%if ~exist('KDTREE.mat','file')
    display('KD_TREE is being created!');
    KDTREE= vl_kdtreebuild(TEXTONS') ;
%     save('KDTREE','KDTREE','-v7.3');
% else
%     if ~exist('KDTREE','var')
%         display('KDTREE is loaded!');
%         load('KDTREE.mat');
%     end
% end
end

