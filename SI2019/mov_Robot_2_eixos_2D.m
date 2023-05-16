% Dimensões do Robôs
a=1.5;
b=0.5;

% #############
t=0:0.01:2;
n=length(t);

Q=zeros(2,n);
P=zeros(2,n);
% #############

T1=0;
T2=pi/4;

A01=[cos(T1) -sin(T1);sin(T1) cos(T1)];
c01=[0;0];
A12=[cos(T2) -sin(T2);sin(T2) cos(T2)];
c12=[a;0];
Q(:,1)=c01+A01*[a;0];
P(:,1)=c01+A01*(c12+A12*[b;0]);

figure(1);
clf;
h=plot([0;Q(1,1);P(1,1)],[0;Q(2,1);P(2,1)]);
set(h,'LineWidth',2);
axis([-a-b a+b -a-b a+b]);
grid on;

W1=2*pi;
W2=9*pi;

for k=2:n
    
   T1=T1+W1.*0.01;
   T2=T2+W2.*0.01;

   A01=[cos(T1) -sin(T1);sin(T1) cos(T1)];
   A12=[cos(T2) -sin(T2);sin(T2) cos(T2)];

   Q(:,k)=c01+A01*[a;0];
   P(:,k)=c01+A01*(c12+A12*[b;0]);
   
   set(h,'XData',[0;Q(1,k);P(1,k)],'YData',[0;Q(2,k);P(2,k)]);
   pause(0.1);
end

hold on;
plot(Q(1,:)',Q(2,:)','g',P(1,:)',P(2,:)','r');
hold off;