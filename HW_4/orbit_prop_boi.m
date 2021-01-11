function [thetaaa,E,M] = orbit_prop_boi(t,n,e,tp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Elliptical Orbit e= %f  \n', e)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(size(t));
E=zeros(size(t));
thetaaa=zeros(size(t));

for i = 1:size(t,2) %due to indexing
    M(i)=n*(t(i)-tp);
    
    %Newton Raphson
    func=@(E) E-e*sin(E)-M(i);
    f_der=@(E) 1-e*cos(E);
        
    max_iter=75;
    tol=10^-10;
    error=1.0;
    iter=0;
    
    %The initial conditions
    if M(i)<pi
        E_0=M(i)+e/2;
    else
        E_0=M(i)-e/2;
    end
    
    while error > tol && iter <= max_iter
        iter=iter+1;
        Ei=E_0-func(E_0)/f_der(E_0);
        error=abs(Ei-E_0);
        E_0=Ei;
    end
    E(i)=Ei;
    thetaaa(i)=2*atan2(sqrt((1+e))*tan(E(i)/2),sqrt((1-e)));    
end
end

