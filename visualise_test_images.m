function [Chip_3D_print_cleaned]= visualise_test_images(dataDirectory,test_image_name,binarymask_name) 

Chip_3D_print = imread([dataDirectory test_image_name]);
imshow(Chip_3D_print);

a = imread([dataDirectory binarymask_name]);
a(a(:,:)==2)=0;
Binary_mask = a;
a = a.*255;
a = imfill(a,'holes');
mask = bwareaopen(a,55000);

figure (2)
imshow(mask)

figure(3)
imshow(labeloverlay(Chip_3D_print,mask))

Chip_3D_print_cleaned(:,:,1) = Chip_3D_print(:,:,1).*(im2uint8(mask)./255);
Chip_3D_print_cleaned(:,:,2) = Chip_3D_print(:,:,2).*(im2uint8(mask)./255);
Chip_3D_print_cleaned(:,:,3) = Chip_3D_print(:,:,3).*(im2uint8(mask)./255);

figure(4)
imshow(Chip_3D_print_cleaned)
title('output image');
end