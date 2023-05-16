x=(0:0.01:1)';

d=x.*exp(-x*0.1).*cos(2*pi*x);


n=length(x);

A=[ones(n,1) x x.^2 x.^3 x.^4 x.^5 x.^6];

a=inv(A'*A)*A'*d;

y=A*a;

figure(1);
plot(x,d,'b',x,y,'r');

e=(d-y)'*(d-y)./n;
fprintf('\nSoma do Erro quadrático= %e',e);