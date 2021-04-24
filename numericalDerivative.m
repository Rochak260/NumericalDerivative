clc
clear
xmax = 10;
nx = 200;
dx = xmax/(nx-1);


x = linspace(0,xmax,nx);
l = 40*dx;
k = 2*pi/l;

y = sin(k*x);
% subplot(4,1,1)
% plot(x,y)

nder = zeros(nx,1);  %this will store numerical derivative values
ader = zeros(nx,1);  %this will store analytical derivative values

for i = 2:(nx-1)
    nder(i) = (y(i+1)-y(i-1))/(2*dx);
end

ader = k*cos(k*x);
ader = ader';

 
%exclude boundary
nder(1) = 0;
ader(1) = 0;
ader(nx) = 0;

format long

%Error

rms = sqrt(mean((nder-ader).^2))

plot(x,nder,'b+',x,ader,'black-',x,nder-ader,"g:",'LineWidth',2)
title("First derivative, Err (rms) = "  + rms + "." )

xlabel('x , m')
ylabel('Amplitude')
legend({"Numerical Derivative, 2 points"',"Analytical Derivative","Difference"},'location','southwest')
