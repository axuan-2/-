clear;clc
load data1
xx= data1;
%% 统计描述
mmin = min(xx);  % 每一列的最小值
mmax = max(xx);   % 每一列的最大值
ave = mean(xx);  % 每一列的均值
media = median(xx);  %每一列的中位数
skew = skewness(xx); %每一列的偏度
std = std(xx);  % 每一列的标准差
ans = [mmin;mmax;ave;media;skew;std]  %将这些统计量放到一个矩阵中表示


%% 计算各列之间的相关系数
[R,pp]=corr(xx, 'type' , 'Spearman')
pp < 0.01  % 找到3颗星
(pp < 0.05) .* (pp > 0.01)  % 找到2颗星
(pp < 0.1) .* (pp > 0.05)  % 找到1颗星

