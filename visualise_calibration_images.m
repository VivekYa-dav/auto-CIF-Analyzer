function [f] = visualise_calibration_images(dataDirectory,scanName,N_images) 

Red = transpose(zeros(1,N_images));
Green = transpose(zeros(1,N_images));
Blue = transpose(zeros(1,N_images));

% Assuming first image has a pH = 2
for i=1:N_images
    f = figure(1);
    ph_image=imread([dataDirectory scanName num2str(i+1) '.jpg']);

    subplot(round(N_images/3),4,i)
    histogram(ph_image(:,:,1),'facecolor','r','Normalization','probability','Edgecolor','none') 
    hold on
    histogram(ph_image(:,:,2),'facecolor','g', 'Normalization','probability','Edgecolor','none') 
    hold on
    histogram(ph_image(:,:,3),'facecolor','b', 'Normalization','probability','Edgecolor','none') 
    xlabel('Intensity value', 'FontSize', 15)
    ylabel({'Normalised'; 'frequency'},'FontSize', 15)
    set(gca,'XMinorTick','on','YMinorTick','on')
    set(gca,'XLim',[-10 255])
    set(gca,'XTick',(-10:50:255))
    set(gca,'FontSize',15)
%     legend('Red','Green','Blue')
    hold off
    title('Subplot')
    title( sprintf( 'pH %d', i+1 )) ;    
end
