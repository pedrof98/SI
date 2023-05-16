function Pnew1 = naturalXover(nxn,nBreakPoints,P)
% Método de cruzamento genético natural
[nPop,cz] = size(P);

Pnew1 = zeros(nxn,cz);

for k=1:nxn
    % Selecionar o Pai
    i = ceil(rand.*nPop);
    j = ceil(rand.*nPop);
    
    % Definir um ponto de quebra (gerar aleatóriamente)
    m = pontosDeQuebra(nBreakPoints,cz);
    
    Pnew1(k,:) =  m.*P(i,:)+(1-m).*P(j,:);
end
end