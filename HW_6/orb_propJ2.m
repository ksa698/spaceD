function [dY]=orb_propJ2(Y,J2)
%r norm
r=sqrt(Y(1).^2+Y(2).^2+Y(3).^2);
R=6378;
mu=398600;


a_x=((-mu*Y(1))/r^3)*(1-((J2*3/2)*(R/r)^2*((5*(Y(3)/r)^2)-1)));
a_y=((-mu*Y(2))/r^3)*(1-((J2*3/2)*(R/r)^2*((5*(Y(3)/r)^2)-1)));
a_z=((-mu*Y(3))/r^3)*(1-((J2*3/2)*(R/r)^2*((5*(Y(3)/r)^2)-3)));

dY=[Y(4); Y(5); Y(6); a_x; a_y; a_z];
end