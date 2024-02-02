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
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0 0];
str=[];
ts=[];

function sys=mdlDerivatives(t,x,u)
%% 输入
u1=u(1);
u2=u(2);


%% Parameters
mw=0.5; mc=17;
Iw=0.0023; Ic=0.537; Im=0.0011;
R=0.095;
L=0.24;
d=0.05;


m=mc+2*mw; %eq(26)
I=Ic+mc*d^2+2*mw*L^2+2*Im; %eq(27)
m0=m+2*Iw/R^2; %eq(44)
I0=I+2*L^2*Iw/R^2; %eq(44)

%%  Derived from nonlinear model eq(44)

sys(1)=(u1/R+mc*d*x(2)^2)/m0;
sys(2)=(u2*L/R-mc*d*x(1)*x(2))/I0;


function sys=mdlOutputs(t,x,u)
%% Nonlinear output v and w

sys(1)=x(1);
sys(2)=x(2);


