x=(0:0.001:1)';
n=length(x);

C=(0:0.1:1)';
L=C-0.1;
U=C+0.1;
nt=length(C); % nº de triangulos

d=x.*exp(-x*0.1).*cos(2*pi*x); %+randn(n,1)*0.1;

t=triang(x,L,C,U);

figure(1);
plot(x,t);

A=[ones(n,1) t];

a=inv(A'*A+0.001*eye(nt+1))*A'*d;

y=A*a;

aa=C.*exp(-C*0.1).*cos(2*pi*C);

ya=A*[0;aa];
figure(2);
plot(x,t.*repmat(a(2:nt+1)',n,1));

figure(3);
plot(x,d,'b',x,y,'r',x,ya,'g');

e=(d-y)'*(d-y)./n;
fprintf('\nSoma do Erro quadrático= %e',e);