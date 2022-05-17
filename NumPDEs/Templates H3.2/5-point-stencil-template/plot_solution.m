% -------------------------------------------------
% --------- Visualization of the Solution ---------
% -------------------------------------------------
%
% -------------------------------------------------
%  
%  INPUT: n (from main), h (from main), u (from main)
%
% -------------------------------------------------

function plot_solution(n,h,u)

    %  calculate coordinates in x- and y-direction, including boundary
    xcoor = h*[0:n+1]';
    ycoor = h*[0:n+1]';
    
    % reshape u and add zeros on boundary for nicer plot
    U = zeros(1, n+2);
    for i=0:(n-1)
        U = [U; [0; u(1 + i*n:(i+1)*n); 0]'];
    end
    U = [U;zeros(1, n+2)];
    
    % plot the solution
    surf(xcoor, ycoor, U);
end

