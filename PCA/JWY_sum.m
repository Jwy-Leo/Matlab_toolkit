function sum_vector=JWY_sum(data)
% data Nxm 
% sum_vector 1xm
temp=zeros(1,size(data,2));
for i=1:size(data,2)
    for j=1:size(data,1)
        temp(i)=temp(i)+data(j,i);
    end
end
 sum_vector=temp;
end