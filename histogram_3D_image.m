function histogram_3D_image(Chip_3D_print_cleaned)
    figure()
    histogram(Chip_3D_print_cleaned(:,:,1),'facecolor','r','Normalization','probability') 
    hold on
    histogram(Chip_3D_print_cleaned(:,:,2),'facecolor','g', 'Normalization','probability') 
    hold on
    histogram(Chip_3D_print_cleaned(:,:,3),'facecolor','b', 'Normalization','probability') 
    legend('Red','Green','Blue')
    xlabel('Intensity value')
    ylabel('Normalised frequency')
    hold off
end