function I=roleta(ns,D)
% Função de seleção pelo método da Roleta

I=zeros(ns,1);
CD=cumsum(D);

for k=1:ns
   r=rand.*CD(end); 
   I(k)=find(CD>=r,1);
end