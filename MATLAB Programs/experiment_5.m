clc;
clear all;
close all;
xn= [1 2 3 4];
N= length(xn);
m=input('Enter amount of shift');
sum=fft(xn);
k=0:N-1
sum1=sum.*(exp((-j*2*pi*k*m)/N));
xnm=ifft(sum1);
s=0:N-1
xf1=xn(mod(-s,N)+1);

xros=fft(xf1)
subplot(4,1,1);
stem(xn);
grid on;

xlabel('n');
ylabel('x[n]');
title('Input sequence');
subplot(4,1,2);
stem(sum1);
grid on;

xlabel('k');
ylabel('x[k]');
title('FFT');
subplot(4,1,3)
stem(xnm);
grid on;

xlabel('n');
ylabel('x[n-m]')
title('shifted sequence')
subplot(4,1,4)
stem(s,xros)
grid on;

xlabel('k')
ylabel('x[k]')
title('Folded Sequence');