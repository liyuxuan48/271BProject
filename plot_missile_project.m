%% plot


% %% load data
data100tele = load('100tele.mat');
data1000tele = load('1000tele.mat');
data10000tele = load('10000tele.mat');
data100 = load('100.mat');
data1000 = load('1000.mat');
data10000 = load('10000.mat');
corr_r_100 = corr(data100.rhist);
corr_r_1000 = corr(data1000.rhist);
corr_r_10000 = corr(data10000.rhist);
% corr_r_100tele = corr(data100tele.rhist);
% corr_r_1000tele = corr(data1000tele.rhist);
% corr_r_10000tele = corr(data10000tele.rhist);


% trange = data100tele.trange;
%% Kalman gain
fig = figure(1)
set(gcf,'Color','w');

plot(trange,Khist(:,1),'b-','LineWidth',1.5)
hold on
plot(trange,Khist(:,2),'g-','LineWidth',1.5)
hold on
plot(trange,Khist(:,3),'r-','LineWidth',1.5)

legend('$K_{1}$','$K_{2}$','$K_{3}$','Interpreter','latex');

xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('Kalman Gains','Fontsize',12)
title('Kalman Gain History','Fontsize',12);
set(gca,'FontSize',12);
hold off

%% Error variance 
figure(2)
set(gcf,'Color','w');

