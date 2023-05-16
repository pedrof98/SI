a=1;
b=0.7;

% Trajectória
ang=(0:1/180:2)'.*pi;
n=length(ang);
r=0.6+0.2*sin(8*ang);
x=r.*cos(ang);
y=r.*sin(ang);

figure(1);
h=plot([0;a;a+b],[0;0;0],'b',x,y,'r');
axis([-a-b a+b -a-b a+b]./1.5);

for k=1:n
    % Modelo inverso
    teta2=-acos((x(k).^2+y(k).^2-a*a-b*b)/(2*a*b));
    
    teta1=atan2(y(k),x(k))-atan2(b*sin(teta2),a+b*cos(teta2));
    
    % Coordenadas do ponto Q
    Qx=a*cos(teta1);
    Qy=a*sin(teta1);
    % Coordenadas do ponto P
    Px=Qx+b*cos(teta1+teta2);
    Py=Qy+b*sin(teta1+teta2);
    
    set(h(1),'XData',[0;Qx;Px],'YData',[0;Qy;Py]);
    pause(0.1);
    
end