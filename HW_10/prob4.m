%Maclaurin series Expansion
    %plot cos (solid line)
    %plot series (black dash line) (x^8)/8!
    %use built in func "factorial"
    %x= 0 to 3pi/2
  
x=linspace(0,(3*pi)/2,100);
y=1-((x.^2)/factorial(2)) + ((x.^4)/factorial(4)) - ((x.^6)/factorial(6)) + ((x.^8)/factorial(8));
t=cos(x);

    plot(x,y,'--k'); %k is black
        hold on;
    plot(x,t,'g');  %g is green GREEN LANTERN

axis([0 (3*pi)/2 -1 1])
title('Cosine vs Maclaurin')

  
       
    
    