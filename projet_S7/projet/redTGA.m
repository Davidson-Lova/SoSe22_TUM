function [t,Y]=redTGA(f,a,b,y0,N)
  t=zeros(1,N+1);
  Y=zeros(length(y0),N+1);
  h=(b-a)/N;
  t=a:h:b;
  Y(:,1)=y0;
  for n=1:N
    Y(:,n+1)=Y(:,n)+h*f(t(n)+h/2,Y(:,n)+(h/2)*f(t(n),Y(:,n)));
  endfor
endfunction