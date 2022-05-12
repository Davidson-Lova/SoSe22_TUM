function [output_me] = u_theta2(theta2)
  output_me = (-1)*cos(theta2)*[0;1] + sin(theta2)*[1;0];
endfunction