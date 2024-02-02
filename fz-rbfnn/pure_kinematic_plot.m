close all;

figure(1);%车体坐标误差
plot(t3,car_error3(:,1),'r',...
    t3,car_error3(:,2),'b',...
    t3,car_error3(:,3),'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');
h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(2);%世界坐标误差
plot(t3,tracking_error3(:,1),'r',...
     t3,tracking_error3(:,2),'b',...
     t3,tracking_error3(:,3),'k','linewidth',1);
xlabel('Time(s)');ylabel('Tracking Error');
h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')



figure(3);%运动学控制器线速度
plot(t3,kinematic_control3(:,1),'r','linewidth',1);
xlabel('Time(s)');ylabel('Velocity');
h=legend('$v$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(4);%运动学控制器角速度
plot(t3,kinematic_control3(:,2),'r','linewidth',1);
xlabel('Time(s)');ylabel('Velocity');
h=legend('$\omega$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')



figure(5);%TRACKING PERFORMANCE
plot(ideal_position3(:,1),ideal_position3(:,2),'r:','linewidth',1);
hold on
plot(real_position3(:,1),real_position3(:,2),'b','linewidth',1);
legend('Reference position','Real','FontSize',12,'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewRoman');
ylabel('Tracking performance','FontSize',12,'Fontname','TimesNewRoman');

figure(6);%TRACKING PERFORMANCE
plot(t3,ideal_position3(:,1),t3,real_position3(:,1),'r','linewidth',1);
hold on
plot(t3,ideal_position3(:,2),t3,real_position3(:,2),'b','linewidth',1);
hold on
plot(t3,ideal_position3(:,3),t3,real_position3(:,3),'k','linewidth',1);
legend('X','Y','Theta','FontSize',12,'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewRoman');
ylabel('Reference position','FontSize',12,'Fontname','TimesNewRoman');


figure(7);%TRACKING PERFORMANCE
plot(t3,sqrt((car_error3(:,1)).^2+(car_error3(:,2)).^2),'r','linewidth',1);
hold on
legend('Tracking Error','FontSize',12,'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewRoman');
ylabel('${\left\| E \right\|_2}$ ','interpreter','latex','FontSize',12,'Fontname','TimesNewRoman');



figure(8);%运动学控制器线速度误差
plot(t3,kinematic_control3(:,1)-ideal_position3(:,4),'r','linewidth',1);
xlabel('Time(s)');ylabel('Velocity');
h=legend('$v$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(9);%运动学控制器角速度
plot(t3,kinematic_control3(:,2)-w_r,'r','linewidth',1);
xlabel('Time(s)');ylabel('Velocity');
h=legend('$\omega$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')
