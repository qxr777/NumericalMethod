% Jacobi, G-S 和 SOR 的演示

% 以第五章 习题 9 为例（第 177 页），即三对角线性方程组
clear all;

n = 128;
A = 2*eye(n) - diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);
b = eye(n,1);

D = diag(diag(A));  % A 的对角线部分
L = D - tril(A);    % -L 为 A 的严格下三角部分
U = D - triu(A);    % -U 为 A 的严格上三角部分

x0 = zeros(n,1);  % 迭代初始值
itermax = 100;    % 迭代步数

% Jacobi 方法
x = x0;
relerr_J = zeros(n+1,1); % 记录相对残量
relerr_J(1) = 1;
for k = 1 : itermax
    x = D \ ( (L+U)*x + b );
    relerr_J(k+1) = norm(b - A*x) / norm(b);  
end

% G-S 方法
x = x0;
relerr_GS = zeros(n+1,1); % 记录相对残量
relerr_GS(1) = 1;
for k = 1 : itermax
    x = (D-L) \ ( U*x + b );
    relerr_GS(k+1) = norm(b - A*x) / norm(b);  
end

% SOR 方法
omega = 1.5;  % 参数
x = x0;
relerr_SOR = zeros(n+1,1); % 记录相对残量
relerr_SOR(1) = 1;
for k = 1 : itermax
    x = (D-omega*L) \ ( ((1-omega)*D + omega*U)*x + omega*b );
    relerr_SOR(k+1) = norm(b - A*x) / norm(b);  
end

% plot the error
step = 1;
xx = 1 : step : itermax+1;

plot(xx, relerr_J(xx),'-b+');
hold on
plot(xx, relerr_GS(xx),'-ro');
plot(xx, relerr_SOR(xx),'-kd');

% semilogy(xx, relerr_J(xx),'-b+');
% hold on
% semilogy(xx, relerr_GS(xx),'-ro');
% semilogy(xx, relerr_SOR(xx),'-kd');

legend('Jacobi', 'GS', 'SOR');
title(['n=',int2str(n)]);
hold off; shg

