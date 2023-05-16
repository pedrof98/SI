function [U,V]=k_means(niter,c,X,nfig,V)
%Algoritmo K-means
%[U,V]=K_means(c,X)
%niter-numero de iterações maximos
%c - nº de custers ; X- dados
%U-matriz de partição; V- centros dos clusters

if nargin<4
    nfig=[];
end
[nx,n]=size(X); % X (nx x n )->os pontos tem dimensoes nx

%Passo 0 
if nargin<5
    V = zeros(nx,c);
    for i=1:c
        k=ceil(rand.*n);
        V(:,i)=X(:,k);
    end
end
    %Passo 1
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
U_old=zeros(c,n);
%U = ones(c,n); %U(j,i) - grau da pertença do pto i ao cluster j

%DU = sum(sum(abs(U-U_old)));

d=zeros(c,1);
for ni=1:niter
    
  %Passo 1
  U=zeros(c,n);
  for i=1:n
      for j=1:c
          d(j)=(X(:,i)-V(:,j))'*(X(:,i)-V(:,j));
      end
      
      [min_d,J]=min(d);
      j=J(1);
      
      U(j,i)=1;
  end
  
  %Passo 2: Recalcular os centros dos Cluster's
  for j=1:c
      V(:,j)=sum(U(j,:).*X,2)./sum(U(j,:),2);   
  end
  
  %Visualizar a repartição dos daados pelos Clusters
  if ~isempty(nfig)
      figure(nfig);
      %for j=1:c
          %subplot(1,c,j);  
          I1=U(1,:)'==1;
          I2=U(2,:)'==1;
          I3=U(3,:)'==1;
          plot(X(1,I1),X(2,I1),'b.',X(1,I2),X(2,I2),'r.',X(1,I3),X(2,I3),'k.',V(1,:),V(2,:),'g*');
      %end

      pause(1);
  end
  DU = sum(sum(abs(U-U_old)));
  U_old=U;
  
  fprintf('\n ni=%d : DU= %d', ni, DU);
  
  if DU == 0
      break;
  end
end
end