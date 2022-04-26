%Analysing the tested results
function [Accuracy, Sensitivity, Fmeasure, Precision, MCC, Dice, Jaccard, Specitivity] = ML_evaluation(dataSetDir_ilastik,dataSetDir_groundtruth,Name,ScanName,label_image, num_images )

Area_ilastik = zeros(1,num_images);
Area_label = zeros(1,num_images);

Accuracy = zeros(1,num_images);
Sensitivity = zeros(1,num_images);
Fmeasure = zeros(1,num_images);
Precision = zeros(1,num_images);
MCC = zeros(1,num_images);
Dice = zeros(1,num_images);
Jaccard = zeros(1,num_images);
Specitivity = zeros(1,num_images);
TP_1 = zeros(1,num_images);
TN_2 = zeros(1,num_images);
FP_1 = zeros(1,num_images);
FN_1 = zeros(1,num_images);

for i=1:num_images
    
    a = imread([dataSetDir_ilastik Name num2str(i) ScanName '.png']);
    a(a(:,:)==2)=0;
    a = a.*255;
    imshow(a)
    b = imfill(a,'holes');
    imshow(b)
    mask = bwareaopen(b,70000);
    imshow(mask)
    ground_truthImage = imread([dataSetDir_groundtruth label_image num2str(i) '.png']);
    [Accuracy(i), Sensitivity(i), Fmeasure(i), Precision(i), MCC(i), Dice(i), Jaccard(i), Specitivity(i)] = EvaluateImageSegmentationScores(ground_truthImage, mask);
    
    %for confusion matrix
    % Evaluate TP, TN, FP, FN
    sumindex = imbinarize(ground_truthImage) + mask;
    TP_1(i) = length(find(sumindex == 2));
    TN_2(i) = length(find(sumindex == 0));
    substractindex = imbinarize(ground_truthImage) - mask;
    FP_1(i) = length(find(substractindex == -1));
    FN_1(i) = length(find(substractindex == 1));
    
    %area calc
    Area_ilastik(i) = length(find(mask == 1));
    Area_label(i) = length(find(ground_truthImage == 1));

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
end

