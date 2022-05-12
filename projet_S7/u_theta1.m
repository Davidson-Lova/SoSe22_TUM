function [output_me] = u_theta1(theta1)
  output_me = (-1)*cos(theta1)*[0;1] + sin(theta1)*[1;0];
endfunction