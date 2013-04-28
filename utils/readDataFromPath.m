function [images, images_RGB] = readDataFromPath(DataPath, image_size)
% Reads the image content of the given rootpath. Assumes that we have a
% root folder includes sub folder for each class of images

images = {};
images_RGB = {};
root_dir = dir(DataPath);
root_dir = root_dir([root_dir.isdir]);
folder_names = {root_dir.name};
root_dir = root_dir(~ismember(folder_names,{'.','..'}))
num_sub_folders = numel(root_dir);
parfor i = 1:num_sub_folders
    folder_name = root_dir(i).name;
    sub_folder_dir = dir(fullfile(DataPath,folder_name));
    folder_names = {sub_folder_dir.name};
    sub_folder_dir = sub_folder_dir(~ismember(folder_names,{'.','..'}))
    num_images_in_folder = numel(sub_folder_dir);
    img_counter = 1;
    temp_images = [];
    temp_images_RGB = [];
    for j = 1:num_images_in_folder
        image_name = sub_folder_dir(j).name;
        image_path = fullfile(DataPath,folder_name,image_name);
        [~,~,ext] = fileparts(image_name);
        if strcmp(ext,'.jpg') || strcmp(ext,'.JPG')
            fprintf('READING %s ...\n',image_path);
            try
                img = imread(image_path);
            catch
                fprintf('%s cannot be read and will be DELETED!!!\n',image_path);
                delete(image_path);
                continue;
            end
            img = imresize(img,image_size);
            if (size(img,3) == 3)   % if image is RGB
                temp_images_RGB(img_counter,:,:,:) = uint8(img);
                gray_img = rgb2gray(img);
                
                temp_images(img_counter,:) = uint8(gray_img(:)');
                img_counter = img_counter+1;
            else
                temp_images(img_counter,:) = uint8(img(:)');
                img_counter = img_counter+1;
                %gray_img = img;
            end
        else
            delete(image_path); % if image is not in the corretc format delete and do not read
            fprintf('Image %s not in correct format, DELETED!!\n',image_name);
        end
    end
    images{i} = uint8(temp_images);
    if size(temp_images_RGB,1) ~= 0
        images_RGB{i} = uint8(temp_images_RGB);
    end
end
save('images_gray_1d.mat', 'images');
% save('images_RGB_3d.mat', 'images_RGB');
end
