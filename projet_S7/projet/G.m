function [output_me] = G(theta1,theta2,tau1,tau2,data)
  output_me = zeros(4,1);
  output_me(1) = tau1;
  output_me(2) = tau2;
  output_me(3) = f1(theta1,data)*tau1 + calcul_F1(theta1,theta2,data);
  output_me(4) = f2(theta2,data)*tau1 + calcul_F2(theta1,theta2,data);
endfunction