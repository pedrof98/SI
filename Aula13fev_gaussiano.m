[X,Y]=meshgrid(0:0.025:1);

Tx=exp(-(X-0.5).^2/0.01);

Ty=exp(-(Y-0.5).^2/0.04);

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