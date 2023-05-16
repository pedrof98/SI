% Gerar os dados do exemplo de treino
n=1000;
x1=rand(n,1).*20-10;
x2=rand(n,1).*20-10;

W=[-1 1 0]; % parametros da recta separadora das classes
% Distância dos pontos (x1,x2) ao plano separador
D=(W(1).*x1+W(2).*x2+W(3))./sqrt(W(1).^2+W(2).^2);
% Encontrar os indices dos pontos com distância menor que 2
I=find(abs(D)<2);
% Eliminar esses pontos
x1(I)=[];
x2(I)=[];
D(I)=[];
n=length(x1); % nº de pontos sobrantes após eliminação daqueles
              % que estavam distanciados e menos de 2 da recta
d=D>0; % Valores da classe a que pretence os pontos ({0;1})
figure(1);
plot(x1(d),x2(d),'r.',x1(~d),x2(~d),'b.')

% Fase de treino
niter=200; % nº de iterações máximo
W0=randn(1,3); % Pesos iniciais do plano separador
m=0.1; % factor de aprendizagem
LI=[0.1,10]; % Intervalo do parametro Ladma da função sigmoidal
             % Começa com ladma=0.5 e termina com ladma=10;
[W,E]=train_sigmf_classifier(niter,[x1 x2 ones(n,1)],d,W0,m,LI);

% Testar o resultado da aprendizagem
Wx=W(1).*x1+W(2).*x2+W(3);
%a=sigmf(Wx,[10,0]);
a=1./(1+exp(-5.*Wx));
figure(2);
plot3(x1,x2,a,'.');
box on; grid on;
figure(3);
I=a>0.5;
plot(x1(I),x2(I),'r.',x1(~I),x2(~I),'b.');

figure(4);
bar(E);

function [W,E]=train_sigmf_classifier(niter,X,d,W0,m,LI)
% função de treino do classificador sigmoidal

E=zeros(niter,1); % Regista o erro em cada iteração
W=W0;   % Peso iniciais
n=size(X,1);
L=LI(1);
Wx=X*W';
a1=1./(1+exp(-L.*Wx));
a2=1./(1+exp(L.*Wx));
E1=(d-a1)'*(d-a1)./n;
E2=(d-a2)'*(d-a2)./n;
if E2<E1
    W=-W;
end

for ni=1:niter
    alfa=(ni-1)./(niter-1);
    L=LI(1).*(1-alfa)+LI(2)*alfa;
    %y=sigmf(W*X,[L,0]);
    Wx=X*W';
    a=1./(1+exp(-L.*Wx));
    da_dw=L.*a.*(1-a).*X;
    
    % Adaptação dos Pesos (W)
    W=W+m*2/n*(d-a)'*da_dw;
    
    % Calcular o erro
    Wx=X*W';
    a=1./(1+exp(-L.*Wx));
    E(ni)=(d-a)'*(d-a)./n;
    fprintf('\n (%d) Erro=%d',ni,E(ni));
end
end