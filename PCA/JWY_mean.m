function mean_vector=JWY_mean(data)
% data Nxm 
% mean_value 1xm
temp=zeros(1,size(data,2));
temp=JWY_sum(data);
temp=temp/size(data,1)
mean_vector=temp;
end