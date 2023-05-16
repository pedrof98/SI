% Programa exemplo de teste do algoritmo PSO

% centros
C = [0 0; 5 10; -10 5; 10 10; -10 10; 10 -10];

%altura do monte (valor desempenho da particula)
H = [10; 4; -2; 4; 9; 7];

%ver gráficamente a superficie
[x1, x2] = meshgrid(-15:0.2:15);

D0 = x1.*0;

for i = 1:length(H)
    D0 = D0 + H(i).*exp((-(x1-C(i,1)).^2-(x2-C(i,2)).^2)/20);
end

figure(1);
surf(x1,x2,D0);
xlabel('x1');
ylabel('x2');


% Agora que já criamos a superficie vamos querer calcular o máximo!
% ###############
% ALGORITMO PSO
% ###############

n = 20;     % numero de particulas

% posição inicial das particulas 
P = rand(2,n).*30-15;     % cada coluna da matriz p é uma particula

% velocidade
V = randn(2,n).*0.1;        % vetor velocidade das particulas (aleatorio)

D = desempenho(P);

Pbest = P;         % melhor posicção pessoal das particulas 
Dbest = D; 

[Dmax, I]= max(D);
Pglobalbest = P(:,I);
Dglobalbest = Dmax;

figure(2);
clf;
contour(x1,x2,D0);
axis([-20 20 -20 20]);
hold on;
h = plot(P(1,:)',P(2,:)','k.');
hb = plot(Pglobalbest(1),Pglobalbest(2),'rx');
hold off;

C1 = 0.1;
C2 = 0.1;

for ni = 1:100
    % Calcular a aceleração das particulas
    
    a1 = (Pbest-P);
    a2 = (Pglobalbest-P);
    
    alfa = rand(1,n);
    beta = rand(1,n);
    a = C1.*alfa.*a1+C2.*beta.*a2;
    
    % Velocidade
    V = V + a;
    
    % Posição
    P = P + V;
    
    % Desempenho das particulas nas suas novas posições
    D = desempenho(P);
    
    % Atualizar a melhor condição pessoal de cada particula
    J = find(D>Dbest);
    Dbest(J) = D(J);
    Pbest(:,J) = P(:,J);
    
    % Calcular e melhor posição global
    [Dmax, I]= max(D);
    if Dmax > Dglobalbest
        Pglobalbest = P(:,I);
        Dglobalbest = Dmax;
        set(hb,'XData', Pglobalbest(1)','YData', Pglobalbest(2)');
    end
    
    % atualizar as posiçoes das particulas
    set(h,'XData', P(1,:)','YData', P(2,:)');
    pause(0.2);
end


function  D = desempenho(P)
% ####################################
% Função desempenho das particulas
% #####################################

% centros
C = [0 0; 5 10; -10 5; 10 10; -10 10; 10 -10];

%altura do monte (valor desempenho da particula)
H = [10; 4; -2; 4; 9; 7];

[nx,n] = size(P);
D = zeros(1,n); 

for i = 1:length(H)
    D = D + H(i).*exp((-(P(1,:)-C(i,1)).^2-(P(2,:)-C(i,2)).^2)/20);
end
end

