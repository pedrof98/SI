n=200;
x=rand(n,1);
y=4*x+2;
C1=[x y+2+randn(n,1)*0.5];

C2=[x y-2+randn(n,1)*0.5];
C=[C1;C2];

X=[ones(2*n,1),C];
D=[ones(n,1);-ones(n,1)];

% Equação reduzida da recta. y=tan(W(1))*x+W(2)  ou y-tan(W(1))*x-W(2)=0
W=randn(3,1);
m=0.001;

for k=1:200

    for i=1:2*n
        a=[-W(1);-tan(W(2));1];
        y(i)=sign(X(i,:)*a);
        r=D(i)-y(i);
        W=W-m*X(i,:)'.*r;
    end
    %NW=sqrt(W(2:3)'*W(2:3));
    %W=W./NW;
    W(3)=1;
    a=[-W(1);-tan(W(2));1];
    y=sign(X*a);
    Soma_Erro=sum(abs(D-y))

    I=y>0;
    figure(1);
    %W(1)+W(2).*x+W(3)*y=0
    %y=-W(1)/W(3)+W(2)/W(3).*x
    R=[0 -W(1)/W(3); 1 -W(1)/W(3)-W(2)/W(3)];
    plot(C(I,1),C(I,2),'r.',C(~I,1),C(~I,2),'b.',R(:,1),R(:,2),'k');

    pause(0.01);
    
    if Soma_Erro==0
        break;
    end
end
k