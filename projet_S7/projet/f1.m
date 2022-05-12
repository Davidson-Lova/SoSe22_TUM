function [output_me] = f1(theta1,data)
  output_me = ((u_theta1(theta1)')*((-1)*((data.gamma1)*(data.r1)*u_theta1(theta1))))/(data.m1*data.r1);
endfunction