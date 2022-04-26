function [alpha_basic,beta_basic,gamma_basic] = basic_linear_regression(Max_basic_value,Min_basic_value,R1,G1,B1)

y_trueph_basic = transpose(linspace(Min_basic_value,Max_basic_value,(Max_basic_value - Min_basic_value + 1)));

RGB_regression = [R1((Min_basic_value-1):(Max_basic_value - 1)) G1((Min_basic_value-1):(Max_basic_value - 1)) B1((Min_basic_value-1):(Max_basic_value - 1))];

mdl = fitlm(RGB_regression, y_trueph_basic,'Intercept' ,false)
mdl.Coefficients;
anova(mdl,'summary');
Regress_coff_basic = mdl.Coefficients.Variables;
y_regress = Regress_coff_basic(1,1)* R1((Min_basic_value-1):Max_basic_value-1) + Regress_coff_basic(2,1)*G1((Min_basic_value-1):Max_basic_value-1) + Regress_coff_basic(3,1)*B1((Min_basic_value-1):Max_basic_value-1)

figure(3)
scatter(y_trueph_basic,y_regress)
hold on
plot(y_trueph_basic,y_trueph_basic)
xlabel('True pH')
ylabel('Calculated pH')

alpha_basic = Regress_coff_basic(1,1);
beta_basic = Regress_coff_basic(2,1);
gamma_basic = Regress_coff_basic(3,1);

end