% 二分法求方程近似根
clear;
f = @(x) x ^ 3 - x -1;
a = 1;
b = 1.5;
tol = 0.5e-5;

y0 = f(a);
while (b - a > tol)
    x = (a + b) / 2;
    y = f(x);
    if (y * y0 > 0)
        a = x;
    else
        b = x;
    end
end
x
y