clc
clear 
close all
%% generator data
data_num=50;
X=linspace(-100,100,data_num);
Y=0.0002*X.^3+0.01*X.^2-2*X+randn(1,data_num)*100;
data=[X',Y'];
figure(1)
subplot(2,1,1)
plot(X,Y,'ro')
title('orignal data')
%% normorlize
n_d=(data-ones(data_num,1)*JWY_mean(data));
subplot(2,1,2)
plot(n_d(:,1),n_d(:,2),'go')
title('normorlize data')
%% PCA_compare
figure(2)
[pc,score,lat]=JWY_PCA(data);
biplot(pc(:,1:2),'Scores',score(:,1:2),'VarLabels',...
		{'X1' 'X2' })