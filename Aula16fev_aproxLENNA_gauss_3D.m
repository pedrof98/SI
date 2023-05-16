A=imread('LENNA.JPG');
D=A(150:400,150:300);
[nx,ny]=size(D);
np=nx*ny; % n. de pontos (pixeis) da imagem
[X,Y]=meshgrid(1:nx,1:ny);
XY=[reshape(X',np,1) reshape(Y',np,1)];
d=double(reshape(D,np,1));

figure(1);
subplot(1,2,1);
imshow(D);

% Centros dos Gaussianos
r=8  % Resolução dos gaussianos;
[Cx,Cy]=meshgrid(0:r:nx,0:r:ny);
[ncx,ncy]=size(Cx);
ng=ncx*ncy; % n. de Gaussianos

fprintf('\n N. de gaussianos %d x %d = %d',ncx,ncy,ng);
C=[reshape(Cx,ng,1) reshape(Cy,ng,1)] ;

g=gauss(XY,C,ones(ng,2)*r.*1.2);

%g=g./repmat(sum(g,2),1,ng);

A=g;

a=inv(A'*A)*A'*d;

z=A*a;

Ze=reshape(z,nx,ny);

subplot(1,2,2)
imshow(uint8(Ze));

% Erro entre a imagem original e a estimada
Err=sum(sum((double(D)-Ze).^2))/(nx*ny);
fprintf('\n Erro da aprox.: %f \n',Err);