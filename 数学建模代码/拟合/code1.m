clear;clc
load data1
%����һ�����
x= data2(1:1:5,1);
y= data2(1:1:5,2);
%���ù�����������
cftool
%% ѡ��������ʽ
n = size(x,1);
%����ͨ����������Ϻõ����߽���ѡ��
Judge= input('���κ�������1 һ�κ�������2 ָ����������3 ���κ�������4');
if Judge == 1
    k =  input('������ K');
    b =  input('������ b');
    c =  input('������ c');
end
if Judge == 2
    k =  input('������ K');
    b =  input('������ b');
end
if Judge == 4
   k =  input('������ K');
   b =  input('������ b');
   c =  input('������ c');
   d =  input('������ d');
end
if Judge == 3
   a =  input('������ a');
   b =  input('������ b');
end
%% ������ͼ
%����ʵ������ĵ�
plot(x,y,'.','Markersize',30)
% ��x��y����ϱ�ǩ
xlabel('�¶�')
ylabel('C4ϩ��ѡ����')
hold on % ������֮ǰ��ͼ������ͼ
grid on 
xx = 230: 0.1 :470;  
%�����������ͼ���
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
%��������
plot(xx,yy,'LineWidth',2)
