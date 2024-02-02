function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 10;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0 0];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
%状态变量x,y,theta

tol1=u(1);
tol2=u(2);
tol=[tol1; tol2];

d_u(1)=u(3);
d_u(2)=u(4);

d_u=[d_u(1);d_u(2)];

theta=u(5);
v_c=u(6);
w_c=u(7);

%% 机器人物理参数
R=0.15;
r=0.03;
alpha=0.2;
if t>10
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
            d=[1; 1;1];
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

%已知干扰
d_k=[-(1+alpha)*m*w_c*sin(theta)*cos(theta)*(w_c-v_c);
            0];

if t>15
    d_bar=d_u+d_k;
else
    d_bar=[0;0];
end

%求M_bar(-1)*B_bar结果如下
E1=1./(m*r*I)*[I I; R*m -R*m];
%求(J'*MO*J)逆矩阵的结果如下；MO=[m 0 0; 0 m 0; 0 0 I];
M_bar_inv=[1/m 0; 0 1/I];

E2=[M_bar_inv(1,1)*d_bar(1); M_bar_inv(2,2)*d_bar(2)];


sys(1)=E1(1,1)*tol(1)+E1(1,2)*tol(2)+E2(1);
sys(2)=E1(2,1)*tol(1)+E1(2,2)*tol(2)+E2(2);


function sys=mdlOutputs(t,x,u)
%状态变量x,y,theta

sys(1)=x(1);
sys(2)=x(2);


