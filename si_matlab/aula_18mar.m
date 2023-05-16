% Função degrau
x = (-6:0.01:6)';
n=length(x);
L=(1:2:11)';

a=zeros(n,6);
for i=1:6
    a(:,i)=1./(1+exp(-L(i).*x));
end

figure(1);
plot(x,a,x,x>0,'r');
legend(num2str(L),'degrau');


%% Acho que já é para fazer outra coisa... 
clc
w = [-1 1 0];
[x1,x2] = meshgrid(-5:0.1:5);
% A = w(1).*x1+w(2).*x2 +w(3);        %função da reta
D = w(1).*x1+w(2).*x2 +w(3); 
lambeda = -1;
A=1./(1+exp(lambeda*D));             

figure(2);
surf(x1,x2,(D>0)+randn(101).*0.001);
hold on;
surf(x1,x2,A);
hold off;

