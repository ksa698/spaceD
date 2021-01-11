function [theta] = acos_help(arg)
if abs(arg-1.0)<1e-12 && arg>1.0
     arg=1.0;
 elseif abs(arg)<1e-12 && arg<-1.0
     arg=-1.0;
end
theta=acos(arg);
end
% FUCK THIS
% % if abs((dot(r,[1;0;0])/norm(r)))<1e-12 && (dot(r,[1;0;0])/norm(r))>1.0
% %         (dot(r,[1;0;0])/norm(r))==1.0;
% %         elseif (dot(r,[1;0;0])/norm(r))<1e-12 && (dot(r,[1;0;0])/norm(r))<-1.0
% %         (dot(r,[1;0;0])/norm(r))==-1.0;
% % end
% % l=acos(dot(r,[1;0;0])/norm(r));

% % if abs((dot(e_vect,[1;0;0])/e))<1e-12 && ((dot(e_vect,[1;0;0])/e))>1.0
% %         (dot(e_vect,[1;0;0])/e)==1.0;
% %         elseif (dot(e_vect,[1;0;0])/e)<1e-12 && (dot(e_vect,[1;0;0])/e)<-1.0
% %         (dot(e_vect,[1;0;0])/e)==-1.0;
% % end
% % w_=acos(dot(e_vect,[1;0;0])/e);

% % if abs((dot(n,r)/norm(r)))<1e-12 && (dot(n,r)/norm(r))>1.0
% %         (dot(n,r)/norm(r))==1.0;
% %         elseif (dot(n,r)/norm(r))<1e-12 && (dot(n,r)/norm(r))<-1.0
% %         (dot(n,r)/norm(r))==-1.0;
% % end
% % u=acos(dot(n,r)/norm(r));

% %         if abs(cos_ang-1.0)<1e-12 && cos_ang>1.0
% %         cos_ang=1.0;
% %         elseif cos_ang<1e-12 && cos_ang<-1.0
% %         cos_ang=-1.0;
% %         end
% %        theta=acos(cos_ang);

% %     if abs((dot(n,e_vect)/(norm(n)*e)-1.0))<1e-12 && (dot(n,e_vect)/(norm(n)*e))>1.0
% %         (dot(n,e_vect)/(norm(n)*e))==1.0;
% %     elseif abs((dot(n,e_vect)/(norm(n)*e)+1.0))<1e-12 && (dot(n,e_vect)/(norm(n)*e))<-1.0
% %         (dot(n,e_vect)/(norm(n)*e))==-1.0;
% %     end
% %    w=acos(dot(n,e_vect)/(norm(n)*e));

% %     if abs((n(1)/norm(n))-1.0)<1e-12 && (n(1)/norm(n))>1.0
% %         (n(1)/norm(n))==1.0;
% %     elseif abs((n(1)/norm(n))+1.0)<1e-12 && (n(1)/norm(n))<-1.0
% %         (n(1)/norm(n))==-1.0;
% %     end
% % OMEGA=acos(n(1)/norm(n));

% % if abs((dot(h,[0;0;1])/norm(h))-1.0)<1e-12 && (dot(h,[0;0;1])/norm(h))>1.0
% %     (dot(h,[0;0;1])/norm(h))==1.0;
% % elseif abs((dot(h,[0;0;1])/norm(h))+1.0)<1e-12 && (dot(h,[0;0;1])/norm(h))<-1.0
% %     (dot(h,[0;0;1])/norm(h))==-1.0;
% % end
% %i=acos(theta);