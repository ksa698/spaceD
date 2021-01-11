%% HW 11 #1
%location of position vector for each of 5 lagrange pts
%fsolve() is nonlinear solver 
%converged soln to 8 digits
format long

m1=6e24; %kg
m2=3e24; %kg

%units normed
mu=(m2)/(m1+m2);
figure
[la_1,la_2,la_3,la_4,la_5]=lgn_pts(mu)






