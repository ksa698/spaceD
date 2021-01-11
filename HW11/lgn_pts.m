function [la_1,la_2,la_3,la_4,la_5]=lgn_pts(mu)
nm=(384.4);
r1=[1];
r2=[0];
r3=[-1];
func=@(rx) rx-((1-mu)*(rx+mu))/abs(rx+mu).^3-mu*(rx-(1-mu))/abs(rx+mu-1).^3;
options = optimset('Display','off');
    [l_1]=fsolve(func,r1,options);
    [l_2]=fsolve(func,r2,options);
    [l_3]=fsolve(func,r3,options);
%In vector form for x&y coordniates    
    la_1=[l_2; 0.0];
    la_2=[l_1; 0.0];
    la_3=[l_3; 0.0];
    la_4=[0.5-mu;sqrt(3)/2];
    la_5=[0.5-mu;-sqrt(3)/2];    
hold on
scatter(la_1(1)*nm,la_1(2)*nm,'LineWidth',2)
scatter(la_2(1)*nm,la_2(2)*nm,'LineWidth',2)
scatter(la_3(1)*nm,la_3(2)*nm,'LineWidth',2)
scatter(la_4(1)*nm,la_4(2)*nm,'LineWidth',2)
scatter(la_5(1)*nm,la_5(2)*nm,'LineWidth',2)
title('Lagrange Points')
    xlabel('X [x1000 km]')
    ylabel('Y [x1000 km]')
end