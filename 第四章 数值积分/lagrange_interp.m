function varargout=lagrange_interp(xdata,ydata,xi)
% LAGRANGE_INTERP  Lagrange插值
n=length(xdata);  % 求向量xdata的长度
if length(unique(xdata))<n  % 若输入的点出现相同时，给出错误提示
    error('输入的点必须是互异的.')
end
L=zeros(n);  % 存储插值基函数
for i=1:n
    px=poly(xdata([1:i-1,i+1:n]));  % 构造以x_j为根的多项式(j=1:i-1,i+1:n)
    L(i,:)=px/polyval(px,xdata(i));  % 求插值基函数并存储
end
y=sum(bsxfun(@times,L,ydata(:)));  % 求插值多项式
if nargin==3  % 若输入参数为3个
    y=polyval(y,xi);  % 根据插值多项式求指定点处的值
end
[varargout{1:2}]=deal(y,...  % 第一个输出参数为插值多项式或其在某点处的值
    L);  % 第二个输出参数为插值基函数
