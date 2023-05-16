clc
n = 1000;
x1 = rand(n,1).*20-10;
x2 = rand(n,1).*20-10;

w=[-1 1 0];
dist = (w(1).*x1 + w(2).*x2 + w(3))./sqrt(w(1).^2+w(2).^2);

% ####### eliminar pontos da dist ########
indice = find(abs(dist)<2);
x1(indice) = [];
x2(indice) = [];
dist(indice) = [];

n=length(x1);       %numero de pontos sobrantes apos a eliminação daqueles  
                    %que estavam distanciados a menos de 2 da reta
% ###############

%dist = (w(1).*x1 + w(2).*x2 + w(3))./sqrt(w(1).^2+w(2).^2);

d = dist>0;


figure(1);
plot(x1(d),x2(d), 'r.',x1(~d),x2(~d), 'b.');

niter = 100;
w0 = randn(1,3);
li = [0.5,10];          % Intervalo do parametro lambda da função sigmoidal
                        % Começa com lambda = 0.5 e termina com lambda =
                        % 20;
[W,E] = train_sigmf_classifier(niter,[x1,x2],dist, w0,m,li);


function [W,E] = train_sigmf_classifier(niter,x,d, w0,m,li)
% Função de treino do classificador sigmoidal
    E = zeros(niter,1);
    W=w0;
    
    for ni=1:niter
        alfa = (ni-1)./(niter-1);
        L= li(1).*(1-alfa)+li/(2)*alfa;
        y=sigmf(W*x,[L,0]);
        
        % Adaptação dos pesos (W)
        
    end
end