config;
load images_gray_1d
num_classes = size(images,2);

X_all = [];
X = [];
Y = [];
Xtest = [];
Ytest = [];

for i = 1:num_classes
    X_all =[X_all; images{1,i}];
end

if ~exist('vocab_SIFT.mat','file')
    [vocab,FEATS] = extract_vocab(X_all,100,100000,1000,[256,256],'dsift');
    clear X_all;
    display('SIFT dictionary are extracted!!!');
    KD_TREE = createKdtree(vocab);
    display('KDTREE is extracted!!!');
    save('vocab_SIFT.mat','vocab');
elseif ~exist('vocab','var')
    load vocab_SIFT
end

for i = 1:num_classes
    fprintf('Image class %d / %d is being processed\n',i,num_classes);
    imgs = images{1,i};
    %% SIFT feature EXTACTION
    display('SIFT features are extracted!!!');
    DATA_HIST = createHistograms(imgs,KD_TREE,vocab,[256,256],'dsift');
    display('SIFT hist. are extracted!!!');
    y = ones(size(imgs,1),1)*i;
    Y = [Y;y(1:end-15,:)];
    Ytest = [Ytest;y(end-14:end,:)];
    X = [X;DATA_HIST(1:end-15,:)];
    Xtest = [Xtest;DATA_HIST(end-14:end,:)];
   
end

%% Classification
display('CLASSIFICATION!!!');
mdl = ClassificationKNN.fit(X,Y);
label = predict(mdl,Xtest);
num_error = sum(logical(label - Ytest));
error_rate = num_error / size(Ytest,1);
error_rate