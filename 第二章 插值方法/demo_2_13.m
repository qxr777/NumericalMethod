% Runge 函数的Lagrange插值与三次样条插值比较
clear; clc;

f = @(x) 1./(1+x.^2);
a = -5; b = 5;
n = 10; % 10等分
X = [ a : (b-a)/n : b ]; % 插值节点
Y = f(X);

% 用10次多项式插值
x = -5 : 0.1 : 5;  % 需要插值的点, 绘图用 
y1 = zeros(1,length(x));
for i = 1 : length(x)
    for k = 0 : n
        y1(i) = y1(i) + Y(k+1)*prod(x(i)-X([1:k,k+2:end]))/prod(X(k+1)-X([1:k,k+2:end]));
    end
end

% 三次样条插值
df = @(x) -2*x/(x*x+1)^2;  % 一阶导数
df0 = df(-5); dfn = df(5);
y2 = spline(X,[df0; Y(:); dfn], x);

% 绘图
plot(x,f(x),'r-', x,y1,'b-',x,y2,'k-','LineWidth',2);
axis([-5,5,-1,2]);
title('10次插值','FontSize',20); 
legend('f(x)','Lagrange','spline')
hold on
plot(X,Y,'or','MarkerSize',12,'LineWidth',2)
hold off
