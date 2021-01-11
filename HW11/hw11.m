function [la_1,la_2,la_3,la_4,la_5]=hw11(mu,tf,r,v)
nm=(384.4);
t_span=0:0.001:tf;
Y0=[r v];
odeoptions=odeset('RelTol',1e-10,'AbsTol',1e-20);
[T,Y]=ode45(@propCRT,t_span,Y0,odeoptions,mu);
figure
    [la_1,la_2,la_3,la_4,la_5]=lgn_pts(mu);
    hold on
    plot(Y(:,1)*nm,Y(:,2)*nm, 'LineWidth',2)
    %hold on
    grid on
    plot(0,0,'.','MarkerSize', 20)
    %[la_1,la_2,la_3,la_4,la_5]=lgn_pts(mu);
    plot(1*nm,0,'.','MarkerSize', 20)
    title('Synodic Frame')
    xlabel('X [x1000 km]')
    ylabel('Y [x1000 km]')
    legend('Lagrange Pt','Lagrange Pt','Lagrange Pt','Lagrange Pt','Lagrange Pt','Trajectory','Primary','Secondary','Location', 'northwest')
    hold off
    
    r_v=[Y(:,1)  Y(:,2) Y(:,3)]';
for j=1:length(t_span)
    OMEGA=1;
    theta=OMEGA*t_span(j);
    R3=[cos(theta) sin(theta) 0;-sin(theta) cos(theta) 0;0 0 1]';
    r_in(:,j)=R3*(r_v(:,j)-[-mu 0 0]');
end
figure
plot(r_in(1,:)*nm,r_in(2,:)*nm, 'LineWidth',2)
hold on
grid on
plot(0,0,'.','MarkerSize', 30)
%plot circle at 0,0 radius of nm
t=0:pi/100:2*pi;
    cix=cos(t);
    ciy=sin(t);
    plot(cix*nm,ciy*nm,cix*nm,ciy*nm, 'LineWidth',2)
    title('Inertial Frame')
    xlabel('X [x1000 km]')
    ylabel('Y [x1000 km]')
    legend('Trajectory','Primary','','Secondary')
    hold off
    
end