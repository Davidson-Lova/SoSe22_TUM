% C'est ici qu'on va faire les trucs

%Données
data.r = 0.1;
data.r1 = 0.05;
data.r2 = 0.05;
data.gamma1 = 1;
data.theta0 = 1;
data.g = 10;
data.m1 = 1;
data.m2 = 1;
data.mu0 = 1;
data.mu1 k= 1;
data.mu2 = 1;

odefun = @(t,y)(G_vec(y,data));

theta1_0 = -pi/4;
theta2_0 = pi/4;
tau1_0 = 0;
tau2_0 = 0;

t0 = 0;
tf = 0.1;

y0 =[theta1_0,theta2_0,tau1_0,tau2_0];

tspan = [t0 tf];
N = 100;
 
%[t1,y1] = ode45(odefun,tspan,y0);
%[t2,y2] = redTGA(odefun,t0,tf,y0,N);
[t3,y3] = redRK4(odefun,t0,tf,y0,N);
[t4,y4] = redPC4(odefun,t0,tf,y0,N);
%[t5,y5] = redEUP(odefun,t0,tf,y0,N);
[t6,y6] = redAB3(odefun,t0,tf,y0,N);

figure(1);clf; hold on;
%plot(t1,y1(:,1));
plot(t6',(y6')(:,1));
plot(t3',(y3')(:,1));
%plot(t5',(y5')(:,1));
plot(t4',(y4')(:,1));

%legend('ode45','AB3','RK4','PC4');
xlabel('t');
ylabel('theta1');
hold off;

##figure(2);clf; hold on;
##plot(t1,y1(:,2));
##plot(t6',(y6')(:,2));
##plot(t3',(y3')(:,2));
##%plot(t5',(y5')(:,2));
##plot(t4',(y4')(:,2));
##
##legend('ode45','AB3','RK4','PC4');
##xlabel('t');
##ylabel('theta2');
##hold off;
##
##figure(3);clf; hold on;
##plot(t1,y1(:,1)-y1(:,2));
##plot(t6',(y6')(:,1)-(y6')(:,2));
##plot(t3',(y3')(:,1)-(y3')(:,2));
##%plot(t5',(y5')(:,1)-(y5')(:,2));
##plot(t4',(y4')(:,1)-(y4')(:,2));
##
##legend('ode45','AB3','RK4','PC4');
##xlabel('t');
##ylabel('theta1 - theta2');
##hold off;





##
##figure(1); clf; hold on;
##loglog(hx,0.1*hx.^2,'k-o');
##loglog(hx,hx,'k-d');
##loglog(hx,err_abs,'r');
##legend('O(hx^2)','O(hx)','Erreur(hx)');
##xlabel('hx');
##ylabel('Erreur');
##grid on;
##hold off;