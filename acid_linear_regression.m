function [alpha_acid,beta_acid,gamma_acid] = acid_linear_regression(Max_acid_value,Min_acid_value,R1,G1,B1)

y_trueph_acidic = transpose(linspace(Min_acid_value,Max_acid_value,(Max_acid_value - Min_acid_value + 1)));

RGB_regression = [R1(1:(Max_acid_value - Min_acid_value + 1)) G1(1:(Max_acid_value - Min_acid_value + 1)) B1(1:(Max_acid_value - Min_acid_value + 1))];
mdl = fitlm(RGB_regression, y_trueph_acidic,'Intercept' ,false)
mdl.Coefficients;
anova(mdl,'summary');
Regress_coff_acidic = mdl.Coefficients.Variables;
y_regress = Regress_coff_acidic(1,1)* R1(1:(Max_acid_value - Min_acid_value + 1)) + Regress_coff_acidic(2,1)*G1(1:(Max_acid_value - Min_acid_value + 1))  + Regress_coff_acidic(3,1)*B1(1:(Max_acid_value - Min_acid_value + 1))

figure(2)
scatter(y_trueph_acidic,y_regress)
hold on
plot(y_trueph_acidic,y_trueph_acidic)
hold off
xlabel('True pH')
ylabel('Calculated pH')
alpha_acid = Regress_coff_acidic(1,1);
beta_acid = Regress_coff_acidic(2,1);
gamma_acid = Regress_coff_acidic(3,1);

end