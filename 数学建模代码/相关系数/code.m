clear;clc
load data1
xx= data1;
%% ͳ������
mmin = min(xx);  % ÿһ�е���Сֵ
mmax = max(xx);   % ÿһ�е����ֵ
ave = mean(xx);  % ÿһ�еľ�ֵ
media = median(xx);  %ÿһ�е���λ��
skew = skewness(xx); %ÿһ�е�ƫ��
std = std(xx);  % ÿһ�еı�׼��
ans = [mmin;mmax;ave;media;skew;std]  %����Щͳ�����ŵ�һ�������б�ʾ


%% �������֮������ϵ��
[R,pp]=corr(xx, 'type' , 'Spearman')
pp < 0.01  % �ҵ�3����
(pp < 0.05) .* (pp > 0.01)  % �ҵ�2����
(pp < 0.1) .* (pp > 0.05)  % �ҵ�1����

