%queremos colocar num microcontrolador a funçao seno aproximada por um
%polinomio ?
N=50;
x = linspace(-pi,pi,N);

x=x';
d=sin(x);

p=6;

%%
A=[ones(N,1), x, x.^2, x.^3, x.^4, x.^5, x.^6];
a=inv(A'*A)*A'*d;
y=A*a;

figure(1);
plot(x,d,'b',x,y,'r');

%%
N=50;
x = linspace(-pi,pi,N);
x=x';
d=sin(x);
p=4;
w=pi/4;
%A=[ones(N,1), trgf(x,-pi,w), trgf(x,-pi/2,w), trgf(x,0,w), trgf(x,pi/2,w), trgf(x,pi,w)];
%a=inv(A'*A)*A'*d;
c=(-pi:(pi/4):pi); 
A= trgf(x,c,w);

y=A*a;
figure(1);
plot(x,d,'b',x,y,'r');
figure(2);
plot(x,d-y);