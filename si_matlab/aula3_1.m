%Tuesday, 26 February 2019
%parte 2

x=(-pi:pi/100:pi);
d = (x.^3-2*x.*cos(x)).*exp(-x.^2);
m = 19*2;
c = linspace(-pi,pi,m)';
w = (2*pi)/(m-1);

A = trgf(x,c,w);
a = (c.^3-2*c.*cos(c)).*exp(-c.^2);

y = A*a;

figure(1);
plot(x,d,'b',x,y,'r')