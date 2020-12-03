% Steffenson 加速
clear; clc
f = @(x) 3*x^2-exp(x);
g = @(x) 2*log(x)+log(3);

xt = fzero(f,[3,4]);
fprintf('True solution: x = %.8f\n', xt)

n = 50; % 设置迭代步数
tol = 1e-6; 

% 不动点迭代
x = 3.5; % 迭代初始值
fprintf('普通不动点迭代\n')
for k = 1 : n
    x = g(x);
    fprintf('k=%2d, x=%.8f\n', k, x);
    if abs(x-xt)<tol, break, end
end
   
% Steffenson 加速
x = 3.5; % 迭代初始值
fprintf('===================\n');
fprintf('Steffenson 加速迭代\n')
for k = 1 : n
    x1 = g(x); x2 = g(x1);
    x = x - (x1-x)^2/(x2-2*x1+x);
    fprintf('k=%2d, x=%.8f\n', k, x);
    if abs(x-xt)<tol, break, end
end