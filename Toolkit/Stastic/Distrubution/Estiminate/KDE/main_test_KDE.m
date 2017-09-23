clc
clear 
close all
%%
% Date:2017/09/23
% Author:Jwy_Leo
% Version:1
% Title :KDE
%% Data generate
data_num=200;
X=linspace(1,data_num);
data=[rand(1,data_num/2)*0.2 rand(1,data_num/4)+10 rand(1,data_num/4)*10];
%% Data visualize
data=(data-min(data))/max(data);
figure(1);
plot(data,zeros(1,data_num),'rx')
ylim([0,1])
title('Discrete data display')
%% Caculate distrubution
distrubution=KDE_1D(data',0.05);
%% Distrubution visualize
figure(2);
plot(data,zeros(1,data_num),'rx')
hold on
distrubution=distrubution./sum(distrubution)
plot(sort(data),distrubution)
ylim([0,max(distrubution)])
title('Distrubution display')
%% Sample
sample_rate=2;
data_sort=sort(data);
data_sample=data_sort(1:sample_rate:data_num);
distrubution_sample=distrubution(1:sample_rate:data_num);
%% Sample visualize
figure(3)
plot(data_sample,zeros(1,size(data_sample,2)),'rx')
hold on 
plot(data_sample,distrubution_sample);
ylim([0,max(distrubution_sample)])
title('sample Distrubution display')