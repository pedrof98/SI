function y = trgf(x,a,w)
nc=length(a);
n=length(x);
y=zeros(n,nc);
for i=1:nc
    y1=(x/w)-(a(i)-w)/w;
    y2=-(x/w)+(a(i)+w)/w;
    y(:,i)=max(min(y1,y2),0);
end
end
