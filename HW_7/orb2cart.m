function [r,v] = orb2cart(mu,a,e,i,OMEGA,w,theta)
p=a*(1-e^2);

%solve r&v vectors in PQW frame w/ a,e,theta
r_pqw=(p/(1+e*cos(theta))).*[cos(theta);sin(theta);0];
v_pqw=sqrt(mu/p).*[-sin(theta);(e+cos(theta));0];

%transformation matrix Q w/ OMEGA,i,w
R3_1=[cos(OMEGA) sin(OMEGA) 0;-sin(OMEGA) cos(OMEGA) 0;0 0 1];
R1_2=[1 0 0;0 cos(i) sin(i);0 -sin(i) cos(i)];
R3_3=[cos(w) sin(w) 0;-sin(w) cos(w) 0;0 0 1];

%transform r&v from PQW to inertial
Q=R3_3*R1_2*R3_1;
Q_T=Q';
r=Q_T*r_pqw;
v=Q_T*v_pqw;

% disp('Position Vector:')
% disp(r)
% disp('Velocity Vector:')
% disp(v)
end