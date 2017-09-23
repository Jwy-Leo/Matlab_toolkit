function distrubution=KDE_1D(data,kernal_size)
% data Nx1                                         =S
% kernal_size : sample frequency(guassian windows) =h
% Ans=1/N (sigma[i=1:N] K((S-S_i)/h))
%%
% Date:2017/09/23
% Author:Jwy_Leo
% Version:1
% Title :KDE
 data_size=size(data,1);
 temp=zeros(size(data));
 data=sort(data);
 for i=1:data_size
 temp=temp+normpdf(data,data(i,1),kernal_size);
 end
 distrubution=temp./data_size;
end