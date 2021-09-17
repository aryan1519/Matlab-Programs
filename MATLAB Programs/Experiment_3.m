clc;
close all;
clear all;
x = [1 3 5 7];
h = [1 6 0 7];
x1 = fft(x);
h1 = fft(h);
y1 = x1.*h1;
y_a = ifft(y1);

circ = cconv(x,h,4);
lin = conv(x,h);

subplot(3,2,1);
stem(x,'r','LineWidth',1);
title('Input Signal 1');
grid on;

subplot(3,2,2);
stem(h,'m','LineWidth',1)
title('Input Signal 2');
grid on;

subplot(3,2,3);
stem(y_a,'b','LineWidth',1);
title('Circular Convolution using FFT');
grid on;
subplot (3,2,4);
stem(circ,'c','LineWidth',1);
title('Circular Convolution using Function');
grid on;
subplot(3,2,5);
stem(lin,'k','LineWidth',1);
title('Linear Convolution using Function');
grid on;