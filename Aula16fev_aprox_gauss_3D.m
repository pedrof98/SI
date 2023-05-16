[X,Y]=meshgrid(0:0.025:1);
[nx,ny]=size(X);
D=X.*exp(-Y.^2*0.1)+Y.*cos(4*pi*X); %+randn(n,1)*0.1;
figure(1);
surf(X,Y,D)

% Centros dos Gaussianos
[Cx,Cy]=meshgrid(0:0.15:1);
[ncx,ncy]=size(Cx);

C=[reshape(Cx,ncx*ncy,1) reshape(Cy,ncx*ncy,1)]

XY=[reshape(X,nx*ny,1) reshape(Y,nx*ny,1)]; 

g=gauss(XY,C,ones(ncx*ncy,2)*0.1);

g=g./repmat(sum(g,2),1,ncx*ncy);

figure(1);
clf;
hold on;
for k=1:ncx*ncy
    G=reshape(g(:,k),nx,ny);
    surf(X,Y,G)
end

d=reshape(D,nx*ny,1);
A=g;

a=inv(A'*A)*A'*d;

z=A*a;

Ze=reshape(z,nx,ny);

figure(2);
surf(X,Y,D);

figure(3);
surf(X,Y,Ze);