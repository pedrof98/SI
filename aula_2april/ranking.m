function I = ranking(ns,npool,D)
% ->Funcao de selecao pelo metodo da ranking
% ->npool = quantos individuos a escolher
% ->ns - numero de individuos a selecionar dentro dum subconjunto aleatorio d
% "nPools" individuos da populaçao

% nPop - tamanho da populaçao
[nPop,cz] = size(P);

% Escolher npool individuos aleatoriamente da populaçao
% J - indice desses individuos
J = ceil(rand(npool,1).*nPop);  % ceil arredonda ao nº inteiro seguinte
% Destes vamos escolher os melhores

[~,j] = sort(D(J),'descend');
I = zeros(ns,1);
CD = cumsum(D);

for k=1:ns
    r = rand.*CD(end);
    I(k) = find(CD<=r,1,'last'); 
end
end