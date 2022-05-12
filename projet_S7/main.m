% C'est ici qu'on va faire les trucs
%Données

data.r = 1;
data.r1 = 1;
data.r2 = 1;
data.gamma1 = 1;
data.theta0 = 1;
data.g = 10;
data.m1 = 1;
data.m2 = 1;
data.mu0 = 1;
data.mu1 = 1;
data.mu2 = 1;

odefun = @(t,y)(G_vec(y,data));

theta1_0 = -pi/4;
theta2_0 = pi/4;
tau1_0 = 1;
tau2_0 = 1;

t0 = 0;
tf = 10;

y0 =[theta1_0,theta2_0,tau1_0,tau2_0];

tspan = [t0 tf];
 
[t,y] = ode45(odefun,tspan,y0);