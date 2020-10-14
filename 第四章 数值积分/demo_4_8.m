%  演示 自适应积分法 p115 例7
clear;
f = @(x) 1./x.^2;
a = 0.2;
b = 1;
tol = 0.02;

%  调用 自适应积分函数
[I, fcount] = quadgui_adaptive(f, a, b, tol);

%  调用 复合Simpson积分函数
% [I, fcount] = quadgui_simpson(f, a, b, tol);


