%Tuesday, 26 February 2019
%parte 1

x=(-pi:pi/100:pi);
d = sin(x);
m = 19;
c = linspace(-pi,pi,m)';
w = (2*pi)/(m-1);

A = trgf(x,c,w);
a = sin(c);

y = A*a;

figure(1);
plot(x,d,'b',x,y,'r');