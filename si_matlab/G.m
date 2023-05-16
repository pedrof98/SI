function G(x,c,w)
    nc=length(c);
    n=length(x);
    y=zeros(n,nc);
    for i=1:nc
        y(:,i)=exp(-((x-c(i)/w).^2));
    end
end
