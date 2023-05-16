% Dimensões
a=1;
b=0.7;
c=0.1;

% Trajectória
ang=(0:1/180:2)'.*pi;
n=length(ang);
r=0.6+0.2*sin(8*ang);
x=r.*cos(ang);
y=r.*sin(ang);

dr_dang=0.2*8*cos(8*ang);
dx_dang=dr_dang.*cos(ang)-r.*sin(ang);
dy_dang=dr_dang.*sin(ang)+r.*cos(ang);
beta=atan2(dy_dang,dx_dang); % angulo da tangente à trajéctoria

figure(1);
h=plot([0;a;a+b;a+b+c],[0;0;0;0],'b',x,y,'r');
axis([-a-b-c a+b+c -a-b-c a+b+c]./1.5);

for k=1:n
    % Modelo inverso
    
    % Coordenadas do ponto P: R-c*[cos(beta;sins(beta)]
    Px=x(k)-c*cos(beta(k));
    Py=y(k)-c*sin(beta(k));
    
    teta2=acos((Px.^2+Py.^2-a*a-b*b)/(2*a*b));
    
    teta1=atan2(Py,Px)-atan2(b*sin(teta2),a+b*cos(teta2));
    
    teta3=beta(k)-teta1-teta2;
    
    % Coordenadas do ponto Q
    Qx=a*cos(teta1);
    Qy=a*sin(teta1);
    
    % Coordenadas do ponto P
    Px=Qx+b*cos(teta1+teta2);
    Py=Qy+b*sin(teta1+teta2);
    
    % Coordenadas do ponto R
    Rx=Px+c*cos(teta1+teta2+teta3);
    Ry=Py+c*sin(teta1+teta2+teta3);
    
    set(h(1),'XData',[0;Qx;Px;Rx],'YData',[0;Qy;Py;Ry]);
    pause(0.1);
end