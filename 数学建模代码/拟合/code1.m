clear;clc
load data1
%导入一组变量
x= data2(1:1:5,1);
y= data2(1:1:5,2);
%运用工具箱进行拟合
cftool
%% 选择曲线形式
n = size(x,1);
%自主通过工具箱拟合好的曲线进行选择
Judge= input('二次函数输入1 一次函数输入2 指数函数输入3 三次函数输入4');
if Judge == 1
    k =  input('请输入 K');
    b =  input('请输入 b');
    c =  input('请输入 c');
end
if Judge == 2
    k =  input('请输入 K');
    b =  input('请输入 b');
end
if Judge == 4
   k =  input('请输入 K');
   b =  input('请输入 b');
   c =  input('请输入 c');
   d =  input('请输入 d');
end
if Judge == 3
   a =  input('请输入 a');
   b =  input('请输入 b');
end
%% 进行作图
%作出实验变量的点
plot(x,y,'.','Markersize',30)
% 给x和y轴加上标签
xlabel('温度')
ylabel('C4烯烃选择性')
hold on % 继续在之前的图形上作图
grid on 
xx = 230: 0.1 :470;  
%依据曲线类型计算
if Judge == 1
    yy = k * xx.^2 + b*xx+c; 
end
if Judge == 2
   yy = k * xx + b;
end
if Judge == 4
   yy = k * xx.^3 + b*xx.^2+c*xx+d;
end
if Judge == 3
   yy=a*(xx.^b);
end
%作出曲线
plot(xx,yy,'LineWidth',2)
