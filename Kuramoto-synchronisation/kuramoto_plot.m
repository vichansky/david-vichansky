%% Kuramoto plot

%% 
%% c = uisetcolor

orange = uisetcolor([0.87 0.49 0],'Select a color');
green = uisetcolor([0.47 0.67 0.19],'Select a color');
blue = uisetcolor([0 0.45 0.74],'Select a color');
pink = uisetcolor([1 0.6 0.78], 'Select a color');
%yellow = uisetcolor([1 0.84 0], 'Select a color');
grey = uisetcolor([0.49 0.49 0.49], 'Select a color');
purple = [.61 .51 .74];

%%

%% Initialise values
N=1000; %number of oscillators
theta0 = 2*pi*rand(N,1); %Uniformly distributed intial phases on the unit circle
omega = randn(N,1); %Normally distributed natural frequencies
K1 = 1; %change K=2
K2 = 2;
tfinal = 100; %time horizon
dt = 0.2; %time step interval

%% r as function of t
%Use 'kuramoto_ode' to compute for K=1, K=2 of coupling constant in model
[t1,r1] = kuramoto_ode(theta0, omega, K1, tfinal, dt);
[t2,r2] = kuramoto_ode(theta0, omega, K2, tfinal, dt);

%% Plot the order parameter
figure
hold on;
plot1=plot(t1, r1,'Color',orange,'LineWidth',1.5);
plot2=plot(t2, r2,'Color',green,'LineWidth',1.5);
xlim([0 100])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$T$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
legend('$K=1$','$K=2$','Interpreter','latex','Location','NorthWest')
saveas(plot1,'r(t).png')

%%

%% Euler method and k \in [0,5]

[Kset1, rInf1] = kuramoto_coupling(theta0, omega, tfinal, dt);

