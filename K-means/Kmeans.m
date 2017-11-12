clc
clear
close all
%%
 m1 = 200;          % Number of data points.
 m2 = 100;
 m3 = 300;
 dimention=3
 Mean=[20 20 20;0 0 0;-10 -10 -10];
 sigma1 = [ 3 0 0;   % Covariance matrix
           0  2 0;
           0 0 1];
 sigma2 = [2 0 0;
           0 1 0;
           0 0 2];
 sigma3 = [1 0 0;
           0 1 0;
           0 0 1];
 R1 = chol(sigma1);                       
 X1 = randn(m1, dimention) * R1;
 X1 = X1 + repmat(Mean(1,:), size(X1, 1), 1);
 
 R2 = chol(sigma2);
 X2 = randn(m2, dimention) * R2;
 X2 = X2 + repmat(Mean(2,:), size(X2, 1), 1);
 
 R3 = chol(sigma3);
 X3 = randn(m3, dimention) * R3;
 X3 = X3 + repmat(Mean(3,:), size(X3, 1), 1);
X = [X1; X2;X3];
figure(1)
subplot(2,1,1)
plot3(X1(:,1),X1(:,2),X1(:,3),'ro')
hold on
plot3(X2(:,1),X2(:,2),X2(:,3),'bo')
plot3(X3(:,1),X3(:,2),X3(:,3),'go')
%%
K_Means_Para.iter=10000;
K_Means_Para.cluster_center_num=3;


[C_set,Cmean]=My_Kmeans(X,K_Means_Para);
subplot(2,1,2)
plot(X(C_set{1},1),X(C_set{1},2),'ro')
hold on
plot(Cmean{1}(1),Cmean{1}(2), 'ko', 'MarkerFaceColor',[1,0,0] ,'MarkerSize', 7);
hold on
plot(X(C_set{2},1),X(C_set{2},2),'bo')
hold on
plot(Cmean{2}(1),Cmean{2}(2), 'ko', 'MarkerFaceColor',[0,0,1] ,'MarkerSize', 7);
hold on
plot(X(C_set{3},1),X(C_set{3},2),'go')
hold on
plot(Cmean{3}(1),Cmean{3}(2), 'ko', 'MarkerFaceColor',[0,1,0] ,'MarkerSize', 7);
%%
size(C_set{1})
Cmean{1}
size(C_set{2})
Cmean{2}
