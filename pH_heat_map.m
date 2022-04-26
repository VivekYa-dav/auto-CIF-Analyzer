function pH_heat_map(Chip_3D_print_cleaned_R_norm,Chip_3D_print_cleaned_G_norm,Chip_3D_print_cleaned_B_norm, alpha_acid,beta_acid,gamma_acid,alpha_basic,beta_basic,gamma_basic)

[image_row_size,image_column_size] = size(Chip_3D_print_cleaned_R_norm);

for i = 1:image_row_size
    for j =1:image_column_size
            if Chip_3D_print_cleaned_R_norm(i,j)> 0.49                      
                pH_calc(i,j) = alpha_acid* Chip_3D_print_cleaned_R_norm(i,j) +beta_acid*Chip_3D_print_cleaned_G_norm(i,j) + gamma_acid*Chip_3D_print_cleaned_B_norm(i,j);

            elseif Chip_3D_print_cleaned_R_norm(i,j) ~= 0 
                pH_calc(i,j) = alpha_basic* Chip_3D_print_cleaned_R_norm(i,j) + beta_basic*Chip_3D_print_cleaned_G_norm(i,j) + gamma_basic*Chip_3D_print_cleaned_B_norm(i,j);
            else
                pH_calc(i,j) = NaN;
            end
    end
end

pH_new = pH_calc;
figure(1)
imagesc_test(pH_new)

figure(2)
plot(linspace(1,image_column_size,image_column_size),movmean(pH_new(1425,:),5))
xlabel('Pixel number')
ylabel('pH')

end