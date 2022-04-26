function  [R1, G1, B1]= Norm_RGB_calibration_images(dataDirectory,scanName,N_images) 

Red = transpose(zeros(1,N_images));
Green = transpose(zeros(1,N_images));
Blue = transpose(zeros(1,N_images));

for i=1:N_images
    ph_image = imread([dataDirectory scanName num2str(i+1) '.jpg']);
    Red(i) = mean(mean(im2double(ph_image(:,:,1))));
    Green(i) = mean(mean(im2double(ph_image(:,:,2))));
    Blue(i) = mean(mean(im2double(ph_image(:,:,3))));
end

R1 = Red./(Red+Green+Blue);
G1 = Green./(Red+Green+Blue);
B1 = Blue./(Red+Green+Blue);

end 