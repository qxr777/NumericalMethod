%  演示调用 消去法
clear;
A=[1,-2,2; 2,-3,-3; 4,1,6];
b=[-2;4;3];

%  调用 高斯消去法
x = my_ge(A, b)

%  调用 列主元高斯消去法
%x = my_ge_with_column_pivoting(A, b)

% 直接调用matlab左除运算符
%x_ = A\b

