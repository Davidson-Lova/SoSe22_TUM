clear all;

l = 5;
for k = 1:l

% define mesh width
h(k) = (1/5)*(2^(-k));

% number of non-boundary nodes in each row
n = 1/h(k) - 1;

%  calculate coordinates of non-boundary nodes in x and y direction 
xcoor = h(k)*[1:n]';
ycoor = h(k)*[1:n]';

%  calculate coordinates at all nodes using the ordering from the lecture
xpts = [];
ypts = [];
for j = 1:n
    xpts = [xpts; xcoor];
    ypts = [ypts; ycoor(j)*ones(n,1)];
end

% calculate right-hand side vector of FD-system
rhs =  f(xpts,ypts); % TODO

% assemble system matrix using the sparse format
N = n*n;
row_list = [];
col_list =  [];
value_list = [];

row_list = [row_list 1:N];
col_list = [col_list 1:N];
value_list = 4*ones(1,N);

%for points on left and right
for i = 1:n
  row_list = [row_list (i-1)*n+(1:(n-1))];
  col_list = [col_list (i-1)*n+(2:n)];
  value_list = [value_list (-1)*ones(1,n-1)];

  row_list = [row_list (i-1)*n+(2:n)];
  col_list = [col_list (i-1)*n+(1:(n-1))];
  value_list = [value_list (-1)*ones(1,n-1)];
endfor

%for point on top and bottom
row_list = [row_list n+1:N];
col_list = [col_list 1:N-n];
value_list = [value_list (-1)*ones(1,N-n)];

row_list = [row_list 1:N-n];
col_list = [col_list n+1:N];
value_list = [value_list (-1)*ones(1,N-n)];

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

A = (1/(h(k)^2))*sparse(row_list, col_list, value_list, N,N);

% solve linear FD-system for u
u = A\rhs; % TODO
uref = u_ref(xpts,ypts);

err_abs(k) = max(abs((u-uref)(:)));
endfor

figure(1); clf; hold on;
loglog(h,0.1*h.^2,'k-o');
loglog(h,h,'k-d');
loglog(h,err_abs,'r');
legend('O(h^2)','O(h)','Erreur(h)');
xlabel('h');
ylabel('Erreur');
grid on;
hold off;


alpha = (log(err_abs(end))-log(err_abs(end-1)))/(log(h(end))-log(h(end-1)));