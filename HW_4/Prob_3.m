%% Problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=[-17130;39;-784];
v=[-0.25100; -2.8270;3.7540]; %km/s
    mu=398600.4415; %km^3/s^2
    R=6378.1363; %km
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Part a')
    h= cross(r,v);
    e_vect= ((cross(v,h))/mu)-(r./norm(r));
    e=norm(e_vect); 
    if e<1
        fprintf('Elliptical Orbit because magnitude of e<1...e= %f  \n', e)
    else
        fprintf('Hyperbolic Orbit because magnitude of eccentricity is e>1...e=: %f  \n', e)
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Part b: Anomalies at t_0')
    cos_ang = [((norm(h)).^2)/(norm(r)*mu)-1]/norm(e_vect);
    theta = acos(cos_ang); 
    if dot(r,v)<0 %quadrant check
        theta = (2*pi)-theta;
    end
    fprintf('True Anomaly in rad= %f \n',real(theta));
    E=2*atan2(sqrt(1-e)*tan(theta/2),sqrt(1+e))
                    disp('Units [rad]')
    M=E-e*sin(E)
                    disp('Units [rad]')
    a=[norm(r)*(1+e*cos(theta))]/((1-e)*(1+e));
    n=sqrt(mu/a^3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Part c') 
    tp=-M/n
                    disp('Units [s]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Propagation
disp('Part d')
t=0:500:40000;
if e<1
    [thetaaa,E,M]=orbit_prop_boi(t,n,e,tp);
else 
    [thetaaa,F,M]=orbit_prop_hyp(t,n,e,tp);
end
fprintf('Theta [rad] at t 10,000s = %f \n',thetaaa(21)) %21 is index of time where t=10,000
%re-calculate values
a=[norm(r)*(1+e*cos(thetaaa(1)))]/((1-e)*(1+e));
r_new=(a*(1-e)*(1+e))./(1+e.*cos(thetaaa));
v_new= sqrt((mu.*((2./r_new)-(1/a))));
%calc for part d
    KE=(v_new.*v_new)./2;
    PE= -(mu./r_new);
    change= KE(1)+PE(1);        %positive change since PE is negative
    dt_total=(KE+PE)-change;

figure 
subplot(3,1,1) 
    plot(t, thetaaa)
    title('True Anomaly')
    xlabel('Time [s]')
    ylabel('True Anomaly [rad]')
subplot(3,1,2);
    plot(t, r_new)
    title('Radius Over Time')
    xlabel('Time [s]')
    ylabel('Radius [m]')
subplot(3,1,3);
    plot(t, v_new)
    title('Velocity Over Time')
    xlabel('Time [s]')
    ylabel('Velocity [m/s]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part e
figure
    plot(t,dt_total)
    title('Part (e): Plotting Energy')
    xlabel('Time [s]')
    ylabel('Change in Specific Energy [J]')
    
