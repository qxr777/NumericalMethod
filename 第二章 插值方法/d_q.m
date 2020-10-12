% 计算差商
function dq = d_q(x,y)
%
% 参数说明：
% 输入参数： x 为节点，y 为函数值（注意：向量 x 与向量 y 的长度必须一致）
% 输出参数：
%    dq 为差商的值

m = length(x);
dq = 0;
for k = 1 : m
    dq = dq + y(k) / prod(x(k) - x([1 : k - 1, k + 1 : end]));
end

