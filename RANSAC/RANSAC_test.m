clc
clear
close all
%% Data simulate 
N=300
data_inline=floor(0.4*N)
data_outline=floor(0.6*N)
XA=linspace(-10,1,data_inline);
XB=linspace(-10,1,data_outline)
noiseA=random('norm',0,0.05,[1,data_inline]);
noiseB=random('norm',0,3,[1,data_outline])*100;
Para=[40,50]
Y=Para*[XA XB;ones(1,length(XA)+length(XB))]+[noiseA,noiseB];
plot([XA,XB],Y,'b*')
data=[[XA XB]' Y' ];
% plot data
figure(1)
plot(data(:,1),data(:,2),'b*')
%%
% get fitting model
Select_data_num_fitting=2
iteration_max=1000
thresthold=1
inliner_num=0;
iteration=0;
model=[];
Mem_inlinear=[];
Error_min=1000000;
%%
iteration=0;
while iteration<iteration_max
    fprintf(['iteration \t' num2str(iteration) '/'  num2str(iteration_max) '\n'])
    plot(data(:,1),data(:,2),'b*')
    D=randperm(size(data,1));
    fitting_group=data(D(1:Select_data_num_fitting),:);
    [U,S,V]=svd([fitting_group ones(size(fitting_group,1),1)]);
    theta=V(:,3)';
    norm_vec=[theta(1) theta(2)];
    norm_vec=norm_vec/norm(norm_vec);
     X(1,1)=max(data(:,1));
     Y(1,1)=1/theta(2)*(theta(1)*X(1,1)+theta(3))*-1;
     X(2,1)=0;
     Y(2,1)=1/theta(2)*(theta(1)*X(2,1)+theta(3))*-1;
    P_m(1,1)=mean(data(:,1));
    P_m(2,1)=1/theta(2)*(theta(1)*P_m(1,1)+theta(3))*-1;
    error=(data(:,:)-ones(size(data,1),2)*[P_m(1),0;0,P_m(2)]).*(ones(size(data,1),2)*[norm_vec(1),0;0,norm_vec(2)]);
    Distan=abs(sum((error')));
    inlinear=find(Distan<thresthold);
    E=sum(Distan);
    if(inliner_num<length(inlinear))
        Error_min=E;
        inliner_num=length(Mem_inlinear);
        Mem_inlinear=data(inlinear,:);
        model=theta;
    end
     iteration=iteration+1;
end

%%
X(1,1)=max(data(:,1));
Y(1,1)=1/model(2)*(model(1)*X(1,1)+model(3))*-1;
X(2,1)=min(data(:,1));
Y(2,1)=1/model(2)*(model(1)*X(2,1)+model(3))*-1;


plot(data(:,1),data(:,2),'b*')
hold on 
plot(Mem_inlinear(:,1),Mem_inlinear(:,2),'r*')
plot(X(:,1),Y(:,1))
Error_min
Para/norm(Para)
MODEL=[model(1)/model(2),model(3)/model(2)];
-MODEL/norm(MODEL)
