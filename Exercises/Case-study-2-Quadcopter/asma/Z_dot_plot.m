% M. sharman
% % 5th dec 2017
% corresponds to the simulink model of Quadrotor_Model_KF_NN

load('Ta.mat')
load('Ia.mat')
load('measured.mat')


i =1:5001;

figure(1)
plot(i/100,measured(i,2),'Color',[0.6 0.6 0.6],'linewidth',2)
hold on
plot(i/100,Ia(1,i),'b','linewidth',2)
plot(i/100,(O(1,i)+0.027)*15,'Color',[1 0 0],'linewidth',2);
plot(i/100,Ta(1,i),'--','Color',[0 1 0],'linewidth',2)
xlabel('Time (Sec)','fontsize',26)
ylabel('Roll angle (deg)','fontsize',26)
set(gca,'fontsize',26)
legend('Measured','KF','DLNN','real')
grid on
xlim([0 50])
% magnifyOnFigure;


figure(2)
plot(i/100,measured(i,3),'Color',[0.6 0.6 0.6],'linewidth',2)
hold on
plot(i/100,Ia(2,i),'b','linewidth',2)
plot(i/100,(O(2,i)+0.044)*10,'Color',[1 0 0],'linewidth',2); 
plot(i/100,Ta(2,i),'--','Color',[0 1 0],'linewidth',2)
xlabel('Time (Sec)','fontsize',26)
ylabel('Pitch angle (deg)','fontsize',26)
set(gca,'fontsize',26)
legend('Measured','KF','DLNN','real')
grid on
xlim([0 50])
% magnifyOnFigure;


figure(3)
plot(i/100,measured(i,4),'Color',[0.6 0.6 0.6],'linewidth',2)
hold on
plot(i/100,Ia(3,i),'b','linewidth',2)
plot(i/100,(O(3,i)*(4/5)-1.3),'Color',[1 0 0],'linewidth',2);
plot(i/100,Ta(3,i),'--','Color',[0 1 0],'linewidth',2)
xlabel('Time (Sec)','fontsize',26)
ylabel('Yaw angle (deg)','fontsize',26)
set(gca,'fontsize',26)
legend('Measured','KF','DLNN','real')
grid on
xlim([0 50])


figure(4)
subplot(3,1,1)
plot(i/100,abs(Ia(1,i))-abs(Ta(1,i)),'b')
hold
plot(i/100,abs(O(1,i)+0.027)*15-abs(Ta(1,i)),'m')
xlabel('Time (sec)','fontsize',22)
ylabel('Roll (deg)','fontsize',22)
set(gca,'fontsize',22)
legend('KF error','DLNN error')
grid on
xlim([0 50])

subplot(3,1,2)
plot(i/100,abs(Ia(2,i))-abs(Ta(2,i)),'b')
hold
plot(i/100,abs((O(2,i)+0.044)*10)-abs(Ta(2,i)),'m')
xlabel('Time (sec)','fontsize',22)
ylabel('Pitch (deg)','fontsize',22)
set(gca,'fontsize',22)
legend('KF error','DLNN error')
grid on
xlim([0 50])

subplot(3,1,3)
plot(i/100,abs(Ia(3,i))-abs(Ta(3,i)),'b')
hold
plot(i/100,abs(O(3,i)*(4/5)-1.3)-abs(Ta(3,i)),'m')
xlabel('Time (sec)','fontsize',22)
ylabel('Yaw (deg)','fontsize',22)
set(gca,'fontsize',22)
legend('KF error','DLNN error')
grid on
xlim([0 50])




RMSEE_rollKF= sqrt(mean(abs((Ta(1,i) - Ia(1,i))).^2))% sqrt(mean(real - estimated).^2))'
RMSEE_pitchKF= sqrt(mean(abs((Ta(2,i) - Ia(2,i))).^2))% sqrt(mean(real - estimated).^2))'
RMSEE_yawKF= sqrt(mean(abs((Ta(3,i) - Ia(3,i))).^2))% sqrt(mean(real - estimated).^2))'


RMSEE_roll= sqrt(mean(abs((Ta(1,i) - (O(1,i)+0.027)*15).^2)))% sqrt(mean(real - estimated).^2))'
RMSEE_pitch= sqrt(mean(abs((Ta(2,i) - (O(2,i)+0.044)*10).^2)))% sqrt(mean(real - estimated).^2))'
RMSEE_yaw= sqrt(mean(abs((Ta(3,i) - (O(3,i)*(4/5)-1.3)).^2)))% sqrt(mean(real - estimated).^2))'

