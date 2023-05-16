function t=triang(x,L,C,U)
% Matriz de parametros dos triangulos.
% Cada linha contem:
% - o valor inferior do dominio, L(k,i), i o n. de triangulo
% - valor central - C(k,i)
% - o valor superior do dominio, U(k,i)
% onde k é o numero do triangulo

% Ver quantos triangulos estão definidos
nt=size(L,1);

% numero de pontos a calcular a função
[n,m]=size(x);

t=ones(n,nt);

for k=1:nt
    for i=1:m
        a=L(k,i);
        c=C(k,i);
        b=U(k,i);
        ti=max(0,min((x(:,i)-a)/(c-a),1-(x(:,i)-c)/(b-c)));
        t(:,k)=min(t(:,k),ti);
    end
end