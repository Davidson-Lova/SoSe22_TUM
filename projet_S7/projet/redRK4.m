function [t,Y]=redRK4(f,a,b,y0,N)
  t=zeros(1,N+1);
  Y=zeros(length(y0),N+1);
  h=(b-a)/N;
  t=a:h:b;
  Y(:,1)=y0;
  for n=1:N
    k1 = f(t(n),Y(:,n));
    k2 = f(t(n)+h/2,Y(:,n)+(h/2)*k1);
    k3 = f(t(n)+h/2,Y(:,n)+(h/2)*k2);
    k4 = f(t(n)+h,Y(:,n)+h*k3);
    Y(:,n+1)=Y(:,n)+(h/6)*(k1+2*k2+2*k3+k4);
  endfor
endfunction