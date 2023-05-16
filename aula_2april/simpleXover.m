function  Pnew = simpleXover(nxs,P)
% P - Populacao de cromossomas usadas na reproducao
% nxs - nº de novos individuos criados pelo simpleXover

[nP, cz] = size(P);

Pnew = zeros(nxs,cz);

for k=1:nxs
    i = ceil(rand.*nP);     % Escolha aleatoria do individuo i de P
    j = ceil(rand.*nP);     % Escolha aleatoria do individuo j de P
    
    r = rand;
    Pnew(k,:) = r.*P(i,:)+(1-r).*P(j,:);
end
end