% Dimensões do Robôs
a=1.5;
b=0.5;
c=0.2;

% #############
BT=0.005;
t=0:BT:2;
n=length(t);

Q=zeros(2,n);
P=zeros(2,n);
R=zeros(2,n);

Ob3=[c 0;2*c -c;2*c c;c 0]';

% #############

T1=0;
T2=pi/4;
T3=pi/4;

A01=[cos(T1) -sin(T1);sin(T1) cos(T1)];
c01=[0;0];
A12=[cos(T2) -sin(T2);sin(T2) cos(T2)];
c12=[a;0];
A23=[cos(T3) -sin(T3);sin(T3) cos(T3)];
c23=[b;0];

Q(:,1)=c01+A01*[a;0];
P(:,1)=c01+A01*(c12+A12*[b;0]);
R(:,1)=c01+A01*(c12+A12*(c23+A23*[c;0]));

Ob0=c01+A01*(c12+A12*(c23+A23*Ob3));

figure(1);
clf;
h=plot([0;Q(1,1);P(1,1);R(1,1)],[0;Q(2,1);P(2,1);R(2,1)],'b',...
       Ob0(1,:)',Ob0(2,:)','k');
set(h,'LineWidth',2);
axis([-a-b-c a+b+c -a-b-c a+b+c]);
grid on;

W1=2*pi;
W2=7*pi;
W3=15*pi;

for k=2:n
    
   T1=T1+W1.*BT;
   T2=T2+W2.*BT;
   T3=T3+W3.*BT;
   A01=[cos(T1) -sin(T1);sin(T1) cos(T1)];
   A12=[cos(T2) -sin(T2);sin(T2) cos(T2)];
   A23=[cos(T3) -sin(T3);sin(T3) cos(T3)];

   Q(:,k)=c01+A01*[a;0];
   P(:,k)=c01+A01*(c12+A12*[b;0]);
   R(:,k)=c01+A01*(c12+A12*(c23+A23*[c;0]));
   
   Ob0=c01+A01*(c12+A12*(c23+A23*Ob3));
   
   set(h(1),'XData',[0;Q(1,k);P(1,k);R(1,k)],'YData',[0;Q(2,k);P(2,k);R(2,k)]);
   set(h(2),'XData',Ob0(1,:)','YData',Ob0(2,:)');
   pause(0.02);
end

hold on;
plot(Q(1,:)',Q(2,:)','g',P(1,:)',P(2,:)','r',R(1,:)',R(2,:)','m');
hold off;