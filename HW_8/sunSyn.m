function [a]=sunSyn(e,mu,MU,J2,R,r)
i =0:(pi/180):pi/2; %which range should we have
% d_OMEGA=-[(3/2)*(sqrt(mu)*J2*R^2)/((1-e^2)^2*a^(7/2))]*cos(i);
P=2*pi*(sqrt(r^3/mu));
d_OMEGA=(2*pi)/P;
a=(-(((3/2)*sqrt(MU)*J2*R^2)./(d_OMEGA./cos(i)))./(1-e^2)^2).^(2/7);

i=(i*180)/pi;       %conversion to plot for degree output
plot(i,a,'LineWidth',2)
hold on
xlabel('Inclination i\circ')
ylabel('Semimajor Axis a [DU]')
end