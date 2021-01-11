function [dY]=propCRT(t_span,Y,mu)
%ORDER MATTERS...t,Y,mu
dY=zeros(6,1);
r1=sqrt((Y(1)+mu)^2+Y(2)^2+Y(3)^2);
r2=sqrt((Y(1)+mu-1)^2+Y(2)^2+Y(3)^2);


ax=2*Y(5)+Y(1)-(((1-mu)*(Y(1)+mu))/r1^3)-mu*(Y(1)+mu-1)/r2^3;
ay=-2*Y(4)+Y(2)-(1-mu)*(Y(2)/r1^3)-mu*(Y(2)/r2^3);
az=-(1-mu)*(Y(3)/r1^3)-mu*(Y(3)/r2^3);
a=[ax; ay; az];

dY=[Y(4); Y(5); Y(6); a];
end
