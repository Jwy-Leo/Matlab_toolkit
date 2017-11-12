clc
clear
close all 
%%
x=[0 0.8 1.5 2.5 4 5 5.8];
y=[3.9 3.5 2.7 2.2 1.8 1.5 0];
figure(1)
plot(x,y,'r-')
hold on
%%
[aj0 aj1 aj2 aj3]=cube_interporation(x,y);
% for i=1:size(y,2)-1
%     h(i)=(x(i+1)-x(i));
%     f_D1(i)=(y(i+1)-y(i))/h(i);
% end
% f=y;
% k=f_D1;
% aj0=f;
% aj1=k;
% for i=1:size(k,2)-1
% aj2(i)=3/h(i)^2*(y(i+1)-y(i))-1/h(i)*(k(i+1)+2*k(i));
% aj3(i)=2/h(i)^3*(y(i)-y(i+1))+1/h(i)^2*(k(i+1)+k(i));
% end
%%
samplex=linspace(0,5.8,100);
jj=1;
for i=1:size(samplex,2)
    if(x(jj+1)<samplex(i))
        if(jj~=size(aj3,2))   
        jj=jj+1; 
        end
    end
    sampley(i)=aj0(jj)+aj1(jj)*(samplex(i)-x(jj))+aj2(jj)*(samplex(i)-x(jj))^2+aj3(jj)*(samplex(i)-x(jj))^3;
end
plot(samplex,sampley,'b-')
%%
xtemp=0:5.8*0.01:5.8;
ytemp=spline(x,y,xtemp);
plot(xtemp,ytemp,'g-')