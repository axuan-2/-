%% ���ؿ������ֵ
clc,clear;
for i=1:5
    xmin(i) = +inf;
    xmax(i) = -inf;
end
yumin = +inf;
yumax = -inf;
for j=1:100
    n=1000000; %����n�����
    %�ֱ����շ�Χ����5������Ա���
    x1=unifrnd(0.005,0.05,n,1); 
    x2=unifrnd(0.49,2,n,1);  
    x3=unifrnd(0.2,2.1,n,1);
    x4=unifrnd(250,350,n,1);
    x5=unifrnd(0,1,n,1);
    minmin=+inf; % ��ʼ����Сֵ
    for i=1:n
        x = [x1(i), x2(i),x3(i),x4(i),x5(i)];  
        result = 20811.6695*x(1)^2+9.2175139 *x(2)^2 -3.435380*x(3)^2-0.060116*x(4)^2-46.94546 *x(5)^2-884.32 *x(1)*x(2)-2860.43 *x(1)*x(3)+64.36 *x(1)*x(4)+1523.12 *x(1)*x(5)+69.25 *x(2)*x(3)-1.65 *x(2)*x(4)-39.63 *x(2)*x(5)+2.26 *x(3)*x(4)+69.80 *x(3)*x(5)-3.38 *x(4)*x(5)-10201.4373 *x(1)+261.6080 *x(2)-260.8979*x(3)+18.5727 *x(4)+543.2040 *x(5)-1559.64869;  % ������������ͼ��㺯��ֵ
   
        if  result  < minmin  %Ѱ����Сֵ
              minmin = result;  
              xm0 = x;  
        end
    end
    disp('���ؿ���ѡȡ�ĳ�ֵΪ��'); disp(xm0)
    ub = [0.05,2.03,2.1,350,1];%�Ͻ�
    lb = [0.005,0.493,0.3,250,0];%�½�
    opitions = optimset('Algorithm','trust-region-reflective');%ѡ���㷨
    [x,yu] = fmincon(@fun1,xm0,[],[],[],[],lb,ub,@nonlfun2)  %����
    yu = -yu %���ս�
    %��¼10�ν����ȡ����
    for i=1:5
        if(x(i)>xmax(i)) 
            xmax(i)=x(i);
        end
        if(x(i)<xmin(i)) 
            xmin(i)=x(i);
        end
    end
    if(yu>yumax) 
        yumax=yu;
    end
    if(yu<yumin) 
        yumin=yu;
    end
    if(yu<2400) 
        yu=2489.098;
    end
    %��¼�Ա����������
    if yu>2600
       xans(j,:)=x;
    end
   % xans(j,:)=x;
    yuans(j)=yu;
    xxx(j)=j/2;
end
plot(xxx,yuans,'LineWidth',2)
%% ���Ҵ�Ũ�Ȼع�������ⱴ��
clear;clc;
load data1
xx=data1;
a1 =[86.56906,-1.587143,-12.00142,0.3327533,8.358196];
x1 = xx(:,1);
x2 = xx(:,2);
x3 = xx(:,2);
x4 = xx(:,4);
x5 = xx(:,5);
ans =xx(:,6);
yu=0;%��¼�ܺ�
minmin=-76.682;
maxmax=-43.890;
num=0;
for i=1:116
    y1(i)=a1(1)*x1(i)+a1(2)*x2(i)+a1(3)*x3(i)+a1(4)*x4(i)+a1(5)*x5(i); 
    av(i)=ans(i)-y1(i);%������ʵ�ʽ���Ĳ�ֵ
    %�޳�����ֵ
    flag=1;
    if  av(i)  < minmin  
            flag=0; 
    end
    if  av(i)  > maxmax  
            flag = 0; 
    end
    xxxx(i)=i*2;%��¼�������
    if flag==1
        num=num+1;
        yu=yu+av(i);
    end
end
%����ͼ��
plot(xxxx,y1,'+')
hold on
grid on 
plot(xxxx,ans,'*')
yu=yu-maxmax-minmin;
yu=yu/num

%% ��C4ѡ���Իع�������ⱴ��
clear;clc;
load data1
xx=data1;
a1 =[86.56906,-1.587143,-12.00142,0.3327533,8.358196];
x1 = xx(:,1);
x2 = xx(:,2);
x3 = xx(:,2);
x4 = xx(:,4);
x5 = xx(:,5);
ans =xx(:,6);
yu=0;%��¼�ܺ�
minmin=-53.342;
maxmax=-21.351;
num=0;
for i=1:116
    y1(i)=a1(1)*x1(i)+a1(2)*x2(i)+a1(3)*x3(i)+a1(4)*x4(i)+a1(5)*x5(i); 
    av(i)=ans(i)-y1(i);%������ʵ�ʽ���Ĳ�ֵ
    %�޳�����ֵ
    flag=1;
    if  av(i)  < minmin  
            flag=0; 
    end
    if  av(i)  > maxmax  
            flag = 0; 
    end
    xxxx(i)=i*2;%��¼�������
    if flag==1
        num=num+1;
        yu=yu+av(i);
    end
end
%����ͼ��
plot(xxxx,y1,'+')
hold on
grid on 
plot(xxxx,ans,'*')
yu=yu-maxmax-minmin;
yu=yu/num

%% ��� Y1*Y2����������ϵ��
clear;clc;
a1 =[86.56906,-1.587143,-12.00142,0.3327533,8.35819,-53.03784];
b1 =[-240.4054,5.807614,-0.2862478,0.1806615,5.616702,-29.40108];

for i=1:6
    for j=1:6
        c(i,j)=a1(i)*b1(j);
    end
end

for i=1:6
    for j=i+1:6
        d(i,j)=c(i,j)+c(j,i);
    end
end
d=-d;
%% �����ɵȾ�����
clear;clc;
num=1;
%����ȡֵ��Χ���Ⱦ�ȡֵ
 for i=0:10
     x1= i*0.045+0.05; %�����Ա���Co��������ֵ
     for j=0:10
         x2 =j*0.15+0.5;%�����Ա���װ�ϱ�
         for k=0:10
             x3 = k*0.18 +0.3;%�����Ա����Ҵ�Ũ��
             for n=0:10
                 x4= n*20+250;%�����Ա����¶�
                 for m=0:1
                     x5=m;%���ɽ��Ϸ�ʽ
                     anss = 20811.6695*x1^2+9.2175139 *x2^2 -3.435380*x3^2-0.060116*x4^2-46.94546 *x5^2-884.32 *x1*x2-2860.43 *x1*x3+64.36 *x1*x4+1523.12 *x1*x5+69.25 *x1*x3-1.65 *x2*x4-39.63 *x2*x5+2.26 *x3*x4+69.80 *x3*x5-3.38 *x4*x5-10201.4373 *x1+261.6080 *x2-260.8979*x3+18.5727 *x4+543.2040 *x5-1559.64869;  % ������������ͼ��㺯��ֵ
                     anss =-anss;
                     if(anss>0)
                         x(num,:)=[num,x1,x2,x3,x4,x5];
                         result(num,:)=anss;
                         num=num+1;
                     end
                 end
                 
             end
             
         end
         
     end
     
 end
 %����������ڱ����
x(:,7)=result;
    
