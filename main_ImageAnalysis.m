% CIF pH detection from smartphone images main code file
clc;
clear;
close all;

%% pH calibration curve
% Define working directories
dataDirectory = 'C:\Users\Himani Sharma\Box\himani (Himani Sharma)\machine learning\Image_Analysis_final_code\';
scanName = 'pH_';
N_images = 10;

% Visualise the RGB histograms
visualise_calibration_images(dataDirectory,scanName,N_images) 

% Get the average RGB values from the calibration images
[R1, G1, B1]= Norm_RGB_calibration_images(dataDirectory,scanName,N_images); 

%acid linear regression model
Max_acid_value = 6;
Min_acid_value = 2;
[alpha_acid,beta_acid,gamma_acid] = acid_linear_regression(Max_acid_value,Min_acid_value,R1,G1,B1);

%basic linear regression model
Min_basic_value = 7;
Max_basic_value = 11;
[alpha_basic,beta_basic,gamma_basic] = basic_linear_regression(Max_basic_value,Min_basic_value,R1,G1,B1);

%% 3D print image testing and pH calculation
test_image_name = 'H12.jpeg';
binarymask_name = 'H12_Simple Segmentation.png';

Chip_3D_print_cleaned = visualise_test_images(dataDirectory,test_image_name,binarymask_name);

% histogram of cleaned 3D printed image
histogram_3D_image(Chip_3D_print_cleaned)

% Normalised RGB values of the test image
[Chip_3D_print_cleaned_R_norm,Chip_3D_print_cleaned_G_norm,Chip_3D_print_cleaned_B_norm] = Norm_RGB_test(Chip_3D_print_cleaned); 

% Visualise pH calculated on the image 
pH_heat_map(Chip_3D_print_cleaned_R_norm,Chip_3D_print_cleaned_G_norm,Chip_3D_print_cleaned_B_norm, alpha_acid,beta_acid,gamma_acid,alpha_basic,beta_basic,gamma_basic)

%% Evaluation of semantic segmentation by Machine learning

dataSetDir_ilastik = 'C:\Users\Himani Sharma\Box\himani (Himani Sharma)\machine learning\1252022\TESTINGDATA\Test_images\pixel_ilastik\';
dataSetDir_groundtruth = 'C:\Users\Himani Sharma\Box\himani (Himani Sharma)\machine learning\1252022\TESTINGDATA\Test_images\PixelLabelData\';
Name = 'IMG_';
ScanName = '_Simple Segmentation';
label_image = 'Label_';

[Accuracy, Sensitivity, Fmeasure, Precision, MCC, Dice, Jaccard, Specitivity] = ML_evaluation(dataSetDir_ilastik,dataSetDir_groundtruth,Name,ScanName,label_image);
final_matrix = [mean(Accuracy) mean(Sensitivity) mean(Fmeasure) mean(Precision) mean(MCC) mean(Dice) mean(Jaccard) mean(Specitivity)]



