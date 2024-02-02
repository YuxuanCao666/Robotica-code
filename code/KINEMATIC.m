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
sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0 0 0];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
%% Input: linear and angular velocity
v=u(1);
w=u(2);

%% Parameters
R=0.095;
L=0.24;
k_R=0.5;k_L=0.5; %LOE factors


dotphi_R=(v+w)/R;% derived from eq(6)
dotphi_L=(v-w)/R;% derived from eq(6)
d_wr=(k_R-1)*dotphi_R; % eq(11)
d_wl=(k_L-1)*dotphi_L; % eq(11)

%% kinematic model eq(12)
sys(1)=v*cos(x(3))+cos(x(3))*(R/2*(d_wr+d_wl));
sys(2)=v*sin(x(3))+sin(x(3))*((R/2*L)*(d_wr-d_wl));
sys(3)=w;


function sys=mdlOutputs(t,x,u)
%% states variable output: x,y,theta

sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);


