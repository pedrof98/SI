% Caso de estudo - Analise pelas componentes princpais
clear;
close;
clc;

X = randn(1000,1)*4;
Y = randn(1000,1);
teta = pi/4;

% plot(X,Y,'.');
% axis equal

A = [cos(teta) -sin(teta); sin(teta) cos(teta)];

% [xI,y1] = A'*[x0,y0];

Xr = A(1,1).*X+A(1,2)*Y;
Yr = A(2,1).*X+A(2,2)*Y;

% plot(X,Y,'b.', Xr,Yr,'m.');
% axis equal

% Matriz correlação dos dados
C = [X Y]'*[X Y];

% Determinar os vetores e valores proprios da matriz C
[V,D] = eig(C);


% Matriz correlação dos dados rodados de angulo teta
Cr = [Xr Yr]'*[Xr Yr];

% Determinar os vetores e valores proprios da matriz C
[Vr,Dr] = eig(Cr);
VVr=Vr*sqrt(Dr/1000);

figure(2);
h=plot(X,Y,'b.',...
    Xr,Yr,'m.',[0 0; Vr(1,:)]*8,[0 0;V(2,:)]*8,'b',...
    [0 0; V(1,:)]*8, [0 0; V(2,:)]*8, 'k');
set(h(2),'LineWidth',3);
set(h(3),'LineWidth',3);
set(h(5),'LineWidth',3);
set(h(6),'LineWidth',3);

axis equal;

% se tivermos uma imagem com uma cara de uma pessoa. pertence ao espaco
% bidimensional (os pixels)