figure
hold on;
plot3=plot(Kset1, rInf1,'-gs','Color',orange,'MarkerSize',3,'MarkerEdgeColor',grey,'MarkerFaceColor',grey,'LineWidth',1.5);
xlim([0 5])
ylim([0 1])
title('Order parameter $r(t)$ for $K \in [0,5]$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(plot3,'rK.png')

%%

%% Initialise values second time
N=2000; %number of oscillators
theta0 = 2*pi*rand(N,1); %Uniformly distributed intial phases on the unit circle
omega = rand(N,1) - 1/2; %Uniformly distributed natural frequencies
%K1 = 1; %change K=2
%K2 = 2;
tfinal = 200; %time horizon
dt = 0.05; %time step interval

%% Generating omega from unifrom distribution

[Kset2, rInf2] = kuramoto_coupling(theta0, omega, tfinal, dt);

figure
hold on;
plot4=plot(Kset2,rInf2,'-gs','Color',orange,'MarkerSize',3,'MarkerEdgeColor',grey,'MarkerFaceColor',grey,'LineWidth',1.5);
xlim([0 1.5])
ylim([0 1])
title('Order parameter $r(t)$ for $K \in [0,1.5]$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(plot4,'rKuniformly.png')

%% For fixed realisations of the intial conditions omega and K=1
%Fit omega 10 times from uniform distribution
%Fix theta0

% Re-use omega from previous section and generate 9 new-ones
omega1 = omega;
%omega1 = rand(N,1) - 1/2;
omega2 = rand(N,1) - 1/2;
omega3 = rand(N,1) - 1/2;
omega4 = rand(N,1) - 1/2;
omega5 = rand(N,1) - 1/2;
omega6 = rand(N,1) - 1/2;
omega7 = rand(N,1) - 1/2;
omega8 = rand(N,1) - 1/2;
omega9 = rand(N,1) - 1/2;
omega10 = rand(N,1) - 1/2;


thetaFix = theta0;

% We can equte the Uniform s.d. to equal Normal s.d.
%width = sqrt(3) * 0.87;tfinal = 200;

[t01,r01] = kuramoto_ode(thetaFix, omega1, K1, tfinal, dt);
[t02,r02] = kuramoto_ode(thetaFix, omega2, K1, tfinal, dt);
[t03,r03] = kuramoto_ode(thetaFix, omega3, K1, tfinal, dt);
[t04,r04] = kuramoto_ode(thetaFix, omega4, K1, tfinal, dt);
[t05,r05] = kuramoto_ode(thetaFix, omega5, K1, tfinal, dt);
[t06,r06] = kuramoto_ode(thetaFix, omega6, K1, tfinal, dt);
[t07,r07] = kuramoto_ode(thetaFix, omega7, K1, tfinal, dt);
[t08,r08] = kuramoto_ode(thetaFix, omega8, K1, tfinal, dt);
[t09,r09] = kuramoto_ode(thetaFix, omega9, K1, tfinal, dt);
[t10,r10] = kuramoto_ode(thetaFix, omega10, K1, tfinal, dt);

figure
hold on;
Fixplot1=plot(t01, r01,'Color',orange,'LineWidth',1);
Fixplot2=plot(t02, r02,'Color',blue,'LineWidth',1);
Fixplot3=plot(t03, r03,'Color',green,'LineWidth',1);
Fixplot4=plot(t04, r04,'Color',pink,'LineWidth',1);
Fixplot5=plot(t05, r05,'Color',purple,'LineWidth',1);
Fixplot6=plot(t06, r06,'--','Color',orange,'LineWidth',1);
Fixplot7=plot(t07, r07,'--','Color',blue,'LineWidth',1);
Fixplot8=plot(t08, r08,'--','Color',green,'LineWidth',1);
Fixplot9=plot(t09, r09,'--','Color',pink,'LineWidth',1);
Fixplot10=plot(t10, r10,'--','Color',purple,'LineWidth',1);
xlim([0 200])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
%legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(Fixplot1,'r(t)Fixedtheta1.png')

figure
hold on;
Fixplot1=plot(t01, r01,'Color',orange,'LineWidth',1);
Fixplot2=plot(t02, r02,'Color',blue,'LineWidth',1);
Fixplot3=plot(t03, r03,'Color',green,'LineWidth',1);
Fixplot4=plot(t04, r04,'Color',pink,'LineWidth',1);
Fixplot5=plot(t05, r05,'Color',purple,'LineWidth',1);
Fixplot6=plot(t06, r06,'--','Color',orange,'LineWidth',1);
Fixplot7=plot(t07, r07,'--','Color',blue,'LineWidth',1);
Fixplot8=plot(t08, r08,'--','Color',green,'LineWidth',1);
Fixplot9=plot(t09, r09,'--','Color',pink,'LineWidth',1);
Fixplot10=plot(t10, r10,'--','Color',purple,'LineWidth',1);
xlim([0 30])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
%legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(Fixplot1,'r(t)Fixedtheta2.png')


%% Comparing the uniform dist. to the normal dist.
%% By equalling their s.d. using their 'width'

%% For fixed realisations of the intial conditions omega and K=1
%Fit omega 10 times from uniform distribution
%Fix theta0

% Re-use omega and fixed theta from earlier section

% We can equate the Uniform s.d. to equal Normal s.d.
width1 = sqrt(3) * 0.85;

[t01,r01] = kuramoto_ode(thetaFix, width1*omega1, K1, tfinal, dt);
[t02,r02] = kuramoto_ode(thetaFix, width1*omega2, K1, tfinal, dt);
[t03,r03] = kuramoto_ode(thetaFix, width1*omega3, K1, tfinal, dt);
[t04,r04] = kuramoto_ode(thetaFix, width1*omega4, K1, tfinal, dt);
[t05,r05] = kuramoto_ode(thetaFix, width1*omega5, K1, tfinal, dt);
[t06,r06] = kuramoto_ode(thetaFix, width1*omega6, K1, tfinal, dt);
[t07,r07] = kuramoto_ode(thetaFix, width1*omega7, K1, tfinal, dt);
[t08,r08] = kuramoto_ode(thetaFix, width1*omega8, K1, tfinal, dt);
[t09,r09] = kuramoto_ode(thetaFix, width1*omega9, K1, tfinal, dt);
[t10,r10] = kuramoto_ode(thetaFix, width1*omega10, K1, tfinal, dt);

figure
hold on;
Fixplot1=plot(t01, r01,'Color',orange,'LineWidth',1);
Fixplot2=plot(t02, r02,'Color',blue,'LineWidth',1);
Fixplot3=plot(t03, r03,'Color',green,'LineWidth',1);
Fixplot4=plot(t04, r04,'Color',pink,'LineWidth',1);
Fixplot5=plot(t05, r05,'Color',purple,'LineWidth',1);
Fixplot6=plot(t06, r06,'--','Color',orange,'LineWidth',1);
Fixplot7=plot(t07, r07,'--','Color',blue,'LineWidth',1);
Fixplot8=plot(t08, r08,'--','Color',green,'LineWidth',1);
Fixplot9=plot(t09, r09,'--','Color',pink,'LineWidth',1);
Fixplot10=plot(t10, r10,'--','Color',purple,'LineWidth',1);
xlim([0 200])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
%legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(Fixplot1,'r(t)Fixedtheta1normal.png')

%% Amend width

% Re-use omega and fixed theta from earlier section

% We can equate the Uniform s.d. to equal Normal s.d.
width2 = sqrt(3) * 0.90;

[t01,r01] = kuramoto_ode(thetaFix, width2*omega1, K1, tfinal, dt);
[t02,r02] = kuramoto_ode(thetaFix, width2*omega2, K1, tfinal, dt);
[t03,r03] = kuramoto_ode(thetaFix, width2*omega3, K1, tfinal, dt);
[t04,r04] = kuramoto_ode(thetaFix, width2*omega4, K1, tfinal, dt);
[t05,r05] = kuramoto_ode(thetaFix, width2*omega5, K1, tfinal, dt);
[t06,r06] = kuramoto_ode(thetaFix, width2*omega6, K1, tfinal, dt);
[t07,r07] = kuramoto_ode(thetaFix, width2*omega7, K1, tfinal, dt);
[t08,r08] = kuramoto_ode(thetaFix, width2*omega8, K1, tfinal, dt);
[t09,r09] = kuramoto_ode(thetaFix, width2*omega9, K1, tfinal, dt);
[t10,r10] = kuramoto_ode(thetaFix, width2*omega10, K1, tfinal, dt);

figure
hold on;
Fixplot1=plot(t01, r01,'Color',orange,'LineWidth',1);
Fixplot2=plot(t02, r02,'Color',blue,'LineWidth',1);
Fixplot3=plot(t03, r03,'Color',green,'LineWidth',1);
Fixplot4=plot(t04, r04,'Color',pink,'LineWidth',1);
Fixplot5=plot(t05, r05,'Color',purple,'LineWidth',1);
Fixplot6=plot(t06, r06,'--','Color',orange,'LineWidth',1);
Fixplot7=plot(t07, r07,'--','Color',blue,'LineWidth',1);
Fixplot8=plot(t08, r08,'--','Color',green,'LineWidth',1);
Fixplot9=plot(t09, r09,'--','Color',pink,'LineWidth',1);
Fixplot10=plot(t10, r10,'--','Color',purple,'LineWidth',1);
xlim([0 200])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
%legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(Fixplot1,'r(t)Fixedtheta2normal.png')

%% Amend time step

tfinal = 500;

% Re-use omega and fixed theta from earlier section

% We can equate the Uniform s.d. to equal Normal s.d.
width3 = sqrt(3) * 0.90;

[t01,r01] = kuramoto_ode(thetaFix, width3*omega1, K1, tfinal, dt);
[t02,r02] = kuramoto_ode(thetaFix, width3*omega2, K1, tfinal, dt);
[t03,r03] = kuramoto_ode(thetaFix, width3*omega3, K1, tfinal, dt);
[t04,r04] = kuramoto_ode(thetaFix, width3*omega4, K1, tfinal, dt);
[t05,r05] = kuramoto_ode(thetaFix, width3*omega5, K1, tfinal, dt);
[t06,r06] = kuramoto_ode(thetaFix, width3*omega6, K1, tfinal, dt);
[t07,r07] = kuramoto_ode(thetaFix, width3*omega7, K1, tfinal, dt);
[t08,r08] = kuramoto_ode(thetaFix, width3*omega8, K1, tfinal, dt);
[t09,r09] = kuramoto_ode(thetaFix, width3*omega9, K1, tfinal, dt);
[t10,r10] = kuramoto_ode(thetaFix, width3*omega10, K1, tfinal, dt);

figure
hold on;
Fixplot1=plot(t01, r01,'Color',orange,'LineWidth',1);
Fixplot2=plot(t02, r02,'Color',blue,'LineWidth',1);
Fixplot3=plot(t03, r03,'Color',green,'LineWidth',1);
Fixplot4=plot(t04, r04,'Color',pink,'LineWidth',1);
Fixplot5=plot(t05, r05,'Color',purple,'LineWidth',1);
Fixplot6=plot(t06, r06,'--','Color',orange,'LineWidth',1);
Fixplot7=plot(t07, r07,'--','Color',blue,'LineWidth',1);
Fixplot8=plot(t08, r08,'--','Color',green,'LineWidth',1);
Fixplot9=plot(t09, r09,'--','Color',pink,'LineWidth',1);
Fixplot10=plot(t10, r10,'--','Color',purple,'LineWidth',1);
xlim([0 500])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
%legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(Fixplot1,'r(t)Fixedtheta3normal.png')
%% Amend time step

tfinal = 1000;

% Re-use omega and fixed theta from earlier section

% We can equate the Uniform s.d. to equal Normal s.d.
width4 = sqrt(3) * 0.95;

[t01,r01] = kuramoto_ode(thetaFix, width4*omega1, K1, tfinal, dt);
[t02,r02] = kuramoto_ode(thetaFix, width4*omega2, K1, tfinal, dt);
[t03,r03] = kuramoto_ode(thetaFix, width4*omega3, K1, tfinal, dt);
[t04,r04] = kuramoto_ode(thetaFix, width4*omega4, K1, tfinal, dt);
[t05,r05] = kuramoto_ode(thetaFix, width4*omega5, K1, tfinal, dt);
[t06,r06] = kuramoto_ode(thetaFix, width4*omega6, K1, tfinal, dt);
[t07,r07] = kuramoto_ode(thetaFix, width4*omega7, K1, tfinal, dt);
[t08,r08] = kuramoto_ode(thetaFix, width4*omega8, K1, tfinal, dt);
[t09,r09] = kuramoto_ode(thetaFix, width4*omega9, K1, tfinal, dt);
[t10,r10] = kuramoto_ode(thetaFix, width4*omega10, K1, tfinal, dt);

figure
hold on;
Fixplot1=plot(t01, r01,'Color',orange,'LineWidth',1);
Fixplot2=plot(t02, r02,'Color',blue,'LineWidth',1);
Fixplot3=plot(t03, r03,'Color',green,'LineWidth',1);
Fixplot4=plot(t04, r04,'Color',pink,'LineWidth',1);
Fixplot5=plot(t05, r05,'Color',purple,'LineWidth',1);
Fixplot6=plot(t06, r06,'--','Color',orange,'LineWidth',1);
Fixplot7=plot(t07, r07,'--','Color',blue,'LineWidth',1);
Fixplot8=plot(t08, r08,'--','Color',green,'LineWidth',1);
Fixplot9=plot(t09, r09,'--','Color',pink,'LineWidth',1);
Fixplot10=plot(t10, r10,'--','Color',purple,'LineWidth',1);
xlim([0 1000])
ylim([0 1])
title('Order parameter $r(t)$ in function of $t$','Interpreter','latex')
xlabel('$K$','Interpreter','latex')
ylabel('$r$','Interpreter','latex')
%legend('$r_{\infty}$','Interpreter','latex','Location','NorthWest')
saveas(Fixplot1,'r(t)Fixedtheta4normal.png')

%% For fixed realisations of the initial conditions theta and K=1

%% Sample 10 initial conditions and plot

thetaRandom = datasample(theta0,10); %sample 10 constant theta0
omega1 = rand(N,1) - 1/2; %10 different realistaion of omega
omega2 = rand(N,1) - 1/2;
omega3 = rand(N,1) - 1/2; 
omega4 = rand(N,1) - 1/2; 
omega5 = rand(N,1) - 1/2; 
omega6 = rand(N,1) - 1/2; 
omega7 = rand(N,1) - 1/2; 
omega8 = rand(N,1) - 1/2;
omega9 = rand(N,1) - 1/2; 
omega10 = rand(N,1) - 1/2; 

[t10,r10] = kuramoto_ode(thetaRandom(1), omega1, K1, tfinal, dt); %1
[t11,r11] = kuramoto_ode(thetaRandom(2), omega2, K1, tfinal, dt); %2
[t12,r12] = kuramoto_ode(thetaRandom(3), omega3, K1, tfinal, dt); %3
%[t13,r13] = kuramoto_ode(thetaRandom(4), omega4, K1, tfinal, dt); %4
%[t14,r14] = kuramoto_ode(thetaRandom(5), omega5, K1, tfinal, dt); %5
%[t15,r15] = kuramoto_ode(thetaRandom(6), omega6, K1, tfinal, dt); %6
%[t16,r16] = kuramoto_ode(thetaRandom(7), omega7, K1, tfinal, dt); %7
%[t17,r17] = kuramoto_ode(thetaRandom(8), omega8, K1, tfinal, dt); %8
%[t18,r18] = kuramoto_ode(thetaRandom(9), omega9, K1, tfinal, dt); %9
%[t19,r19] = kuramoto_ode(thetaRandom(10), omega10, K1, tfinal, dt); %10
    
figure
hold on;
plot10=plot(t10, r10,'Color',orange,'LineWidth',1.5);
plot11=plot(t11, r11,'Color',purple,'LineWidth',1.5);
plot12=plot(t12, r12,'Color',blue,'LineWidth',1.5);
%plot13=plot(t13, r13,'Color',pink,'LineWidth',1.5);
%plot14=plot(t14, r14,'Color',green,'LineWidth',1.5);
%plot15=plot(t15, r15,'--','Color',orange,'LineWidth',1.5);
%plot16=plot(t16, r16,'--','Color',purple,'LineWidth',1.5);
%plot17=plot(t17, r17,'--','Color',blue,'LineWidth',1.5);
%plot18=plot(t18, r18,'--','Color',pink,'LineWidth',1.5);
%plot19=plot(t19, r19,'--','Color',green,'LineWidth',1.5);
xlim([0 100])