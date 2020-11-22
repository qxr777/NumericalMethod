% 考虑迭代法 x = Bx + f 的收敛性
clear;

B = [0.9 0; 0.3 0.8];

fprintf('B的1范数: %f\n', norm(B, 1));
fprintf('B的2范数: %f\n', norm(B, 2));
fprintf('B的无穷范数: %f\n', norm(B, inf));

fprintf('B的谱半径: %f\n', max(abs(eig(B))));