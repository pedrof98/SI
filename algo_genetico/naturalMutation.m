function [P,IM] = naturalMutation(pm,P,Lim)
% Mutação Natural 
% pm - Probabilidade de um gene de um determinado indíviduo sofrer mutação
% P - população

% ############################
% [nPop,cz] = size(P);
% R = rand(nPop,cz)<pm;
% 
% IM = find(sum(R,2)>0);  % Índice dos individuos que sofreram mutação
% 
% PA = rand(n,cz).*(diff(Lim,1,2)')+Lim(:,1)';
% 
% P = R.*PA+(1-R).*P;
% ############################

[nPop,cz] = size(P);
IM = false(nPop,1);

% Alternativa
for i=1:nPop
    for j = 1:cz
        r = rand<pm;
       if r
            P(i,j)=rand.*(Lim(j,2)-Lim(j,1))+Lim(j,1);
            IM(i)=true;
       end
    end
    
end
end