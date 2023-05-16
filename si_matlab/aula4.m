n = 100;
x=rand(n,1);
y=4*x+2;

c1=[x y+2+randn(n,1)*0.25];

c2 = [x y+randn(n,1)*0.25];

C = [c1;c2];

% figure(1);
% plot(c1(:,1),c1(:,2),'r.',c2(:,1),c2(:,2),'b.');

X=[ones(2*n,1),C];
D=[ones(n,1);-ones(n,1)];

w=randn(3,1);
w=w./sqrt(w'*w);

y=sign(X*w);

I=y>0;

figure(2);
plot(C(I,1),C(I,2),'r.',C(~I,1),C(~I,2),'b.');
