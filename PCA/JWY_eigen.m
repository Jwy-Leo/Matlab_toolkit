function [eigen_vector eigen_value]=JWY_eigen(data)
% data NxN 
% eigen_value NxN 
% eigen_vector NxN
% eigen_value*A=eigen_vector*A
eigen_value=zeros(size(data));
eigen_vector=zeros(size(data));
i=1;
MUL=max(data(:))
data=data/MUL;
rem=[];
for landa=0:0.001:1
    if(abs(det(data-eye(size(data))*landa))<=1e-3)
        rem=[rem landa];
        eigen_value(i,i)=landa;
        M=(data-eye(size(data))*landa);
        eigen_vector(:,i)=M(:,1); 
        i=i+1;
        if(i>size(data))
            break;
        end
    end
end
eigen_value=eigen_value*MUL;
end