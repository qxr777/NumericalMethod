% Newton 迭代法
clear; clc
%f = @(x) x*exp(x)-1;
%df = @(x) exp(x)*(1+x);

 f = @(x) sin(x);
 df = @(x) cos(x);

n = 10;
tol = 1e-16;
%x0 = 0.5; % 初始值
x0 = 6; % 初始值
for k = 1 : n
    x = x0 - f(x0)/df(x0);
    fprintf('k=%d, x=%.18f\n',k,x);
    if abs(x-x0)<tol, break, end
    x0 = x;
end
