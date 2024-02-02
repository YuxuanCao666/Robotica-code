close all;
vr=0.06;
wr=0;
%没有优化的，跟踪性能同Kx，Ky,Ktheta的取值密切相关
%% Tracking performance
figure(1);%Overall
plot(real_position(:,1),real_position(:,2),'k','linewidth',1.5);
hold on
plot(ideal_position(:,1),ideal_position(:,2),'b:','linewidth',1.5);
legend('Mobile Robot Trajectory','Reference Trajectory','FontSize',10,...
       'Fontname','TimesNewRoman');
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewRoman');
ylabel('Tracking performance','FontSize',10,'Fontname','TimesNewRoman');


%% Tracking error
figure(2);%e_x,e_y,e_theta
plot(t, car_error(:,1),'r',...
     t, car_error(:,2),'b',...
     t, car_error(:,3),'k','linewidth',1.5);
xlabel('Time(s)');ylabel('Tracking Error');
h=legend('${{x_r}- x}$','${{y_r}- y}$','${\theta _r}-\theta$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(8);%e_x,e_y,e_theta
plot(t, sqrt(car_error(:,1).^2+car_error(:,2).^2),'b','linewidth',1.5);
xlabel('Time(s)');ylabel('Tracking Error');


%% Velocity tracking
figure(3);
plot(t,kinematic_control(:,1),'r-','linewidth',1.5);%vc
hold on 
plot(t,dynamic_vw(:,1),'b-','linewidth',1.5);%v
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel(' Velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$v_c$','$v$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(4);%linear velocity tracking error
plot(t,kinematic_control(:,1)-dynamic_vw(:,1),'r','linewidth',1.5);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Tracking error of velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$v_c-v$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(5);
plot(t,kinematic_control(:,2),'r','linewidth',1.5);%wc
hold on 
plot(t,dynamic_vw(:,2),'b','linewidth',1.5);%w
h=legend('$\omega_c$','$\omega$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Angular Velocity','FontSize',10,'Fontname','TimesNewroman');


figure(6);%angular velocity tracking error
plot(t,kinematic_control(:,2)-dynamic_vw(:,2),'b','linewidth',1.5);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Tracking error of angular velocity','FontSize',10,'Fontname','TimesNewroman');
h=legend('$\omega_c-\omega$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(7);%Dynamic control iuput
plot(t,dynamic(:,1)/2+dynamic(:,2)/2,'r:',...
     t,dynamic(:,1)/2-dynamic(:,2)/2,'b','linewidth',1.5);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Control Input','FontSize',10,'Fontname','TimesNewroman');
h=legend('${\tau_l}$','${\tau_r}$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

figure(9);%Adaptive parameter
plot(t,dynamic(:,3),'r:',t,dynamic(:,4),'b','linewidth',1.5);
xlabel('Time(s)','FontSize',10,'Fontname','TimesNewroman');
ylabel('Adaptive parameter','FontSize',10,'Fontname','TimesNewroman');
h=legend('${\hat \gamma}$','${\hat \alpha}$');
set(h,'Interpreter','latex','FontSize',10,'Fontname','TimesNewroman')

