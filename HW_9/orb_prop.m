function [dY]=orb_prop(T,Y,mu)
%r norm
r=sqrt(Y(1).^2+Y(2).^2+Y(3).^2);

dY=zeros(6,1);
%the acceleration points dY(4:6)
a_x=-(mu/r^3).*Y(1);
a_y=-(mu/r^3).*Y(2);
a_z=-(mu/r^3).*Y(3);
dY=[Y(4); Y(5); Y(6); a_x; a_y; a_z];
end