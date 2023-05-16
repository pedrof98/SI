% ###############################
% Método Gradiente Descendente
% ###############################

% Minimização
x=(-1:0.001:1)';

% Valor inicial
x0=0.02;
% x0=0.8;
y0=exp(-x0.^2*4).*cos(3*pi.*x0);

% Objectivo: Encontrar o mínimo da função y=f(x), com:
y=exp(-x.^2*4).*cos(3*pi.*x);

% Derivada da função dy_dx=f'(x)
dy_dx=-8*x.*exp(-x.^2*4).*cos(3*pi.*x)+...
    -3*pi*exp(-x.^2*4).*sin(3*pi.*x);

figure(1);
subplot(2,1,1);
h=plot(x,y,'b',x0,1,'ro');
subplot(2,1,2);
plot(x,dy_dx);

m=0.01; % Parâmetro de convergência
for k=1:50
    dy_dx=-8*x0.*exp(-x0.^2*4).*cos(3*pi.*x0)+...
    -3*pi*exp(-x0.^2*4).*sin(3*pi.*x0);

   x0=x0-m*dy_dx;
   y0=exp(-x0.^2*4).*cos(3*pi.*x0);
   set(h(2),'XData',x0,'YData',y0);
   pause(0.1);
end

% Maximização

% Valor inicial
x0=0.8;
% x0=0.2;
y0=exp(-x0.^2*4).*cos(3*pi.*x0);

% Objectivo: Encontrar o mínimo da função y=f(x), com:
y=exp(-x.^2*4).*cos(3*pi.*x);

% Derivada da função dy_dx=f'(x)
dy_dx=-8*x.*exp(-x.^2*4).*cos(3*pi.*x)+...
    -3*pi*exp(-x.^2*4).*sin(3*pi.*x);

figure(2);
subplot(2,1,1);
h=plot(x,y,'b',x0,1,'ro');
subplot(2,1,2);
plot(x,dy_dx);

m=0.01; % Parâmetro de convergência
for k=1:50
    dy_dx=-8*x0.*exp(-x0.^2*4).*cos(3*pi.*x0)+...
    -3*pi*exp(-x0.^2*4).*sin(3*pi.*x0);

   x0=x0+m*dy_dx;
   y0=exp(-x0.^2*4).*cos(3*pi.*x0);
   set(h(2),'XData',x0,'YData',y0);
   pause(0.1);
end