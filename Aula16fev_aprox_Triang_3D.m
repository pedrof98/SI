[X,Y]=meshgrid(0:0.025:1);
[nx,ny]=size(X);
D=X.*exp(-Y.^2*0.1)+Y.*cos(4*pi*X); %+randn(n,1)*0.1;
figure(1);
surf(X,Y,D)

% Centros dos Gaussianos
[Cx,Cy]=meshgrid(0:0.125:1);
[ncx,ncy]=size(Cx);

C=[reshape(Cx,ncx*ncy,1) reshape(Cy,ncx*ncy,1)]
L=C-0.15;
U=C+0.15;

XY=[reshape(X,nx*ny,1) reshape(Y,nx*ny,1)]; 

t=triang(XY,L,C,U);

figure(1);
clf;
hold on;
for k=1:ncx*ncy
    T=reshape(t(:,k),nx,ny);
    surf(X,Y,T)
end
t=t./repmat(sum(t,2),1,ncx*ncy);
d=reshape(D,nx*ny,1);

A=t;
a=inv(A'*A)*A'*d;

z=A*a;

Ze=reshape(z,nx,ny);

figure(2);
surf(X,Y,D);

figure(3);
surf(X,Y,Ze);