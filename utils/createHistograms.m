function [ DATA_HIST ] = createHistograms( DATA,KDTREE,CLUSTER_CENTERS,img_size, feat_type)

num_data = size(DATA,1);
DATA_HIST = [];

% if strcmp(MODE,'images') % if image features are not already given. recalculate
parfor i = 1 : num_data
    fprintf('Creating historgram for image %d - %d\n',i,num_data);
    ins = single(DATA(i,:));
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
    
    quantized = vl_kdtreequery(KDTREE,double(CLUSTER_CENTERS'),double(d));
    norm_coeff = size(quantized,2);
    ins_hist = hist(quantized,1:size(CLUSTER_CENTERS,1));
    ins_hist = ins_hist./norm_coeff;
    DATA_HIST = [DATA_HIST;ins_hist];
end
end

