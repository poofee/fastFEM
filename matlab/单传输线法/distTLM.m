% 2017-12-26
% by Poofee
% 验证分布式TLM
% 寻找最优猜测值
% 2018-01-02
% 做出来了
% 可以分布式计算
close all
clear all
I = 10;%A
R1 = 10;
R2 = 10;
R3 = 10;
R4 = 10;
Y = [1/R1+1/R2+1/R4   -1/R2-1/R4;
    -1/R2-1/R4   1/R3+1/R2+1/R4];
I = [I;0];
V = Y\I;
Z1 = 20;
Z2 = 50;
U1 = [0;0];
i1 = [0;0];
U2 = [0;0];
i2 = [0;0];
a = [0;0];
b = [0;0];
% 左边的导纳矩阵
Y = [1/R1+1/R4+1/Z1   -1/R4;
        -1/R4   1/R3+1/R4+1/Z2];
% 右边的导纳矩阵
Y2 = [1/R2+1/Z1 -1/R2;
        -1/R2  1/R2+1/Z2];   
for i=1:50
%     左边的电流源电流
    a(1) = U2(1)/Z1-i2(1);
    a(2) = U2(2)/Z2-i2(2);
%     右边的电流源电流
    b(1) = U1(1)/Z1-i1(1);
    b(2) = U1(2)/Z2-i1(2);
    
    %incidence   
    I1 = I + a;    
    %reflect
    I2 = b;
    U1 = Y\I1;
    U2 = Y2\I2;    
    
    i1(1) = a(1)-U1(1)/Z1;
    i1(2) = a(2)-U1(2)/Z2;
    
    i2(1) = b(1)-U2(1)/Z1;
    i2(2) = b(2)-U2(2)/Z2;
    
    plot(i,U1(1),'ro');hold on;
    plot(i,U1(2),'bo');hold on;
    plot(i,U2(1),'r*');hold on;
    plot(i,U2(2),'b*');hold on;
end
U1-V