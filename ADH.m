clear;clc
A=input('Enter A=')
n=size(A,1); % ��ȡ����

%% һ���Լ���
[V,D]=eig(A); % ��ȡ��������V,����ֵD
lambda_max=max(D(:)); % ��ȡ�������ֵ
CI=(lambda_max-n)/(n-1);
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
CR=CI/RI(n);
if CR<0.1
    disp('һ���Կ��Խ���');
else
    error('һ���Բ��ɽ���,������жϾ���');
end

%% ����Ȩ��
A_sum=sum(A);
A_sum=repmat(A_sum,n,1);
B=A./A_sum; % ��һ��

%% ����ƽ��
result_1=sum(B,2)./n;
disp('����ƽ������ý��Ϊ');
disp(result_1);

%% ����ƽ��
result_2=prod(B,2).^(1/n);
disp('����ƽ������ý��Ϊ')
disp(result_2);

%% ����ֵ��
[r,c]=find(lambda_max==D,1);
disp('����ֵ�����Ȩ��Ϊ')
disp(V(:,c)./sum(V(:,c)));
