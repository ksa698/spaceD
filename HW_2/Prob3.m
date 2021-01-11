%Problem 3
%plot in lecture 2

%Independent Variable 1DU to 5DU
x=linspace(1,5,100);
g=9.81;
g0=9.81;
f=g*(1/g0)*x.^-2;

figure 
    plot(x,f)
    title('Inverse Square Decay of  Gravity Force')
    xlabel('Distance in Earth Radii   [DU]')
    ylabel('g/g0')