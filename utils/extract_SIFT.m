function [ feats ] = extract_SIFT( images,grid_size )
%EXTRACT_SIFT Summary of this function goes here
%   Detailed explanation goes here
% rand_index = randperm(200);
% images = images(rand_index);

%num_img = size(images,2);
num_img = size(images,1);
feats = [];
display('SIFT is extrating from images...');
parfor i = 1:num_img
    fprintf('Extraction for image %d \n',i);
    %img = images{i};
    %img = single(img);
    img = single(images(i,:));
    
%     binSize = 8 ;
%     magnif = 3 ;
    %Is = vl_imsmooth(img, sqrt((binSize/magnif)^2 - .25)) ;
    
    %[f, d] = vl_dsift(reshape(Is,256,256), 'size', binSize) ;
    %f(3,:) = binSize/magnif ;
    %f(4,:) = 0 ;
    %[f_, d_] = vl_sift(img, 'frames', f) ;
    [f,d] = vl_phow(reshape(img,256,256));
    %[f,d] = vl_phow(reshape(img,256,256),'size',grid_size);
    d = d';
    if(size(d,1) ~= 0)
        feats(i,:) = d(:);
    end
end
display('SIFT extration end...');
end

