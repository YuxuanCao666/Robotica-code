function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
global c b
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 9;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];





 
function sys=mdlOutputs(t,x,u)
global c b h1 h2 
a_v=u(1);%激活函数的一部分
a_w=u(4);%激活函数的一部分
e1=u(2);%v_c的误差
e2=u(5);%w_c的误差
de1=u(3);%v_c的误差的导数
de2=u(6);%w_c的误差的导数
v_c=u(7);
w_c=u(8);
theta=u(9);


%% 机器人物理参数

R=0.15;
r=0.03;
%考虑机器人物理参数m，I会发生突变
if t>5
    m=6;
    I=5;
else
    m=4;
    I=2.5;
end
%考虑会发生外部干扰
S=1;
switch S
    case 1
        if t>15 | t==15
            d=[1; sin(t);exp(-0.05*t)];
        else
            d=[0;0;0];
        end
    case 2
        if t>15 | t==15
            d=[cos(t); cos(t);cos(t)];
        else
            d=[0;0;0];
        end
    case 3
        if t>15 | t==15
            d=[exp(-t);exp(-t);exp(-t)];
        else
            d=[0;0;0];
        end
    case 4
        if t>15 | t==15
            d=[0.01*t;0.01*t;0.01*t];
        else
            d=[0;0;0];
        end
end
%---------雅可比矩阵-------------
J=[cos(theta) 0; sin(theta) 0; 0 1];
%-----------机器人不确定性及确定干扰------
d_u=J'*d;%待估计补偿

alpha=0.2;
d_k=[-(1+alpha)*m*w_c*sin(theta)*cos(theta)*(w_c-v_c); %确定
            0];



%---动力学系数矩阵---
F_bar=r/(2*R)*[m*R  I; m*R  -I];
%求B_bar=1./r*[1 1; R -R]的逆矩阵;
B_inv=0.5*r*[1, 1/R; 1, -1/R];




%% 控制器表达式

tau1=F_bar(1,1)*a_v+F_bar(1,2)*a_w-B_inv(1)*(d_u(1)+d_k(1));
tau2=F_bar(2,1)*a_v+F_bar(2,2)*a_w-B_inv(2)*(d_u(2)+d_k(2));


sys(1)=tau1;
sys(2)=tau2;
sys(3)=d_u(1);
sys(4)=d_u(2);
