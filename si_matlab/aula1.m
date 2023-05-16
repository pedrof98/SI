x=(0:0.001:1)';
x0 = 0.02;

%y=exp(-x.^2*5).*cos(2*pi.*x);
y=exp(-x.^2*5).*sin(2*pi.*x);

%dy_dx = 10*x.*exp(-x.^2*5).*cos(2*pi.*x)-2*pi*exp(-x.^2*5).*sin(2*pi.*x);
dy_dx = 10*x.*exp(-x.^2*5).*sin(2*pi.*x)-2*pi*exp(-x.^2*5).*cos(2*pi.*x);

figure(1);
subplot(2,1,1);
h=plot(x,y,'b',x0,1,'ro');
subplot(2,1,2);
plot(x,dy_dx);


m=0.01;
for k=1:20
    dy_dx = 10*x.*exp(-x.^2*5).*sin(2*pi.*x)-2*pi*exp(-x.^2*5).*cos(2*pi.*x);
    x0=x0-m*dy_dx;
    %y0 = exp(-x0.^2*5).*cos(2*pi.*x0);
    y0 = exp(-x0.^2*5).*sin(2*pi.*x0);
    set(h(2), 'XData', x0, 'YData', y0);
    pause(0.2);
end