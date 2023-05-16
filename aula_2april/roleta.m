function I = roleta(ns,D)
% Funcao de selecao pelo metodo da roleta

I = zeros(ns,1);
CD = cumsum(D);

for k=1:ns
    r = rand.*CD(end);
    I(k) = find(CD<=r,1,'last'); 
end
end