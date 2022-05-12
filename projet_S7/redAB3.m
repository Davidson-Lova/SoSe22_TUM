function  [t,Y]=redAB3(f,a,b,y0,N)
  t=zeros(1,N+1);
  Y=zeros(length(y0),N+1);
  h=(b-a)/N;
  t=a:h:b;
  Y(:,1)=y0;
  %calcul de y_2
    k1 = f(t(1),Y(:,1));
    k2 = f(t(1)+h/2,Y(:,1)+(h/2)*k1);
    k3 = f(t(1)+h/2,Y(:,1)+(h/2)*k2);
    k4 = f(t(1)+h,Y(:,1)+h*k3);
    Y(:,2)=Y(:,1)+(h/6)*(k1+2*k2+2*k3+k4);
  ##  Y(:,2)=Y(:,1)+h*f(t(1)+h/2,Y(:,1)+(h/2)*f(t(1),Y(:,1)));
  %%%%%%%%
  %calcul de y_3
    k1 = f(t(2),Y(:,2));
    k2 = f(t(2)+h/2,Y(:,2)+(h/2)*k1);
    k3 = f(t(2)+h/2,Y(:,2)+(h/2)*k2);
    k4 = f(t(2)+h,Y(:,2)+h*k3);
    Y(:,3)=Y(:,2)+(h/6)*(k1+2*k2+2*k3+k4);
    
  for n=3:N
    Y(:,n+1)=Y(:,n)+(h/12)*(23*f(t(n),Y(:,n))-16*f(t(n-1),Y(:,n-1))+5*f(t(n-2),Y(:,n-2)));
  endfor
endfunction