close all;

figure(1);
plot(t1,kinematic_control1(:,1),'r','linewidth',1);%运动学控制器无补偿输出v
hold on 
plot(t1,dynamic_vw1(:,1),'b','linewidth',1);%动力学控制模型无补偿输出v
hold on
plot(t,dynamic_vw(:,1),'k','linewidth',1);%运动学控制器RBF补偿输出v
hold on
plot(t,kinematic_control(:,1),'y','linewidth',1);%动力学控制器RBF补偿输出v
hold on
plot(t1,ideal_position1(:,4),'g','linewidth',1);%期望输出v

xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$v_c without compensation$','$v without compensation$',...
     '$v_c with compensation$','$v with compensation$','$v_r$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')


figure(2);
plot(t1,kinematic_control1(:,2),'r','linewidth',1);%运动学控制器输出w无补偿
hold on 
plot(t1,dynamic_vw1(:,2),'b','linewidth',1);%动力学控制模型输出w无补偿
hold on
plot(t,kinematic_control(:,2),'k','linewidth',1);%运动学控制器输出wRBF补偿
hold on
plot(t,dynamic_vw(:,2),'y','linewidth',1);%动力学控制模型输出wRBF补偿
hold on
plot(t1,ideal_position1(:,5),'g','linewidth',1);%期望输出w
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('$\omega_c without compensation$','$\omega without compensation$',...
     '$\omega_c with compensation$','$\omega with compensation$','$\omega_r$');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')






figure(3);%运动学控制器输出跟踪误差
plot(t,kinematic_control(:,1)-dynamic_vw(:,1),'r','linewidth',1);
hold on
plot(t1,kinematic_control1(:,1)-dynamic_vw1(:,1),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Tracking error of linear velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('Compensation','Without Compensation');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')
set(gca, 'XTicklabel')

figure(4);%运动学控制器输出跟踪误差
plot(t,kinematic_control(:,2)-dynamic_vw(:,2),'r','linewidth',1);
hold on
plot(t1,kinematic_control1(:,2)-dynamic_vw1(:,2),'b','linewidth',1);
xlabel('Time(s)','FontSize',12,'Fontname','TimesNewroman');
ylabel('Tracking error of angular velocity','FontSize',12,'Fontname','TimesNewroman');
h=legend('Compensation','Without Compensation');
set(h,'Interpreter','latex','FontSize',12,'Fontname','TimesNewroman')

