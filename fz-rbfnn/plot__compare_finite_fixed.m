%-----------------------------------误差---------------------------------
figure(1);%车体坐标误差
subplot(3,1,1);
plot(t2,car_error2(:,1),'b','linewidth',1)
hold on
plot(t,car_error(:,1),'r','linewidth',1)
ylabel('Tracking Error');
h=legend('FTZNN','FZ-RBFNN');
ylabel('${x_e}$','Interpreter','latex','FontSize',12,'Fontname','TimesNewroman');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

subplot(3,1,2);
plot(t2,car_error2(:,2),'b','linewidth',1)
hold on
plot(t,car_error(:,2),'r','linewidth',1)
ylabel('${y _e}$','Interpreter','latex','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN','FZ-RBFNN');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

subplot(3,1,3)
plot(t2,car_error2(:,3),'b','linewidth',1);
hold on
plot(t,car_error(:,3),'r','linewidth',1)
xlabel('Time(s)');ylabel('${\theta _e}$','Interpreter','latex','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN','FZ-RBFNN');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

figure(2);%世界坐标误差
plot(t2,tracking_error2(:,1),'r',...
     t2,tracking_error2(:,2),'b',...
     t2,tracking_error2(:,3),'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');
h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

%----------------------------运动学模型的输出及其跟踪-----------------------
figure(5);
plot(t2,kinematic_control2(:,1),'r','linewidth',1);%有限——运动学控制器输出v
hold on 
plot(t2,dynamic_vw2(:,1),'b','linewidth',1);%有限——动力学控制模型输出v
hold on
plot(t,kinematic_control(:,1),'g','linewidth',1);%固定——运动学控制器输出v
hold on 
plot(t,dynamic_vw(:,1),'k','linewidth',1);%固定——动力学控制模型输出v
hold on
plot(t2,ideal_position2(:,4),'y','linewidth',1);%期望输出v

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

h=legend('$\omega_c$','$\omega$','$\omega_r$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Angular Velocity','FontSize',12,'Fontname','TimesNewroman');

figure(7);%动力学模型控制输入
plot(t2,dynamic2(:,1),'r',t2,dynamic2(:,2),'b','linewidth',1);
hold on
plot(t,dynamic(:,1),'g',t,dynamic(:,2),'k','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Control Input','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN ${\tau_l}$','FTZNN ${\tau_r}$','FZ-RBFNN ${\tau_l}$','FZ-RBFNN ${\tau_r}$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')
axis([0 40 -100 100 ])

%--------------------运行轨迹与各分轨迹------------------------------------
figure(9);%总体运行轨迹
plot(ideal_position2(:,1),ideal_position2(:,2),'r','linewidth',1);
hold on
plot(real_position2(:,1),real_position2(:,2),'b','linewidth',1);
hold on
plot(real_position(:,1),real_position(:,2),'k','linewidth',1);

legend('Reference trajectory','FTZNN','FZ-RBFNN','FontSize',12,...
      'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewRoman');
ylabel('Tracking performance','FontSize',12,'Fontname','TimesNewRoman');


figure(11);%运动学控制器输出v
plot(t2,kinematic_control2(:,1),'b','linewidth',1);
hold on
plot(t,kinematic_control(:,1),'r','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel(' Linear velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN','FZ-RBFNN');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(12);%运动学控制器输出v
plot(t2,kinematic_control2(:,2),'b','linewidth',1);
hold on
plot(t,kinematic_control(:,2),'r','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Angular velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN','FZ-RBFNN');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(13);%运动学控制器输出跟踪误差
plot(t2,kinematic_control2(:,1)-dynamic_vw2(:,1),'b','linewidth',1);
hold on
plot(t,kinematic_control(:,1)-dynamic_vw(:,1),'r','linewidth',1);

xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Tracking error of linear velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN','FZ-RBFNN');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(14);%运动学控制器输出跟踪误差
plot(t2,kinematic_control2(:,2)-dynamic_vw2(:,2),'b','linewidth',1);
hold on
plot(t,kinematic_control(:,2)-dynamic_vw(:,2),'r','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Tracking error of angular velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('FTZNN','FZ-RBFNN');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

