function I=ranking(ns,npool,D)
% Função de seleção pelo método da Ranking
% ns - numero de individuos a selecionar dentro de um subconjunto aleatório
% de "npool" individuos da população

nPop = length(D); % nPop - tamanho da população

% Escolher npool individuos aleatoriamente da população
J=ceil(rand(npool,1).*nPop); % J indices desses individuos

[~,j]=sort(D(J),'descend');

I=J(j(1:ns));