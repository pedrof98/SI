x=(0:0.01:1)';

d=x.*exp(-x*0.1).*cos(2*pi*x);


n=length(x);

A=[ones(n,1) cos(2*pi*x) sin(2*pi*x) cos(4*pi*x) sin(4*pi*x)...
   cos(6*pi*x) sin(6*pi*x) cos(8*pi*x) sin(8*pi*x) ...
   cos(10*pi*x) sin(10*pi*x) cos(12*pi*x) sin(12*pi*x)];

a=inv(A'*A)*A'*d;

y=A*a;

figure(1);
plot(x,d,'b',x,y,'r');

e=(d-y)'*(d-y)./n;
fprintf('\nSoma do Erro quadrático= %e',e);