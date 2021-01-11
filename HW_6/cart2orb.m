function [orb_el] = cart2orb(r,v,mu)
energy=((norm(v)^2)/2)-(mu/norm(r)); %Units [DU^2/TU^2]
h= cross(r,v); %Units [DU^2/TU]
e_vect=((cross(v,h))/mu)-(r./norm(r));
e=norm(e_vect);

% a
if energy<10^-12 
    %Circular/Elliptical
    a=-mu/(2*energy);
elseif energy>10^-12
    %Hyperbolic
    a=mu/(2*energy);
else
    %Parabolic
    disp('Parabolic a=\infinity')

end

%i, n, big omega
%i=acos(dot(h,[0;0;1])/norm(h));
[i] = acos_help(dot(h,[0;0;1])/norm(h));

n=cross([0;0;1],h);

%OMEGA=acos(n(1)/norm(n));
[OMEGA] = acos_help(n(1)/norm(n));
   if n(2)<10^-12
       OMEGA=2*pi-OMEGA;
   end

%lil omega...w
%    w=acos(dot(n,e_vect)/(norm(n)*e));
[w] = acos_help(dot(n,e_vect)/(norm(n)*e));
    if e_vect(3)<10^-12
        w=2*pi-w;
    end

%true anomaly
%cos_ang = [((norm(h)).^2)/(norm(r)*mu)-1]/norm(e_vect); 
cos_ang=(dot(r,e_vect)/(norm(r)*e));
%        theta=acos(cos_ang);
[theta] = acos_help(cos_ang);
    if dot(r,v)<0 %quadrant check
        theta = (2*pi)-theta;
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Singluarities & l,u,w_
%finding u
    % u=acos(dot(n,r)/norm(r));
%finding w_
    % w_=acos(dot(e_vect,[1;0;0])/e);
%finding l
    % l=acos(dot(r,[1;0;0])/norm(r));

    if e<10^-12 && i<10^-12
        OMEGA=0;
        w=0;
        [l] = acos_help(dot(r,[1;0;0])/norm(r));
            if r(2)<10^-12
                l=2*pi-l;
            end
        theta=l;

    elseif e<10^-12
        w=0;
        [u] = acos_help(dot(n,r)/norm(r));
            if r(3)<10^-12
                u=2*pi-u;
            end
        theta=u;
    elseif i<10^-12
        OMEGA=0;
        [w_] = acos_help(dot(e_vect,[1;0;0])/e);
            if e_vect(2)<10^-12
                w_=2*pi-w_;
            end
        w=w_;
    end
i=(i*180)/pi; 
OMEGA=(OMEGA*180)/pi;
w=(w*180)/pi;
theta=(theta*180)/pi;    
orb_el=[a;e;i;OMEGA;w;theta]; 
end