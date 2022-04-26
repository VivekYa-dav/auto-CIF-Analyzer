function [Chip_3D_print_cleaned_R_norm,Chip_3D_print_cleaned_G_norm,Chip_3D_print_cleaned_B_norm] = Norm_RGB_test(Chip_3D_print_cleaned) 

Chip_3D_print_cleaned_R = im2double(Chip_3D_print_cleaned(:,:,1));
Chip_3D_print_cleaned_G = im2double(Chip_3D_print_cleaned(:,:,2));
Chip_3D_print_cleaned_B = im2double(Chip_3D_print_cleaned(:,:,3));

Chip_3D_print_cleaned_R_norm = Chip_3D_print_cleaned_R./(Chip_3D_print_cleaned_R + Chip_3D_print_cleaned_G + Chip_3D_print_cleaned_B + 1e-20);
Chip_3D_print_cleaned_G_norm = Chip_3D_print_cleaned_G./(Chip_3D_print_cleaned_R + Chip_3D_print_cleaned_G + Chip_3D_print_cleaned_B + 1e-20 );
Chip_3D_print_cleaned_B_norm = Chip_3D_print_cleaned_B./(Chip_3D_print_cleaned_R + Chip_3D_print_cleaned_G + Chip_3D_print_cleaned_B + 1e-20 );

end