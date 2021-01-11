%% INFO
%ADDITIONAL 
%     m-file script calls func to eval v(t)
%     using if-else-if @ all t points
%     step size 0.25 for t
%     label axes in plot
%     scatter command to plot max velocity on same plot
%     plot w/ legend

%t=-5:0.25:50   SHALL GO IN MAIN (aka other file)

%% ONE SPEEDY BOI
function V = velocity(t)
    if (0<=t) && (t<=8)
        velocity = (10.*(t.^2))-5.*t;
    elseif t==8
           velocity = 624-3.*t;
    elseif (8<t) && (t<=16)
        velocity = 624-3.*t;
    elseif t==16
            velocity = 36.*t + (12.*(t-16).^2);
    elseif (16<t) && (t<=26)
        velocity = 36.*t + (12.*(t-16).^2);
    elseif (t>26)
        velocity = 2136.*(exp(-0.1.*(t-26)));
    else
        velocity = 0;
    end
    V=velocity;
end




