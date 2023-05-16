clc
close all
n = 1000;
x1 = rand(n,1).*20-10;
x2 = rand(n,1).*20-10;

w=[-1 1 0];
dist = (w(1).*x1 + w(2).*x2 + w(3))./sqrt(w(1).^2+w(2).^2);

% ####### eliminar pontos da dist ########
indice = find(abs(dist)<2);             % Encontrar os pontos a distancia de 2 
x1(indice) = [];
x2(indice) = [];
dist(indice) = [];

n=length(x1);       %numero de pontos sobrantes apos a eliminação daqueles  
                    %que estavam distanciados a menos de 2 da reta
% ###############

%dist = (w(1).*x1 + w(2).*x2 + w(3))./sqrt(w(1).^2+w(2).^2);
    
d = dist>0;             % Valores da classe a que pertence os pontos (0;1)

figure(1);
plot(x1(d),x2(d), 'r.',x1(~d),x2(~d), 'b.');


% Fase de treino
niter = 100;            % Numero de iterações máximo
w0 = randn(1,3);        % Pesos iniciais do plano separador
m=0.01;                 % Fator de aprendizagem
li = [0.1,10];          % Intervalo do parametro lambda da função sigmoidal
                        % Começa com lambda = 0.5 e termina com lambda =
                        % 10;
                        
[W,E] = train_sigmf_classifier(niter,[x1 x2 ones(n,1)], dist, w0,m,li);

% Testar o resultado da aprendizagem
wx = w(1).*x1 + w(2).*x2 + w(3);
%a = sigmf(wx,[10,0]);
a=1./(1+exp(-10.*wx));
figure(2);
plot3(x1,x2,a,'.');
box on; grid on;

figure(3);
i=a>0.5;
plot(x1(i),x2(i),'r.',x1(~i),x2(~i),'.b');

figure(4);
bar(E);

function [w,E] = train_sigmf_classifier(niter,x,d, w0,m,li)
% Função de treino do classificador sigmoidal
    E = zeros(niter,1);     % Regista o erro em cada iteração
    w=w0;                   % Pesos iniciais
    n=size(x,1);
    
    for ni=1:niter
        alfa = (ni-1)./(niter-1);
        L= li(1).*(1-alfa)+li(2)*alfa;
        wx = w(1).*x(:,1) + w(2).*x(:,2) + w(3);
        a = 1./(1+exp(-L.*wx));
        da_dw = L.*a.*(1-a).*x;
        
        % Adaptação dos pesos (W)
        w = w+m*2/n*(d-a)'*da_dw;
        
        % Calcular o erro de aproximação
        a = 1./(1+exp(-L.*wx'));
        E(ni) = (d-a)'*(d-a)./n;
        fprintf('\n (%d) Erro=%d', ni, E(ni));
        
    end
end