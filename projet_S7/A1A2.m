function output_me = A1A2(tetha1,tetha2,data)
  output_me = -data.r1*u_r1(tetha1)+data.r*[1;0]+data.r2*u_r2(tetha2);
endfunction