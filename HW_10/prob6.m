%% The Original OG 
tstart=0; tend=20; ni=8;
    t(1)=tstart;
    y(1)=12 + 6*cos(2*pi*t(1)/(tend-tstart));
    
for i=2:ni+1
    t(i)=t(i-1)+(tend-tstart)/ni;
    y(i)=12 + 6*cos(2*pi*t(i)/(tend-tstart));
end 
%% Vectorization of for loop
tt = 0:2.5:20
yy = 12 + 6*cos(2*pi.*tt/20)


