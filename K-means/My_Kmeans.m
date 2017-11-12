function [C_set_fornt_step,Cmean_fornt_step]=My_Kmeans(Data,K_Means_Para)
X=Data;
cluster_center_num=K_Means_Para.cluster_center_num;
iter=K_Means_Para.iter;
E_record_fornt_step=ones(1,cluster_center_num)*10000;
index=randperm(size(X,1));


for i=1:cluster_center_num
    Cmean{i}=X(index(i),:);
end


for i=1:iter
%while (1)
    fprintf(['iter\t' num2str(i) '/' num2str(iter) '\n'])
    for j=1:size(Cmean,2)
        Error(:,j)=sum((X(:,:)-ones(size(X,1),1)*Cmean{j}).^2').^(1/2);
    end
    E_record=[];
    Eu=min(Error');
    [Ind,label]=find(Error==Eu'*ones(1,cluster_center_num));
    for j=1:cluster_center_num
        C_set{j}=Ind(label==j);
        Cmean{j}=mean(X(C_set{j},:));
        E_record(j)=sum(Error(C_set{j},j));
    end 
       
    if(sum(E_record_fornt_step)~=10000*2)
        if(abs(E_record_fornt_step-E_record)<sum(abs(X(:)))/size(X,1)/1000)
            break;
        end
    end
    
    if sum(E_record_fornt_step)>sum(E_record)
        C_set_fornt_step=C_set;
        E_record_fornt_step=E_record;
        Cmean_fornt_step=Cmean;
    end
end

end