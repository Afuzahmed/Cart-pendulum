function fval=Functionfile(t,y)
%globalizing
global m mp l
fval =zeros(4,1);
g=9.810;
%simlifying
% y(1,1)=x y(2,1)=v y(3,1)=theta y(4,1)=omega
a=3*g*sin(y(3,1));
c=3*cos(y(3,1));
d=-1/(2*l);
e=3*(mp*g*sin(2*y(3,1)));
f=4*(mp*l*sin(y(3,1)))*((y(4,1))^2);
g1=2*(4*(m+mp)-3*(mp)*(cos(y(3,1))^2));
% dy/dt=fval
fval(1,1)=y(2,1);        
fval(3,1)=y(4,1);
fval(2,1)=(e+f)/g1;
fval(4,1)=d*(a+fval(2,1)*c);
end