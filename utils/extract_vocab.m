function [VOCAB, feats] = extract_vocab(data,sample_img_size, sample_feature_size, size_vocab,img_size, feat_type)
% It assumes to hvae images sized as 256x256


data = data(randperm(size(data,1),sample_img_size),:); %take random images

VOCAB = [];
feats = [];
num_data =  size(data,1);

parfor i  = 1:size(data,1)
    fprintf('Feature Extraction for image %d / %d !!!\n',i, num_data);
    ins = single(data(i,:));
    if(size(ins,3) == 3)
        display('RGB image is detected!!!');
        continue;
    end
    ins2d = reshape(ins,img_size(1),img_size(2));
    switch feat_type
        case 'phow'
            [f,d] = vl_phow(ins2d);
        case 'dsift'
            [f,d] =  vl_dsift(ins2d,'size',8);
        case 'mser'
            [d,f] = vl_mser(uint8(ins2d));
            d = d';
        otherwise
            display('Wrong feature type!');
    end
    
    feats = [feats d];
end

display('QUANTIZATION!!!');
%[C,A] = kmeans_gpu(double(feats(:,rand_index)'),size_vocab); % GPU CODE on sample feat vectors
sampled_feats = feats(:,randperm(size(feats,2),sample_feature_size))';
[C,A] = kmeans_gpu(double(sampled_feats),size_vocab); % GPU CODE on sample images

VOCAB = C;