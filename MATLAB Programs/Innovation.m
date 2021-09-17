clc;
clear all;
close all;
format long
%input
rp=1.5;
rs=35;
wp=2000;
ws=3000;
fs=20000;
%rp=input('enter the passband ripple '); % 0.5
%rs=input('enter the stopband ripple '); %50
%wp=input('enter the passband freq '); %
% 1200
% ws=input('enter the stopband freq '); %
% 2400
% fs=input('enter the sampling freq '); %
% 10000
w1=2/fs * wp;
w2=2/fs * ws;
%low pass filter
[n, wn] = buttord(w1, w2, rp, rs);
[zb, pb, kb] = butter(n, wn, 's');
[bb, ab] = zp2tf(zb, pb, kb);
[h, om] = freqs(bb,ab,4096);
%[b, a] = butter(n, 2*pi*wn, 's');
%[bz, az] = impinvar(b, a, 5*wn);
%w = 0:0.01:pi;
%[h, om] = freqz(b, a, w);

m = 20*log(abs(h));
an = angle(h);
% LPF AMP RESPONSE
fig1 = figure();
subplot (1, 2, 1);
plot(om/pi, m);
%xlim([-1.2,10.2]);
%ylim([-1.2,11.2]);
xlabel('Normalized Frequency');
ylabel('Gain in dB -->');
title("LPF AMPLITUDE RESPONSE");
grid on;
%
% LPF PHASE RESPONSE
subplot (1, 2, 2);
plot(om/pi, an);
%xlim([-1.2,10.2]);
%ylim([-1.2,11.2]);
xlabel('Normalized Frequency');
ylabel('Phase in frequency -->');
title("LPF PHASE RESPONSE");
grid on;
fig2 = figure();
[bz, az] = bilinear(bb, ab, wn);
freqz(bz,az)
[k, C] = tf2latc(bz, az);
k
C