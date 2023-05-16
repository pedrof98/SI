% Programa exemplo de teste do algoritmo GA
global C;
global H;
C=[0 0; 5 10;-10 5;10 10;-10 10;10 -10];
H=[4;4;-2;10;9;7];

[X1,X2]=meshgrid(-15:0.2:15);
DS=X1.*0;
for i=1:length(H)
    DS=DS+H(i).*exp((-(X1-C(i,1)).^2-(X2-C(i,2)).^2)/20);
end

figure(1);
surf(X1,X2,DS);
xlabel('X1');
ylabel('X2');

% ###############
% Algoritmo GA
% ###############
cz=2; % Tamanho do cromossoma
n=20; % número de individuos
nger=20; % nº de gerações do processo evolutivo

Lim = [-15 15; -15 15]  % Limites dos alelos de cada cromossoma

%P=rand(n,cz).*30-15; % População inicial (aleatória)
% A linha "i" de "P" representa o cromossoma do individuo "i"
P = rand(n,cz).*(diff(Lim,1,2)')+Lim(:,1)';

D=desempenho(P);
D = D+1;

% Melhor global em cada geração
[Dmax,I]=max(D);
%Matriz que guarda o melhor individuo em cada geração
Pgerbest=zeros(nger,cz);
%Vector que guarda o melhor individuo em cada geração
Dgerbest=zeros(nger,1);
Pgerbest(1,:)=P(I,:);
Dgerbest(1)=Dmax;

% Valores estatisticos de cada geração
MD = zeros(nger,1);
STDG = zeros(nger,1);
MD(1) = mean(D);        % Valor médio do desempenho da 1ª geraçao
STDG(1) = mean(std(P));       % Valor do desvio padrão do desempenho da 1ª geraçao
                             % indicador da riqueza genetica da populaçao   
figure(2);
clf;
contour(X1,X2,DS);
axis([-20 20 -20 20]);
hold on;
h=plot(P(:,1)',P(:,2),'k.');
hb=plot(Pgerbest(1,1),Pgerbest(1,2),'rx');
hold off;

% Parametros dos m�todos de selec��o
nsRol=5; % n de selecionados pleo m�todo da Roleta
nsRank=5; % n� de selecionados pelo m�todo de Ranking
npool=10;
nxs = 6;
nxn = 4;

nnew=nxs+nxn; % n� de inividuos novos gerados em cada gera��o

nBreakPoints = 1;   % nº de pontos de quebra do método naturalXover

% Parâmetros das funções de Mutação
pm = 0.1/cz;         % Probabilidade de um gene de um determinado indíviduo 
                        %da população sofrer a mutação


for ng=1:nger % Ciclo geracional
   
    % Passo 1: Seleção
    I1=roleta(nsRol,D);
    I2=ranking(nsRank,npool,D);     % torneio
    I=[I1;I2]; % indices dos individuos selecionados
   
    % Passo 2: Reprodução
    
    % Cruzamento dos cromossomas (Crossover)
    Pnew1=naturalXover(nxn,nBreakPoints,P(I,:));
    Pnew2=simpleXover(nxs,P(I,:));
    Pnew = [Pnew1;Pnew2];
    Dnew=desempenho(Pnew);
   
    % Passo 3: Substitui individuos com fraco desempenho pelos novos
    % individuos
    [~,J]=sort(D);
    P(J(1:nnew),:)=Pnew;
    D(J(1:nnew))=Dnew;
   
    
    % Passo 4: Mutação dos cromossosas (Mutation)
    %naturalMutation
    [P,IM] = naturalMutation(pm,P,Lim);
    IM = find(IM);
    DM = desempenho(P(IM,:));
    
    D(IM) = DM;
    
    % Guardar o melhor individuo da geraçao corrente
    [maxD,j]=max(D)
    DgerBest(ng) = maxD;
    PgerBest(ng,:) = P(j,:);
    
    set(h,'XData',P(:,1)','YData',P(:,2)');
    set(hb,'XData',PgerBest(ng,1)','YData',PgerBest(ng,2)');
    pause(0.1)
    % Estatisticas da população
    MD(ng) = mean(D);   
    STDG(ng) = mean(std(P));
    
end

% Escolher o melhor individuo de todas as gerações
[DglobalBest,i] = max(DgerBest);
PgerBest(i,:)

% Actualizar no gr�fico as posi��es das particulas
set(hb,'XData',PgerBest(1,:)','YData',PgerBest(2,:)');

figure(3)
nn = (1:nger)';
plot(nn,MD,'b',nn,MD+STDG,'r',nn,MD-STDG,'m');


function D=desempenho(P)
% Fun��o desempenho das particulas
%C=[0 0; 5 10;-10 5;10 10;-10 10;10 -10];
%H=[4;4;-2;10;9;7];
global C;
global H;

[n,~]=size(P);
D=zeros(n,1);
for i=1:length(H)
    D=D+H(i).*exp((-(P(:,1)-C(i,1)).^2-(P(:,2)-C(i,2)).^2)/20);
end

end