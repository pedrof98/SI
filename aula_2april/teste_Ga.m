% Programa exemplo de teste do algoritmo GA
global C;
global H;
% centros
C = [0 0; 5 10; -10 5; 10 10; -10 10; 10 -10];

%altura do monte (valor desempenho da particula)
H = [4; 4; -2; 10; 9; 7];

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
% ALGORITMO GA
% ###############

cz = 2;     % Tamanho dos cromossomas
n = 20;     % numero de individuos
nger = 20; % Numero de geracoes do processo evolutivo

% posição inicial das particulas 
P = rand(n,cz).*30-15;     % população inicial
% A linha 'i' de 'p' representa o cromossoma do individuo

D = desempenho(P);

% Melhor global em cada geração 
[Dmax, I]= max(D);
% Matriz para guardar o melhor individuo em cada geracao
Pgerbest = zeros(nger,cz);   
% Vetor que guarda o melhor individuo em cada geracao
Dgerbest = zeros(nger);      
Pgerbest(1,:) = P(I,:);
Dgerbest(1) = Dmax;

figure(2);
clf;
contour(x1,x2,D0);
axis([-20 20 -20 20]);
hold on;
h = plot(P(1,:)',P(2,:)','k.');
hb = plot(Pgerbest(1),Pgerbest(2),'rx');
hold off;

% Parametros dos metodos de selecao
nsRoleta = 5;
nsRank = 5;
nPool = 10;
nNew = 10;  % nº de individuos novos gerados em cada geracao

for ng = 1:nger     % Ciclo geracional
    % Passo 1: Selecao
    % Utilizamos 2 metodos de selecao
    % passamos o valor de desempenho de cada individuos, e quantos quermos selecionar, e ele devolve o indice
    I1 = roleta(nsRoleta, D); 
    I2 = ranking(nsRank,nPool,D);
    % Indices dos individuos selecionados
    I = [I1;I2];
    
    % Passo 2: Reproducao
    % Cruzamento dos cromossomas (crossover)
    % Devolve a nova populacao e envia os individuos selecionados
    %Pnew1 = naturalXover(P(I,:));
    Pnew = simpleXover(nNew,P(I,:));
    Dnew = desempenho(Pnew);
    
    
   
    % Passo 3: Substituir os individuos com fraco desempenho pelos novos
    % individuos
    [~,J] = sort(D);
    P(J(1:nNew))=Pnew;
    D(J(1:nNew))=Dnew;
    
    
    % Passo 4: Mutacao dos cromossomas
    %naturalMotation();
    
    
    % Desempenho das particulas nas suas novas posições
    D = desempenho(P);
    
    % Atualizar a melhor condição pessoal de cada particula
    J = find(D>Dbest);
    Dbest(J) = D(J);
    Pbest(:,J) = P(:,J);
    
    % Calcular e melhor posição global
    [Dmax, I]= max(D);
    if Dmax > Dgerbest
        Pgerbest = P(:,I);
        Dgerbest = Dmax;
        set(hb,'XData', Pgerbest(1)','YData', Pgerbest(2)');
    end
    
    % atualizar as posiçoes das particulas
    set(h,'XData', P(1,:)','YData', P(2,:)');
    pause(0.2);
end


function  D = desempenho(P)
% ####################################
% Função desempenho das particulas
% #####################################
global C;
global H;

[n,~] = size(P);
D = zeros(n,1); 

for i = 1:length(H)
    D = D + H(i).*exp((-(P(1,:)-C(i,1)).^2-(P(2,:)-C(i,2)).^2)/20);
end
end

