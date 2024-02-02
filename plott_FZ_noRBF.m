close all;
%-----------------------------------误差---------------------------------
figure(1);%车体坐标误差
plot(t1,car_error1(:,1),'r',...
    t1,car_error1(:,2),'b',...
    t1,car_error1(:,3)+1.565,'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');

h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(2);%世界坐标误差
plot(t1,tracking_error1(:,1),'r',...
     t1,tracking_error1(:,2),'b',...
     t1,tracking_error1(:,3),'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');
h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(3);%总体误差
plot(t1,sqrt((car_error1(:,1)).^2+(car_error1(:,2)).^2+(car_error1(:,3)).^2),...
    'r -.','linewidth',1);
legend('Reference position','Real','FontSize',10,'Fontname','TimesNewRoman');
xlabel('Time [s]');ylabel('${\left\| E \right\|_2}$ ',...
    'interpreter','latex','fontsize',10); 

%----------------------------运动学模型的输出及其跟踪-----------------------
figure(5);
plot(t1,kinematic_control1(:,1),'r-','linewidth',1);%运动学控制器输出v
hold on 
plot(t1,dynamic_vw1(:,1),'b-','linewidth',1);%动力学控制模型输出v
hold on
plot(t1,ideal_position1(:,4),'g','linewidth',1);%期望输出v

xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$v_c$','$v$','$v_r$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')


figure(6);
plot(t1,kinematic_control1(:,2),'r','linewidth',1);%运动学控制器输出w
hold on 
plot(t1,dynamic_vw1(:,2),'b','linewidth',1);%动力学控制模型输出w
hold on
plot(t1,ideal_position1(:,5),'g','linewidth',1);%期望输出w

h=legend('$\omega_c$','$\omega$','$\omega_r$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Angular Velocity','FontSize',10,'Fontname','TimesNewroman');


figure(7);%动力学模型控制输入
plot(t1,dynamic1(:,1),'r:',t1,dynamic1(:,2),'b','linewidth',1);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Control Input','FontSize',10,'Fontname','TimesNewroman');
h=legend('${\tau_l}$','${\tau_r}$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')


%--------------------运行轨迹与各分轨迹------------------------------------
figure(9);%总体运行轨迹
plot(ideal_position1(:,1),ideal_position1(:,2),'r','linewidth',1);
hold on
plot(real_position1(:,1),real_position1(:,2),'b','linewidth',1);
legend('Reference trajectory','Actual trajectory','FontSize',10,'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewRoman');
ylabel('Tracking performance','FontSize',10,'Fontname','TimesNewRoman');


figure(10);%TRACKING PERFORMANCE
plot(t1,ideal_position1(:,1),t1,real_position1(:,1),'r','linewidth',1);
hold on
plot(t1,ideal_position1(:,2),t1,real_position1(:,2),'b','linewidth',1);
hold on
plot(t1,ideal_position1(:,3),t1,real_position1(:,3),'k','linewidth',1);
legend('X','Y','Theta','FontSize',10,'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewRoman');
ylabel('Reference position','FontSize',10,'Fontname','TimesNewRoman');

figure(11);%运动学控制器输出v
plot(t1,kinematic_control1(:,1),'r-','linewidth',1);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$v_c$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')


figure(12);%运动学控制器输出v
plot(t1,kinematic_control1(:,2),'r-','linewidth',1);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$\omega_c$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')


figure(13);%运动学控制器输出跟踪误差
plot(t1,kinematic_control1(:,1)-dynamic_vw1(:,1),'r','linewidth',1);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Tracking error of velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$v_c-v$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')


figure(14);%运动学控制器输出跟踪误差
plot(t1,kinematic_control1(:,2)-dynamic_vw1(:,2),'b','linewidth',1);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Tracking error of angular velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$\omega_c-\omega$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

