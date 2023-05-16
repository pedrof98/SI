%aula_11march

[X1,X2] = meshgrid(-10:0.1:10);

% X3 = 2*X1+X2-2;
X3 = 2*X1+X2-2*X1.*X2+0.1.*X1.^2-0.5.*X2.^2-2;

figure(1);
% surf(X1,X2,X3);
% hold on;
surf(X1,X2,sign(X3));
% hold off;