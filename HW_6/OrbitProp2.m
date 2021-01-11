function [dY] = OrbitProp2(T,Y, mu)
%UNTITLED2 Summary of this function goes here
% Detailed explanation goes here
% Assign r %
rx = Y(:,1);
ry = Y(:,2);
rz = Y(:,3);
% Preallocate memory %
ax = zeros(length(rx),1);
ay = zeros(length(ry),1);
az = zeros(length(rz),1);
R = zeros(length(rx),1);
for i = 1:length(az)
 R(i) = sqrt(rx(i)^2 + ry(i)^2 + rz(i)^2);
 ax(i) =(-mu/R(i)^3).*rx(i);
 ay(i) =(-mu/R(i)^3).*ry(i);
 az(i) =(-mu/R(i)^3).*rz(i);
end
dY = [ax ay az];
end