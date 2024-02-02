close all;
%-----------------------------------误差---------------------------------
figure(1);%车体坐标误差
subplot(3,1,1);
plot(t2,car_error2(:,1),'r','linewidth',1)
subplot(3,1,2);
plot(t2,car_error2(:,2),'b','linewidth',1)
subplot(3,1,3)
plot(t2,car_error2(:,3),'k','linewidth',1);
    %t2,car_error2(:,3)+1.565,'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');

h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

figure(2);%世界坐标误差
plot(t2,tracking_error2(:,1),'r',...
     t2,tracking_error2(:,2),'b',...
     t2,tracking_error2(:,3),'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');
h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

figure(3);%总体误差
plot(t2,sqrt((car_error2(:,1)).^2+(car_error2(:,2)).^2+(car_error2(:,3)).^2),...
    'r -.','linewidth',1);
legend('Reference position','Real','FontSize',12,'Fontname','TimesNewRoman');
xlabel('Time [s]');ylabel('${\left\| E \right\|_2}$ ',...
    'interpreter','latex','fontsize',12); 

%----------------------------运动学模型的输出及其跟踪-----------------------
figure(5);
plot(t2,kinematic_control2(:,1),'r-','linewidth',1);%运动学控制器输出v
hold on 
plot(t2,dynamic_vw2(:,1),'b-','linewidth',1);%动力学控制模型输出v
hold on
plot(t2,ideal_position2(:,4),'g','linewidth',1);%期望输出v

xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$v_c$','$v$','$v_r$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(6);
plot(t2,kinematic_control2(:,2),'r','linewidth',1);%运动学控制器输出w
hold on 
plot(t2,dynamic_vw2(:,2),'b','linewidth',1);%动力学控制模型输出w
hold on
plot(t2,ideal_position2(:,5),'g','linewidth',1);%期望输出w
%plot(t2,w_r2,'g','linewidth',1);%期望输出w
h=legend('$\omega_c$','$\omega$','$\omega_r$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Angular Velocity','FontSize',12,'Fontname','TimesNewroman');


figure(7);%动力学模型控制输入
plot(t2,dynamic2(:,1),'r:',t2,dynamic2(:,2),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Control Input','FontSize',12,'Fontname','TimesNewroman');
h=legend('${\tau_l}$','${\tau_r}$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')
axis([0 40 -100 100 ])
figure(8);%RBF神经网络估计
plot(t2,dynamic2(:,3),'r',...
     t2,dynamic2(:,4),'b',...
     t2,dynamic2(:,5),'r--',...
     t2,dynamic2(:,6),'b--','linewidth',1);
xlabel('Time(s)');ylabel('Disturbance and its estimation');
h=legend('${{\bar d}_1}$',' ${\widehat {\overline d }_1}$',...
        '${{\bar d}_2}$',' ${\widehat {\overline d }_2}$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewRoman')

%--------------------运行轨迹与各分轨迹------------------------------------
figure(9);%总体运行轨迹
plot(ideal_position2(:,1),ideal_position2(:,2),'r','linewidth',1);
hold on
plot(real_position2(:,1),real_position2(:,2),'b','linewidth',1);
legend('Reference trajectory','Actual trajectory','FontSize',12,...
      'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewRoman');
ylabel('Tracking performance','FontSize',12,'Fontname','TimesNewRoman');


figure(10);%TRACKING PERFORMANCE
plot(t2,ideal_position2(:,1),t2,real_position2(:,1),'r','linewidth',1);
hold on
plot(t2,ideal_position2(:,2),t2,real_position2(:,2),'b','linewidth',1);
hold on
plot(t2,ideal_position2(:,3),t2,real_position2(:,3),'k','linewidth',1);
legend('X','Y','Theta','FontSize',12,'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewRoman');
ylabel('Reference position','FontSize',12,'Fontname','TimesNewRoman');

figure(11);%运动学控制器输出v
plot(t2,kinematic_control2(:,1),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$v_c$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(12);%运动学控制器输出v
plot(t2,kinematic_control2(:,2),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$\omega_c$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(13);%运动学控制器输出跟踪误差
plot(t2,kinematic_control2(:,1)-dynamic_vw2(:,1),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Tracking error of velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$v_c-v$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(14);%运动学控制器输出跟踪误差
plot(t2,kinematic_control2(:,2)-dynamic_vw2(:,2),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Tracking error of angular velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$\omega_c-\omega$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

