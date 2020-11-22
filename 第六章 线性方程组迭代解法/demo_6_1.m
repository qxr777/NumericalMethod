% 以第六章 例题 1 为例（第 180 页）
% Jacobi 迭代法（分量形式）求解方程组
clear;
% 输入值
A = [8 -3 2; 4 11 -1; 6 3 12];
b = [20; 33; 36];
tol = 1e-4;
x_k = [1230; 0; -213];
x_star = [3; 2; 1];

A_ = A;
for i = 1 : length(A)
    A_(i,i) = 0;    % 对角线元素设置为0
end
for i = 0 : 50
    x_k_plus_1 = (b - A_ * x_k) ./ diag(A);  % Jacobi迭代公式(分量形式)
    if (max(abs(x_k - x_k_plus_1)) < tol)
        fprintf('迭代次数: %d\n', i);
        fprintf('误差的无穷范数: %d\n', norm(x_k_plus_1 - x_star, inf));
        fprintf('方程组的根: %10.8f\n', x_k_plus_1);
        break;
    end
    x_k = x_k_plus_1;
end