x=(-6:0.01:6)';
n=length(x);
L=(1:2:11)';
a=zeros(n,6);
for i=1:6
    a(:,i)=1./(1+exp(-L(i).*x));
end

figure(1);
plot(x,a,x,x>0,'k');
legend(num2str(L));

% ####################
W=[-1 1 0];
[X1,X2]=meshgrid(-5:0.1:5);
D=W(1).*X1+W(2).*X2+W(3);

A=1./(1+exp(-1*D));
figure(2);
surf(X1,X2,(D>0)+randn(101).*0.001);
hold on;
surf(X1,X2,A);
hold off;

