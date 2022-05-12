function output_me = calcul_F1(theta1,theta2,data)
  uy=[1;0];
  output_me=-data.m1*data.g*dot(uy,u_theta1(theta1))-dot(F12(theta1,theta2,data),u_theta1(theta1));
end