function [aj0 aj1 aj2 aj3]=cube_interporation(x,y)
for i=1:size(y,2)-1
    h(i)=(x(i+1)-x(i));
    %f_D1(i)=(y(i+1)-y(i))/h(i);
    f_D1(i)=(y(i+1)-y(i))/(y(i+1)+y(i))/h(i)*(x(i+1)-x(i));
end
f=y;
k=f_D1;
aj0=f;
aj1=k;
for i=1:size(k,2)-1
aj2(i)=3/h(i)^2*(y(i+1)-y(i))-1/h(i)*(k(i+1)+2*k(i));
aj3(i)=2/h(i)^3*(y(i)-y(i+1))+1/h(i)^2*(k(i+1)+k(i));
end

end