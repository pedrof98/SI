function m = pontosDeQuebra(nBreakPoints,cz)
% Devolve a máscara a gerar com n break points

m = false(1,cz);
for k=1:nBreakPoints
    r = ceil(rand.*(cz-2))+1;
    
    m(r:cz) =- m(r:cz);
end

end