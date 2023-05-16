% Construir 3 agrupamentos
nc=100;

% Agrupamento 1
X1=randn(nc,1).*2;
Y1=randn(nc,1);

% Agrupamento 2
X2=randn(nc,1);
Y2=randn(nc,1)*2+10;

% Agrupamento 3
X3=randn(nc,1).*2+10;
Y3=randn(nc,1)*2+6;

% Agrupamento 4
X4=randn(nc,1).*2+18;
Y4=randn(nc,1)*2+15;

X=[X1;X2;X3;X4];
Y=[Y1;Y2;Y3;Y4];
XY=[X';Y'];
n=length(X);

figure(1);
plot(X1,Y1,'b.',X2,Y2,'k.',X3,Y3,'m.');

c=4;
niter=20;
V=rand(2,c)*20;
[U,V]=K_means(niter,c,XY,1,V);

% Visualizar zona de abrangência dos agrupamentos
[X1,X2]=meshgrid(-5:0.1:25);
[nx,ny]=size(X1);
X=[reshape(X1,1,nx*ny);reshape(X2,1,nx*ny)];

[U,V]=K_means(0,c,X,[],V);
Cores=[1 0 0;0 1 0;0 0 1;0.5 0.5 0.5];
Img=zeros(nx,ny,3);
for i=1:c
    UC=reshape(U(i,:),nx,ny).*255;
    for j=1:3
        Img(:,:,j)=Img(:,:,j)+UC.*Cores(i,j);
    end
end
figure(2);
imshow(uint8(flip(Img)));