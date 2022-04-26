clear;
clc;
close all;
%%
dataSetDir_ilastik = ''; % Add data directory for ilastik segmentation
dataSetDir_groundtruth = ''; %Add data directory for ground truth labels

Name = 'IMG_';
ScanName = '_Simple Segmentation';
label_image = 'Label_';
num_images = 136;
[Accuracy, Sensitivity, Fmeasure, Precision, MCC, Dice, Jaccard, Specitivity] = ML_evaluation(dataSetDir_ilastik,dataSetDir_groundtruth,Name,ScanName,label_image, num_images);
final_matrix = [mean(Accuracy) mean(Sensitivity) mean(Fmeasure) mean(Precision) mean(MCC) mean(Dice) mean(Jaccard) mean(Specitivity)]