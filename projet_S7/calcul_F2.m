function output_me = calcul_F2(theta1,theta2,data)
  uy=[1;0];
  output_me=-data.m2*data.g*dot(uy,u_theta2(theta2))+dot(F12(theta1,theta2,data),u_theta2(theta2));
end