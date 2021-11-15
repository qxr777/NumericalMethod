function q=gaussquad(fun,a,b,n,m,type)
% GAUSSQUAD  一般区间[a,b]上的Gauss积分
if nargin<6
    type='P';  % 默认Gauss公式，type可以为['P','T','P1']
end
if nargin<5 || isempty(m)
    m=4;  % 默认Gauss点数
end
if nargin<4 || isempty(n)
    n=10;  % 默认区间等分数
end
if nargin<2;
    a=-1;  b=1;  % 默认积分区间
end
[x0,A]=quadcoef(m,type);  % 求Gauss点及对应的求积系数
h=(b-a)/n;  % 每个小区间的长度
q=0;  % 区间[-1,1]上的积分初始值
for k=1:n
    q=q+A.'*fun(h/2*x0+a+(k-1/2)*h);  % 区间[-1,1]上的积分累加
end
q=h/2*q;  % 变换区间为[a,b]上的积分值
