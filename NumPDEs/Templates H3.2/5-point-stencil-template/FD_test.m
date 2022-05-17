%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implementation of the five-point-stencil for 
% the Poisson problem with homogeneous Dirichlet boundary 
% conditions on the unit square (0,1)^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear
clear all

% define mesh width
h = 1/50; 

% number of non-boundary nodes in each row
n = 1/h - 1;

%  calculate coordinates of non-boundary nodes in x and y direction 
xcoor = h*[1:n]';
ycoor = h*[1:n]';

%  calculate coordinates at all nodes using the ordering from the lecture
xpts = [];
ypts = [];
for j = 1:n
    xpts = [xpts; xcoor];
    ypts = [ypts; ycoor(j)*ones(n,1)];
end

% calculate right-hand side vector of FD-system
rhs =  ... % TODO

% assemble system matrix using the sparse format
row_list = [];
col_list =  [];
value_list = [];

% NOTE:
% The sparse format works as follows:
% row_list = list of row-indices of non-zero entries in matrix
% col_list = list of column-indices of non-zero entries in matrix
% value_list = list of values in the non-zero entries in the matrix
% The command "sparse(row_list,col_list,value_list,N, N)" then 
% assembles a square matrix in sparse format of dimension N x N
% containing the value value_list(i) in the entry 
% (row_list(i),col_list(i)) for all i and zeros everywhere else.
%
% Example: 
% A = sparse([1 2], [3 4], [5 6], 10, 10) 
% assembles a 10x10 matrix A = (A_ij) in sparse format
% that has A_13 = 5, A_24 = 6, and Aij = 0 else

% fill row_list, col_list, and value_list

... % TODO

% assemble system matrix
A = ... % TODO

% solve linear FD-system for u
u = ... % TODO

% plot the calculated solution
figure(1)
plot_solution(n,h,u);

% plot the reference solution for f(x,y) = 2*pi^2 * sin(pi*x).*sin(pi*y);
figure(2)
uref = u_ref(xpts,ypts);
plot_solution(n,h,uref);
zlim([0, 1.2])

