function [thetaaa,F,M] = orbit_prop_hyp(t,n,e,tp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Hyperbolic Orbit e= %f  \n', e)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(size(t));
F=zeros(size(t));
thetaaa=zeros(size(t));

for i = 1:size(t,2) %due to indexing
    M(i)=n*(t(i)-tp);
    
    %Newton Raphson
    func=@(F) -M(i)-F+e*sinh(F);
    f_der=@(F) -1+e*cosh(F);
        
    max_iter=75;
    tol=10^-10;
    error=1.0;
    iter=0;
    
    %The initial conditions
    if M(i)<pi
        F_0=M(i)+e/2;
    else
        F_0=M(i)-e/2;
    end
    
    while error > tol && iter <= max_iter
        iter=iter+1;
        Fi=F_0-func(F_0)/f_der(F_0);
        error=abs(Fi-F_0);
        F_0=Fi;
    end
    F(i)=Fi;
    thetaaa(i)=2*atan2(sqrt((e+1))*tanh(F(i)/2),sqrt((e-1)));   
end
end