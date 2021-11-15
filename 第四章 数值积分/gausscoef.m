function varargout=gausscoef(a,b,n)
% GAUSSCOEF  高斯求积公式系数求解
if nargin<3
    n=2;  % 默认高斯点数
end
x=sym('x%d',[1,n],'real');  % 节点
A=sym('A%d',[1,n],'real');  % 系数
eq=sym(zeros(2*n,1));  % 存储方程组
for k=1:2*n
    eq(k,1)=dot(A,x.^(k-1))-(b^k-a^k)/k;  % 构造方程
end
vars=symvar(eq);  % 提取eq的符号变量
fun=matlabFunction(eq,'vars',{vars});  % 将eq转换成成匿名函数的形式
options=optimoptions(@fsolve,'FunctionTolerance',1e-12);
x0=fsolve(fun,2*rand(1,2*n)-1,options);  % 求Gauss点和Gauss系数
Ac=x0(1:n);  % Gauss系数
x0(1:n)=[];  % Gauss点
[varargout{1:2}]=deal(x0,...  % 第一个输出参数为Gauss点
    Ac);  % 第二个输出参数为Gauss求积系数
