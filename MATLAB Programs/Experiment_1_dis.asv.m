clc;
clear all;
close all;
t1 = -10: 0.1: 10;
us = [zeros(1,100),ones(1,101)];
subplot(2,5,1);
plot(t1,us);
title('Unit Step');

subplot(2,5,2);
stem(t1,us);
title('Discrete Unit Step');

t = -1: 0.1: 10;

sin_t = sin(2*pi*0.1*t);
subplot(2,5,3);
plot(t,sin_t);
title('Sine');

subplot(2,5,4);
stem(t,sin_t);
title('Discrete Sine');

r = t1.*us;
subplot(2,5,5);
plot(t1,r);
title('Ramp');

subplot(2,5,6);
stem(t1,r);
title(' Discrete Ramp');

subplot(2,5,7);
plot(t,exp(t));
title('Exponential');

subplot(2,5,8);
stem(t,exp(t));
title('Discrete Exponential');

ui = [zeros(1,100),ones(1,1),zeros(1,100)];
subplot(2,5,9);
plot(t1,ui);
title('Unit Impulse');

subplot(2,5,10);
stem(t1,ui);
title('Discrete Unit Impulse');