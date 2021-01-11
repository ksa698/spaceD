t=-5:0.25:50;

for i=(1:numel(t))
 pieceWise(i)=velocity(t(i));
end
 
plot(t,pieceWise)
    hold on;
    [vmax,loc]=max(pieceWise); %establish vmax
scatter(t(loc),vmax);          %plot vmax 

xlabel('time')
ylabel('velocity')
legend({'Piecewise Function','Max Velocity'}) %names go in order of first plot
title('MAXIMUM VELOCITYYY')
