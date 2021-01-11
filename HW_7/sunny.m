function [a]=sunny(e,mu,J2,d_OMEGA,R)
i =(95*pi/180):(pi/180):pi;
% d_OMEGA=-[(3/2)*(sqrt(mu)*J2*R^2)/((1-e^2)^2*a^(7/2))]*cos(i);
a=(-(((3/2)*sqrt(mu)*J2*R^2)./(d_OMEGA./cos(i)))./(1-e^2)^2).^(2/7);

for j=1:length(a)
    rp(j) = a(j)*(1-e);
    if rp(j) < R
        a(j)=NaN;   %we only want to plot when rp>R so we null the rest
    end
    
end
i=(i*180)/pi;       %conversion to plot for degree output
plot(i,a)
hold on
xlabel('Inclination i\circ')
ylabel('Semimajor Axis a [km]')
end