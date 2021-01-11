%function accept 1 input (matrix)
%fprintf to display outputs
%trial & error for spacing output
%cloumn n,S,B,H,U centered ish on column data


num=[0.035 0.0001 10 2;...  %initial matrix
     0.020 0.0002 8  1;...
     0.015 0.0010 20 1.5;...
     0.030 0.0007 24 3;...
     0.022 0.0003 15 2.5];
vel=manning(num);   %call the function
fprintf('    n            S           B             H            U\n')
fprintf('%2f     %2f    %2f     %2f     %2f\n',vel)

%disp(vel) prettier version if use disp



    