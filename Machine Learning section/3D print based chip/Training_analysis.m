%Analysing the tested results
clc;
clear;
close all;
dataSetDir_ilastik = 'C:\Users\Vivek\Box\himani (Himani Sharma)\machine learning\1252022\TESTINGDATA\Test_images\pixel_ilastik\';
dataSetDir_groundtruth = 'C:\Users\Vivek\Box\himani (Himani Sharma)\machine learning\1252022\TESTINGDATA\Test_images\PixelLabelData\';
Name = 'IMG_';
ScanName = '_Simple Segmentation';
label_image = 'Label_';

Area_ilastik = zeros(1,41);
Area_label = zeros(1,41);

Accuracy = zeros(1,41);
Sensitivity = zeros(1,41);
Fmeasure = zeros(1,41);
Precision = zeros(1,41);
MCC = zeros(1,41);
Dice = zeros(1,41);
Jaccard = zeros(1,41);
Specitivity = zeros(1,41);
TP_1 = zeros(1,41);
TN_2 = zeros(1,41);
FP_1 = zeros(1,41);
FN_1 = zeros(1,41);

for i=8350:8390
    
    a = imread([dataSetDir_ilastik Name num2str(i) ScanName '.png']);
    a(a(:,:)==2)=0;
    a = a.*255;
    imshow(a)
    b = imfill(a,'holes');
    %imshow(b)
    mask = bwareaopen(b,55000);
    imshow(mask)
    ground_truthImage = imread([dataSetDir_groundtruth label_image num2str(i-8349) '.png']);
    [Accuracy(i-8349), Sensitivity(i-8349), Fmeasure(i-8349), Precision(i-8349), MCC(i-8349), Dice(i-8349), Jaccard(i-8349), Specitivity(i-8349)] = EvaluateImageSegmentationScores(ground_truthImage, mask);
    
    %for confusion matrix
    % Evaluate TP, TN, FP, FN
    sumindex = imbinarize(ground_truthImage) + mask;
    TP_1(i-8349) = length(find(sumindex == 2));
    TN_2(i-8349) = length(find(sumindex == 0));
    substractindex = imbinarize(ground_truthImage) - mask;
    FP_1(i-8349) = length(find(substractindex == -1));
    FN_1(i-8349) = length(find(substractindex == 1));
    
    %area calc
    Area_ilastik(i-8349) = length(find(mask == 1));
    Area_label(i-8349) = length(find(ground_truthImage == 1));

end

mean(Accuracy)
mean(Sensitivity)
mean(Fmeasure)
mean(Precision)
mean(MCC)
mean(Dice)
mean(Jaccard)
mean(Specitivity)

sum(TP_1)
sum(TN_2)
sum(FP_1)
sum(FN_1)

scatter(Area_label,Area_ilastik)
xlabel('ROI Manual Area', 'FontSize', 15)
ylabel('ROI from Machine Learning','FontSize', 15)

