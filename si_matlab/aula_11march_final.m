%Construir 3 agrupamentos

nc=50;

%Agrupamento 1
X1 = randn(nc,1).*2;
Y1 = randn(nc,1);

%Agrupamento 2
X2 = randn(nc,1);
Y2 = randn(nc,1)*2+10;

%Agrupamento 3
X3 = randn(nc,1).*2+10;
Y3 = randn(nc,1).*2+6;

X = [X1;X2;X3];
Y = [Y1;Y2;Y3];
XY = [X';Y'];
n = length(X);

figure(1);
plot(X1,Y1,'b.',X2,Y2,'k.',X3,Y3,'m.');


c=3;
niter=20;
[U,V]=k_means(niter,c,XY,1,V);

%Visualizar zona de abrangencia dos agrupamentos

[X1,X2]=meshgrid(-10:0.1:15);
[nx,ny] = size(X1);
X = [reshape(X1,1,nx*ny);reshape(X2,1,nx*ny)]
[U,V]=k_means(0,c,X,[],V);

for i=1:c
    figure(i+1);
    UC = reshape(U(i,:),nx,ny)*255;
    imshow(uint8(UC));
end