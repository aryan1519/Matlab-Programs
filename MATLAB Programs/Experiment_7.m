clc;
close all;
clear all;
rp=input('enter the passband ripple ');
rs=input('enter the stopband ripple ');
fp=input('enter the passband freq ');
fs=input('enter the stopband freq ');
f=input('enter the sampling freq ');
wp=2*fp/f;
ws=2*fs/f;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)==0)
    n1=n;
    n=n-1;
end
y_rec=boxcar(n1);
y_bartlett=bartlett(n1);
y_hamming=hamming(n1);
y_hanning=hanning(n1);
b=fir1(n,wp,y_rec);
[h,o]=freqz(b,1,256)
m=20*log10(abs(h));
subplot(2,2,1);
plot(o/pi,m);
title('low pass filter for rectangular window');
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');

b=fir1(n,wp,y_bartlett);
[h,o]=freqz(b,1,256)
m=20*log10(abs(h));
subplot(2,2,2);
plot(o/pi,m);
title('low pass filter for barlett window');
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');

b=fir1(n,wp,y_hamming);
[h,o]=freqz(b,1,256)
m=20*log10(abs(h));
subplot(2,2,3);
plot(o/pi,m);
title('low pass filter for hamming window');
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');

b=fir1(n,wp,y_hanning);
[h,o]=freqz(b,1,256)
m=20*log10(abs(h));
subplot(2,2,4);
plot(o/pi,m);
title('low pass filter for hanning window');
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');
