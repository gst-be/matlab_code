clear;clc
A=input('Enter A=')
n=size(A,1); % 获取阶数

%% 一致性检验
[V,D]=eig(A); % 获取特征向量V,特征值D
lambda_max=max(D(:)); % 获取最大特征值
CI=(lambda_max-n)/(n-1);
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
CR=CI/RI(n);
if CR<0.1
    disp('一致性可以接受');
else
    error('一致性不可接受,需调整判断矩阵');
end

%% 计算权重
A_sum=sum(A);
A_sum=repmat(A_sum,n,1);
B=A./A_sum; % 归一化

%% 算术平均
result_1=sum(B,2)./n;
disp('算术平均法求得结果为');
disp(result_1);

%% 几何平均
result_2=prod(B,2).^(1/n);
disp('几何平均法求得结果为')
disp(result_2);

%% 特征值法
[r,c]=find(lambda_max==D,1);
disp('特征值法求得权重为')
disp(V(:,c)./sum(V(:,c)));
