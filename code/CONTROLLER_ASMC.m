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
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 8;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [0 0]; %x(1)=gama_hat;x(2)=alpha_hat
str = [];
ts  = [];
function sys=mdlDerivatives(t,x,u)
%% Nonlinear model input
vc=u(1);
wc=u(2);
v=u(3);
w=u(4);
ev_int=u(5); %integral of ev
ew_int=u(6); %integral of ew
vc_dot=u(7); 
wc_dot=u(8);
ev=vc-v;
ew=wc-w;
%% Parameters
belta=5;
a=0.5;b=0.5;
R=1;
L=1;
I0_min=0.57;I0_max=4.57;
m0_min=17.51;m0_max=37.51;

%% %sliding surface
s1=ev+belta*ev_int; 
s2=ew+belta*ew_int; 

%% adaptive law for ASMC
% related parameter eq(75)
gamma_hat_min=m0_min*R;gamma_hat_max=m0_max*R;
alpha_hat_min=I0_min*R/L;alpha_hat_max=I0_max*R/L;

%  adaptive law eq(73) and Proj() function eq(74)
if x(1)==gamma_hat_max && -a*s1*(vc_dot+belta*ev)>0
   x(1)=0;
elseif x(1)==gamma_hat_min && -a*s1*(vc_dot+belta*ev)<0
    x(1)=0;
else 
    x(1)=-a*s1*(vc_dot+belta*ev);
end

if x(2)==alpha_hat_max && -b*s2*(wc_dot+belta*ew)>0
   x(2)=0;
elseif x(1)==alpha_hat_min && -b*s2*(wc_dot+belta*ew)<0
    x(2)=0;
else 
    x(2)=-b*s2*(wc_dot+belta*ew); 
end

%% output adaptive parameters: gamma_hat; alpha_hat

sys(1)=x(1);
sys(2)=x(2);



 
function sys=mdlOutputs(t,x,u)
%%  Input
vc=u(1);
wc=u(2);
v=u(3);
w=u(4);
ev_int=u(5);
ew_int=u(6);
vc_dot=u(7);
wc_dot=u(8);

%% Parameters
belta=5;
K1=0.171;K2=0.171;
eta1=39;eta2=39;
epsi=0.05;

%% Sliding surface
ev=vc-v;
ew=wc-w;

s1=ev+belta*ev_int;
s2=ew+belta*ew_int;

%% ASMC control law eq(76)
u1=x(1)*(vc_dot+belta*ev)+K1*s1+eta1*tanh(s1/epsi);
u2=x(2)*(wc_dot+belta*ev)+K2*s2+eta2*tanh(s2/epsi);

sys(1)=u1;
sys(2)=u2;
sys(3)=x(1);
sys(4)=x(2);
