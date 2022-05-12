function output_me = F12(theta1,theta2,data)
  vecteur=A1A2(theta1,theta2,data);
  distance=dot(vecteur,vecteur)*dot(vecteur,vecteur);
  coefficient=data.mu0*data.mu1*data.mu2/(4*pi*distance);
  output_me = coefficient*A1A2;
endfunction