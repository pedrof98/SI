% aula_11march_2
% Contruir 3 agrupamentos

nc = 50;

% Agrupamento 1
x1 = randn(nc,1).*2;                 %2 é o desvio padrão
y1 = randn(nc,1);

% Agrupamento 2
x2 = randn(nc,1);         
y2 = randn(nc,1)*2+10;

% Agrupamento 3
x3 = randn(nc,1).*2+10;               
y3 = randn(nc,1)*2+6;

x = [x1;x2;x3];
y = [y1;y2;y3];
xy=[x';y'];

n = length(x);

figure(1);
plot(x1,y1,'b.', x2,y2,'k.', x3,y3,'m.');

% Algoritmo K-means
% PASSO 0
c=3;
v = rand(2,c).*10;

u_old = zeros(c,n); %u(j,i) - grau de pertença do ponto i ao cluster j

d=zeros(c,1);

for ni=1:20
    % PASSO 1
    u=zeros(c,n);
    for i=1:n
        
        for j = 1:c
            d(j) = (xy(:,i)-v(:,j))'*(xy(:,i)-v(:,j));
        end
        [min_d,J]=min(d);
        j=J(1);
        
        u(j,i)=1;
    end
    
    % PASSO 2
    for j=1:c
        v(:,j)=sum(u(j,:).*xy,2)./sum(u(j,:),2);
    end
    
    % Visualizar a repartição dos dados pelos clusters
    figure(1)
    for j=1:c
        subplot(1,c,j);
        I = u(j,:)' ==1;
        plot(x,y,'k.',x(I),y(I),'r.',v(1,j),v(2,j),'g*');
    end
    pause(0.2);
    
    du = sum(sum(abs(u-u_old)));
    
    fprintf('\n ni=%D : DU= %d',ni,du);
    
    if du == 0
        break;
    end
end

