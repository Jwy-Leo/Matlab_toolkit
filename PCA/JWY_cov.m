function cov_matrix=JWY_cov(data,mode)
% data Nxm 
% mode 'sample','mother'
% cov_matrix mxm
if(exist('mode')==1)
    if (strcmp(mode,'mother'))
        freedom=size(data,1);
    end
else
    freedom=size(data,1)-1;
end
temp=zeros(size(data,2),size(data,2));
for i=1:size(data,2)
    for j=1:size(data,2)
        temp(i,j)=(data(:,i)'*data(:,j))/freedom;
    end
end
 cov_matrix=temp;
end