plot(trange,sqrt(Phist(:,1,1)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(Phist(:,2,2)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(Phist(:,3,3)),'r-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000tele.Xhist(:,:,1)-data10000tele.Xeaphist(:,:,1)))','b*','MarkerIndices',1:200:length(data10000tele.trange))
hold on
plot(trange,sqrt(var(data10000tele.Xhist(:,:,2)-data10000tele.Xeaphist(:,:,2)))','g*','MarkerIndices',1:200:length(data10000tele.trange))
hold on
plot(trange,sqrt(var(data10000tele.Xhist(:,:,3)-data10000tele.Xeaphist(:,:,3)))','r*','MarkerIndices',1:200:length(data10000tele.trange))
hold off

legend('RMS error in position [ft]','RMS error in velocity [ft/s]','RMS error in acceleration [ft/(s^2)]','simulation position RMS error (N=10000)','simulation velocity RMS error (N=10000)','simulation acceleration RMS error (N=10000)' );

xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('Standard deviation of the state error','Fontsize',12)
title('Standard deviation of the state error','Fontsize',12);
set(gca,'FontSize',12);

hold off


figure(3)
set(gcf,'Color','w');
set(gcf,'Position',[100 20 1200 800])
subplot(3,1,1);
plot(trange,sqrt(var(data100.Xhist(:,:,1)-data100.Xeaphist(:,:,1)))' - sqrt(data100.Phist(:,1,1)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data1000.Xhist(:,:,1)-data1000.Xeaphist(:,:,1)))' - sqrt(data1000.Phist(:,1,1)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000.Xhist(:,:,1)-data10000.Xeaphist(:,:,1)))' - sqrt(data10000.Phist(:,1,1)),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('error of $\sqrt{P_{11}}$','Fontsize',12,'Interpreter','Latex')
legend('N=100','N=1000','N=10000','Location','bestoutside');
% title('error of $\sqrt{P_{11}}$','Fontsize',12,'Interpreter','Latex');
set(gca,'FontSize',12);
subplot(3,1,2);
plot(trange,sqrt(var(data100.Xhist(:,:,2)-data100.Xeaphist(:,:,2)))' - sqrt(data100.Phist(:,2,2)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data1000.Xhist(:,:,2)-data1000.Xeaphist(:,:,2)))' - sqrt(data1000.Phist(:,2,2)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000.Xhist(:,:,2)-data10000.Xeaphist(:,:,2)))' - sqrt(data10000.Phist(:,2,2)),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('error of $\sqrt{P_{22}}$','Fontsize',12,'Interpreter','Latex');
legend('N=100','N=1000','N=10000','Location','bestoutside');
% title('error of $\sqrt{P_{22}}$','Fontsize',12,'Interpreter','Latex');
set(gca,'FontSize',12);
subplot(3,1,3);
plot(trange,sqrt(var(data100.Xhist(:,:,3)-data100.Xeaphist(:,:,3)))' - sqrt(data100.Phist(:,3,3)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data1000.Xhist(:,:,3)-data1000.Xeaphist(:,:,3)))' - sqrt(data1000.Phist(:,3,3)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000.Xhist(:,:,3)-data10000.Xeaphist(:,:,3)))' - sqrt(data10000.Phist(:,3,3)),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('error of $\sqrt{P_{33}}$','Fontsize',12,'Interpreter','Latex');
legend('N=100','N=1000','N=10000','Location','bestoutside');
% title('error of $\sqrt{P_{33}}$','Fontsize',12,'Interpreter','Latex');
set(gca,'FontSize',12);

figure(4)
set(gcf,'Color','w');
set(gcf,'Position',[100 20 1200 400])

plot(trange(2:10:end-1),corr_r_100(1,2:10:end),'b-','LineWidth',1.5)
hold on
plot(trange(2:10:end-1),corr_r_1000(1,2:10:end),'g-','LineWidth',1.5)
hold on
plot(trange(2:10:end-1),corr_r_10000(1,2:10:end),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('$\frac{cov(r(0), r(t))}{\sigma_{r(0)}\sigma_{r(t)}}$','Fontsize',12,'Interpreter','Latex');
title('$\frac{cov(r(0), r(t))}{\sigma_{r(0)}\sigma_{r(t)}}$ at different t for different N','Fontsize',12,'Interpreter','Latex');
legend('N=100','N=1000','N=10000','Location','best');
set(gca,'FontSize',12);


figure(5)
set(gcf,'Color','w');
set(gcf,'Position',[100 20 1200 800])
subplot(3,1,1);
plot(trange,sqrt(var(data100tele.Xhist(:,:,1)-data100tele.Xeaphist(:,:,1)))' - sqrt(data100tele.Phist(:,1,1)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data1000tele.Xhist(:,:,1)-data1000tele.Xeaphist(:,:,1)))' - sqrt(data1000tele.Phist(:,1,1)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000tele.Xhist(:,:,1)-data10000tele.Xeaphist(:,:,1)))' - sqrt(data10000tele.Phist(:,1,1)),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('error of $\sqrt{P_{11}}$','Fontsize',12,'Interpreter','Latex')
legend('N=100','N=1000','N=10000','Location','bestoutside');
% title('error of $\sqrt{P_{11}}$','Fontsize',12,'Interpreter','Latex');
set(gca,'FontSize',12);
subplot(3,1,2);
plot(trange,sqrt(var(data100tele.Xhist(:,:,2)-data100tele.Xeaphist(:,:,2)))' - sqrt(data100tele.Phist(:,2,2)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data1000tele.Xhist(:,:,2)-data1000tele.Xeaphist(:,:,2)))' - sqrt(data1000tele.Phist(:,2,2)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000tele.Xhist(:,:,2)-data10000tele.Xeaphist(:,:,2)))' - sqrt(data10000tele.Phist(:,2,2)),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('error of $\sqrt{P_{22}}$','Fontsize',12,'Interpreter','Latex');
legend('N=100','N=1000','N=10000','Location','bestoutside');
% title('error of $\sqrt{P_{22}}$','Fontsize',12,'Interpreter','Latex');
set(gca,'FontSize',12);
subplot(3,1,3);
plot(trange,sqrt(var(data100tele.Xhist(:,:,3)-data100tele.Xeaphist(:,:,3)))' - sqrt(data100tele.Phist(:,3,3)),'b-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data1000tele.Xhist(:,:,3)-data1000tele.Xeaphist(:,:,3)))' - sqrt(data1000tele.Phist(:,3,3)),'g-','LineWidth',1.5)
hold on
plot(trange,sqrt(var(data10000tele.Xhist(:,:,3)-data10000tele.Xeaphist(:,:,3)))' - sqrt(data10000tele.Phist(:,3,3)),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('error of $\sqrt{P_{33}}$','Fontsize',12,'Interpreter','Latex');
legend('N=100','N=1000','N=10000','Location','bestoutside');
% title('error of $\sqrt{P_{33}}$','Fontsize',12,'Interpreter','Latex');
set(gca,'FontSize',12);

figure(6)
set(gcf,'Color','w');
set(gcf,'Position',[100 20 1200 400])

plot(trange(2:10:end-1),corr_r_100tele(1,2:10:end),'b-','LineWidth',1.5)
hold on
plot(trange(2:10:end-1),corr_r_1000tele(1,2:10:end),'g-','LineWidth',1.5)
hold on
plot(trange(2:10:end-1),corr_r_10000tele(1,2:10:end),'r-','LineWidth',1.5)
hold off
xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('$\frac{cov(r(0), r(t))}{\sigma_{r(0)}\sigma_{r(t)}}$','Fontsize',12,'Interpreter','Latex');
title('$\frac{cov(r(0), r(t))}{\sigma_{r(0)}\sigma_{r(t)}}$ at different t for different N','Fontsize',12,'Interpreter','Latex');
legend('N=100','N=1000','N=10000','Location','best');
set(gca,'FontSize',12);

figure(7)
set(gcf,'Color','w');
set(gcf,'Position',[100 20 1000 600])
plot(trange,data100.Xhist(2,:,1),'b-','LineWidth',1)
hold on
plot(trange,data100.Xhist(2,:,2),'g-','LineWidth',1)
hold on
plot(trange,data100.Xhist(2,:,3),'r-','LineWidth',1)
hold on
plot(trange,data100.Xeaphist(2,:,1),'c-','LineWidth',1)
hold on
plot(trange,data100.Xeaphist(2,:,2),'m-','LineWidth',1)
hold on
plot(trange,data100.Xeaphist(2,:,3),'k-','LineWidth',1)
hold on
plot(trange,data100.Xhist(2,:,1) + 2*squeeze(sqrt(Phist(:,1,1)))','b--','LineWidth',1)
hold on 
plot(trange,data100.Xhist(2,:,1) - 2*squeeze(sqrt(Phist(:,1,1)))','b--','LineWidth',1)
hold on
plot(trange,data100.Xhist(2,:,2) + 2*squeeze(sqrt(Phist(:,2,2)))','g--','LineWidth',1)
hold on 
plot(trange,data100.Xhist(2,:,2) - 2*squeeze(sqrt(Phist(:,2,2)))','g--','LineWidth',1)
hold on
plot(trange,data100.Xhist(2,:,3) + 2*squeeze(sqrt(Phist(:,3,3)))','r:','LineWidth',1)
hold on 
plot(trange,data100.Xhist(2,:,3) - 2*squeeze(sqrt(Phist(:,3,3)))','r:','LineWidth',1)

xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('State values','Fontsize',12)
title('One realization real and estimated state values','Fontsize',12);
legend('real location [ft]','real velocity [ft/s]','real acceleration [ft/(s^2)]','estimated location [ft]','estimated velocity [ft/s]','estimated acceleration [ft/(s^2)]','Location','bestoutside');
set(gca,'FontSize',12);
hold off

figure(8)
set(gcf,'Color','w');
set(gcf,'Position',[100 20 1000 600])
plot(trange,data100tele.Xhist(2,:,1),'b-','LineWidth',1)
hold on
plot(trange,data100tele.Xhist(2,:,2),'g-','LineWidth',1)
hold on
plot(trange,data100tele.Xhist(2,:,3),'r-','LineWidth',1)
hold on
plot(trange,data100tele.Xeaphist(2,:,1),'c-','LineWidth',1)
hold on
plot(trange,data100tele.Xeaphist(2,:,2),'m-','LineWidth',1)
hold on
plot(trange,data100tele.Xeaphist(2,:,3),'k-','LineWidth',1)
hold on
plot(trange,data100tele.Xhist(2,:,1) + 2*squeeze(sqrt(Phist(:,1,1)))','b--','LineWidth',1)
hold on 
plot(trange,data100tele.Xhist(2,:,1) - 2*squeeze(sqrt(Phist(:,1,1)))','b--','LineWidth',1)
hold on
plot(trange,data100tele.Xhist(2,:,2) + 2*squeeze(sqrt(Phist(:,2,2)))','g--','LineWidth',1)
hold on 
plot(trange,data100tele.Xhist(2,:,2) - 2*squeeze(sqrt(Phist(:,2,2)))','g--','LineWidth',1)
hold on
plot(trange,data100tele.Xhist(2,:,3) + 2*squeeze(sqrt(Phist(:,3,3)))','r--','LineWidth',1)
hold on 
plot(trange,data100tele.Xhist(2,:,3) - 2*squeeze(sqrt(Phist(:,3,3)))','r--','LineWidth',1)

xlabel('Time-to-Go [s]','Fontsize',12)
ylabel('State values','Fontsize',12)
title('One realization real and estimated state values','Fontsize',12);
legend('real location [ft]','real velocity [ft/s]','real acceleration [ft/(s^2)]','estimated location [ft]','estimated velocity [ft/s]','estimated acceleration [ft/(s^2)]','Location','bestoutside');
set(gca,'FontSize',12);
hold off
