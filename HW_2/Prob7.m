%Problem 7
%generate plot pf the function f(t)
%C=172800 s *(1 hr/3600s)*(1 day/24 hrs)= 2 Days

t=linspace(0,10,100);
C=2;
f=cos((2*pi*t)/C);

figure
    plot(t,f)
    title('Plotting the Function')
    xlabel('Days')
    ylabel('Function f(t)')

