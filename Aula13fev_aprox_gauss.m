x=(0:0.001:1)';
n=length(x);

c=(0:0.1:1)';
ng=length(c);

d=x.*exp(-x*0.1).*cos(2*pi*x); %+randn(n,1)*0.1;

g=gauss(x,c,ones(ng,1)/ng);

figure(1);
plot(x,g);

A=[ones(n,1) g];

a=inv(A'*A)*A'*d;

y=A*a;

figure(2);
plot(x,g.*repmat(a(2:ng+1)',n,1));

figure(3);
plot(x,d,'b',x,y,'r');

e=(d-y)'*(d-y)./n;
fprintf('\nSoma do Erro quadrático= %e',e);