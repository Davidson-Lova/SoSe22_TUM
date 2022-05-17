% -------------------------------------------------
% -------------- Reference Solution ---------------
% -------------------------------------------------
%
% -------------------------------------------------
%  
%  INPUT:  Coordinates x, y
%  OUTPUT: Value of reference solution for f = 2*pi^2 * sin(pi*x).*sin(pi*y)
%
% -------------------------------------------------

function uref = u_ref(x, y)
     
    uref = sin(pi*x) .* sin(pi*y);
    
end