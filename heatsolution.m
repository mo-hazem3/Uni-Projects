function [ U ] = heatsolution(f, M, N, c, L, T ) 

dt= T/(N-1);
dx= L/(M-1);
C=(c*dt)/((dx)^2);
x=0:dx:L;
t=0:dt:T;
u=zeros(N,M);
 u(:,1)= 0;
 u(:,M)= 0;
 
 for j=1:M-1
 u(N,j)=f(x(j)); 
 end
 
 for i=N-2:-1:0
 for j=2:1:M-1
     
  u(i+1,j)= u(i+2,j-1)*C+(1-2*C)*u(i+2,j)+C*u(i+2,j+1);

 
     end
 end
 %rotating the Matrix by 270 degrees
 %by trial and error we found an error and solved it by rotating the matrix 
 U2=rot90(u); U1=rot90(U2); U=rot90(U1);
 
%3D-plot 

 figure;
 colormap ("jet");
 surf (U, 'EdgeColor','none');
 xlabel ('x');
 ylabel ('t');
 zlabel ('U (x, t)');
 
 %2D-Plot 
 
 figure;
 plot (U (:, 1), 'blue'); %t=0
 hold on;
 plot (U(:, round (0.1 / dt + 1)), 'red');%t=0.1
 hold on;
 plot (U (:, N-1), 'cyan'); %t=T
 hold off;
 xlabel ('x');
 ylabel ('t'); 
end
