function [output_me] = f2(theta2,data)
  output_me = ((u_theta2(theta2)')*((-1)*((data.gamma1)*(data.r2)*u_theta2(theta2))))/(data.m1*data.r1);
endfunction