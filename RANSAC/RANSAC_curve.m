clc
clear
close all
%% Data simulate 
N=300
data_inline=floor(0.3*N)
data_outline=floor(0.7*N)
XA=linspace(-10,10,data_inline);
XB=linspace(-10,10,data_outline)
noiseA=random('norm',0,0.5,[1,data_inline])*10;
noiseB=random('norm',0,3,[1,data_outline])*100;
Para=[10,0.1,2]
Y=Para*[XA.^2 XB.^2;XA XB;ones(1,length(XA)+length(XB))]+[noiseA,noiseB];
plot([XA,XB],Y,'b*')
data=[[XA XB]' Y' ];
% plot data
figure(1)
plot(data(:,1),data(:,2),'b*')
%%
% get fitting model
Select_data_num_fitting=3
% iteration_max=prod(1:size(data,1))/prod(1:floor(size(data,1)/2))/prod(1:floor(size(data,1)/2)) 
iteration_max=3000
thresthold=10
inliner_num=0;
iteration=0;
model=[];
Mem_inlinear=[];
Error_min=1000000;
indexPLUS=1;
for j=1:30
    iteration=0;
    fprintf(['iteration \t' num2str(j) '/'  num2str(30) '\n'])
while iteration<iteration_max
    
    %fprintf(['iteration \t' num2str(iteration) '/'  num2str(iteration_max) '\n'])
    
    D=randperm(size(data,1));
    fitting_group=data(D(1:Select_data_num_fitting),:);
    [U,S,V]=svd([fitting_group(:,1).^2 fitting_group ones(size(fitting_group,1),1)]);
    theta=V(:,4)';
    y_L=-1*[theta(1)/theta(3) theta(2)/theta(3) theta(4)/theta(3)]*[(data(:,1)-1).^2 (data(:,1)-1) ones(size(data,1),1)]';
    y_R=-1*[theta(1)/theta(3) theta(2)/theta(3) theta(4)/theta(3)]*[(data(:,1)+1).^2 (data(:,1)+1) ones(size(data,1),1)]';
    y_C=-1*[theta(1)/theta(3) theta(2)/theta(3) theta(4)/theta(3)]*[(data(:,1)).^2 (data(:,1)) ones(size(data,1),1)]';
    norm_vec=[(data(:,1)) (y_R-y_L)'/2];
    norm_vec=norm_vec./(sum(norm_vec'.^2)'.^(1/2)*ones(1,2));
    P_m(1,1)=mean(data(:,1));
    P_m(2,1)=1/theta(2)*(theta(1)*P_m(1,1)+theta(3))*-1;
    error=(data-[data(:,1) y_C']).*(ones(size(data,1),2)*[norm_vec(1),0;0,norm_vec(2)]);
    Distan=abs(sum((error')));
    inlinear=find(Distan<thresthold);
    E=sum(Distan);
    if(inliner_num<length(inlinear))
        Error_min=E;
        inliner_num=length(Mem_inlinear);
        Mem_inlinear=data(inlinear,:);
        DistanF=abs(sum((error')));
        model=theta;
    end
    
%     plot([XA,XB],Y,'b*')
%     hold on
%     -1*[theta(1)/theta(3) theta(2)/theta(3) theta(4)/theta(3)]*[XA.^2 XB.^2;XA XB;ones(1,length(XA)+length(XB))];
%     plot([XA,XB],ans,'r*')
%     hold off
      iteration=iteration+1;
%      pause(1)
end

end
figure(3)
plot([XA,XB],Y,'b*')
hold on
plot(Mem_inlinear(:,1),Mem_inlinear(:,2),'go')
figure(4)
-1*[model(1)/model(3) model(2)/model(3) model(4)/model(3)]*[XA.^2 XB.^2;XA XB;ones(1,length(XA)+length(XB))];
plot([XA,XB],ans,'r.')
hold on 
plot([XA,XB],Y,'b*')