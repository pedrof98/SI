[X,Y]=meshgrid(0:0.025:1);

Tx=max(0,min((X-0.3)/0.2,1-(X-0.5)./0.2));

Ty=max(0,min((Y-0.3)/0.2,1-(Y-0.5)./0.2));

Z=min(Tx,Ty);

figure(1);
subplot(2,2,1);
surf(X,Y,Tx);
subplot(2,2,2);
surf(X,Y,Ty);
subplot(2,2,3);
surf(X,Y,Z);
subplot(2,2,4);
surf(X,Y,Tx.*Ty);