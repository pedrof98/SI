function Pnew=simpleXover(nxs,P)
% P - População de cromossomas usadas na reprodução
% nxs - número de novos individuos criados pelo método
% "Simple Crossover"

[nP,cz]=size(P);

Pnew=zeros(nxs,cz);

for k=1:nxs
   i=ceil(rand.*nP); % Escolha aleatória do individuo i de P
   j=ceil(rand.*nP); % Escolha aleatória do individuo j de P
    
   r=rand;
   Pnew(k,:)=r.*P(i,:)+(1-r).*P(j,:); 
end