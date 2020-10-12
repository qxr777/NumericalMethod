% 分段线性插值 点击定位插值点
% 按return键结束程序
clear;clc;
xl = -3; xr = 3; yb= -3; yt = 3;    % 可视区域
plot([xl xr], [0 0], 'k', [0 0], [yb yt], 'k');
grid on;
xlist = []; ylist = [];    % 存储用户选择插值节点的横纵坐标
k = 0;
while(0 == 0)
    [xnew, ynew] = ginput(1);   % 用户点击可视区域选择插值节点
    if length(xnew) < 1
        break
    end
    k = k+1;
    xlist(k) = xnew;
    ylist(k) = ynew;
    if k == 1
        continue;
    end
    x = xlist(1) : 0.01 : xr;          % 待插值点，绘制曲线的横坐标    
    y = interp1(xlist,ylist,x); % 根据插值函数求出的近似值
    
    plot(xlist, ylist, 'o', x, y, [xl xr], [0 0], 'k', [0 0], [yb yt], 'k');   
    title('分段线性插值演示');
    axis([xl xr yb yt]); grid on;
end
    