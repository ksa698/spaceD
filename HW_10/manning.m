%Function called manning 
function U = manning(num)
        n=[num(:,1)];       %assign column to variable
        S=[num(:,2)];
        B=[num(:,3)];
        H=[num(:,4)];
manning= ((S.^0.5)./n).*((B.*H)./(B+2.*H)).^(2/3);
U=[num(:,:) manning]';
end
