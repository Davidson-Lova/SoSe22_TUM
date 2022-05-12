function output_me = A1A2(theta1,theta2,data)
  output_me = -data.r1*u_r1(theta1)+data.r*[1;0]+data.r2*u_r2(theta2);
endfunction