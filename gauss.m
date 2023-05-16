function g=gauss(x,c,s)
% Matriz de parametros dos triangulos.
% c(k,:) valor central do Gaussiano k
% s(k,:) desvio padr�o do Gaussiano k
% onde k � o numero do Gaussiano

% Ver quantos triangulos est�o definidos
ng=size(c,1);

% n = numero de pontos a calcular a fun��o
[n,nx]=size(x);

g=zeros(n,ng);

for k=1:ng
    aux=((x(:,1)-c(k,1))./s(k,1)).^2;
    for i=1:nx
        aux=aux+((x(:,i)-c(k,i))./s(k,i)).^2;     
    end
    g(:,k)=exp(-aux);
end