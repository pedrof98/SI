function [U,V]=K_means(niter,c,X,nfig,V)
% Algoritmo K-means
% [U,V]=K_means(niter,c,X)
% niter - número de iterações máximo
% c - nº de clusters; X - dados
% U - matriz de partição; V - centros dos clusters

if nargin<4
    nfig=[];
end

[nx,n]=size(X); % X ( nx x n) -> os pontos têm dimensão nx

%Passo 0:
if nargin<5
    V=zeros(nx,c);
    for i=1:c
        k=ceil(rand.*n);
        V(:,i)=X(:,k);
    end
else
    %Passo 1:
    U=zeros(c,n);
    for i=1:n
        
        for j=1:c
            d(j)=(X(:,i)-V(:,j))'*(X(:,i)-V(:,j));
        end
    
        [min_d,J]=min(d);
        j=J(1);
        
        U(j,i)=1;
    end
end
U_old=zeros(c,n); %U(j,i) - grau de pertença do ponto i ao cluster j

d=zeros(c,1);
for ni=1:niter
    %Passo 1:
    U=zeros(c,n);
    for i=1:n
        
        for j=1:c
            d(j)=(X(:,i)-V(:,j))'*(X(:,i)-V(:,j));
        end
    
        [min_d,J]=min(d);
        j=J(1);
        
        U(j,i)=1;
    end
    
    % Passo 2: Recalcular os centros dos clusters
    for j=1:c
       V(:,j)=sum(U(j,:).*X,2)./sum(U(j,:),2);
    end
        
    % Visualizar a repartição dos dados pelos clusters
    if ~isempty(nfig)
        Cores=['b';'r';'k';'m';'c'];
        figure(nfig);
        clf;
        hold on;
        for j=1:c
            I=U(j,:)'==1;
            plot(X(1,I),X(2,I),[Cores(j),'.'],V(1,j),V(2,j),'k*');
        end
        hold off;
        pause(1);
    end
    
    DU=sum(sum(abs(U-U_old)));
    U_old=U;
    
    fprintf('\n ni=%d : DU= %d',ni,DU);
    
    if DU==0
        break;
    end
end