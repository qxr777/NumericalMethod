% 埃特金方法加速迭代方法求解方程
clear;
format long;
tol = 1e-6;
N = 100;
x0 = 0.5;
phi = @(x) exp(-x);
%phi = @(x) (x+1)^(1/3);

% 普通迭代
for k = 1 : N
    x1 = phi(x0);
    if abs(x1 - x0) < tol
        fprintf('方程的正根: %10.8f\n', x1);
        break;
    end
    x0 = x1;
end
if k == N
    fprintf('迭代方法失败\n');
end
fprintf('迭代次数: %d\n', k);


x0 = 0.5;
y2 = 0;
for k = 1 : N
    x1 = phi(x0);
    x2 = phi(x1);
    y1 = y2;
    y2 = x0 - (x1 - x0)^2 / (x2 - 2 * x1 + x0);
    if abs(y2 - y1) < tol
        fprintf('方程的正根: %10.8f\n', y2);
        break;
    end
    x0 = x1;
    x1 = x2;
end
if k == N
    fprintf('Aitken加速迭代方法失败\n');
end
fprintf('Aitken加速迭代次数: %d\n', k);