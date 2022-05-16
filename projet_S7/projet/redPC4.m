function [t,Y]=redPC4(f,a,b,y0,N)
  t=zeros(1,N+1);
  Y=zeros(length(y0),N+1);
  h=(b-a)/N;
  t=a:h:b;
  Y(:,1)=y0;
  %prediction
  %calcul de y_2
    k1 = f(t(1),Y(:,1));
    k2 = f(t(1)+h/2,Y(:,1)+(h/2)*k1);
    k3 = f(t(1)+h/2,Y(:,1)+(h/2)*k2);
    k4 = f(t(1)+h,Y(:,1)+h*k3);
    Y(:,2)=Y(:,1)+(h/6)*(k1+2*k2+2*k3+k4);
  ##  Y(:,2)=Y(:,1)+h*f(t(1)+h/2,Y(:,1)+(h/2)*f(t(1),Y(:,1)));
##  %correction
##  Y(:,2)=Y(:,1)+(h/2)*(f(t(2),Y(:,2))+f(t(1),Y(:,1)));
##  %prediction
    k1 = f(t(2),Y(:,2));
    k2 = f(t(2)+h/2,Y(:,2)+(h/2)*k1);
    k3 = f(t(2)+h/2,Y(:,2)+(h/2)*k2);
    k4 = f(t(2)+h,Y(:,2)+h*k3);
    Y(:,3)=Y(:,2)+(h/6)*(k1+2*k2+2*k3+k4);    
##  %correction
##  Y(:,3)=Y(:,2)+(h/12)*(5*f(t(3),Y(:,3))+8*f(t(2),Y(:,2))-f(t(1),Y(:,1)));
##  %prediction
    k1 = f(t(3),Y(:,3));
    k2 = f(t(3)+h/2,Y(:,3)+(h/2)*k1);
    k3 = f(t(3)+h/2,Y(:,3)+(h/2)*k2);
    k4 = f(t(3)+h,Y(:,3)+h*k3);
    Y(:,4)=Y(:,3)+(h/6)*(k1+2*k2+2*k3+k4);    
##  %correction
##  Y(:,4)=Y(:,3)+(h/24)*(9*f(t(4),Y(:,4))+19*f(t(3),Y(:,3))-5*f(t(2),Y(:,2))+f(t(1),Y(:,1)));
  for n=4:N
    %prediction
    Y(:,n+1)=Y(:,n)+(h/24)*(55*f(t(n),Y(:,n))-59*f(t(n-1),Y(:,n-1))+37*f(t(n-2),Y(:,n-2))-9*f(t(n-3),Y(:,n-3)));
    %correction
    Y(:,n+1)=Y(:,n)+(h/24)*(9*f(t(n+1),Y(:,n+1))+19*f(t(n),Y(:,n))-5*f(t(n-1),Y(:,n-1))+f(t(n-2),Y(:,n-2)));
  endfor
endfunction