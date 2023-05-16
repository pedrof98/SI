%Tuesday, 26 February 2019
%parte 2

x=(-pi:pi/100:pi);
d = (x.^3-2*x.*cos(x)).*exp(-x.^2);
m = 19;
c = linspace(-pi,pi,m)';
w = (2*pi)/(m-1)*0.65;

A = G(x,c,w);
a = (c.^3-2*c.*cos(c)).*exp(-c.^2);

y = A*a;

figure(1);
plot(x,d,'b',x,y,'r')


%a aproximação triangular nos pontos correspondes aos triangulos, há uma
%descontinuidade do lado esquerdo e direito.
%Na gaussiana é sempre continuo.
function y=G(x,c,w)
    nc=length(c);
    n=length(x);
    y=zeros(n,nc);
    for i=1:nc
        y(:,i)=exp(-(((x-c(i))/w).^2));
    end
end