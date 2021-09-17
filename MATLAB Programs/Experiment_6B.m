clc;
close all;
clear all;
rp=input('enter the passband ripple');
rs=input('enter the stopband ripple');
wp=input('enter the passband freq');
ws=input('enter the stopband freq');
fs=input('enter the sampling freq');
w1=2*wp/fs;
w2=2*ws/fs;

[n,wn]=cheb1ord(w1,w2,rp,rs);
[b,a]=cheby1(n,rp,wn);
w=0:0.01:pi;
[h,om]=freqz(b,a,w);
m=20*log10(abs(h));
an=angle(h);

[nh,wnh]=cheb1ord(w1,w2,rp,rs);
[bh,ah]=cheby1(nh,rp,wnh,'high');
wh=0:0.01/pi:pi;
[hh,omh]=freqz(bh,ah,wh);
mh=20*log10(abs(hh));
anh=angle(hh);

[np]=cheb1ord(w1,w2,rp,rs);
wnp=[w1,w2];
[bp,ap]=cheby1(np,rp,[w1, w2]);
wp=0:0.01:pi;
[hp,omp]=freqz(bp,ap,wp);
mp=20*log10(abs(hp));
anp=angle(hp);

[ns]=cheb1ord(w1,w2,rp,rs);
wns=[w1,w2];
[bs,as]=cheby1(ns,rp,[w1,w2],'stop');
ws=0:0.01:pi;
[hs,oms]=freqz(bs,as,ws);
ms=20*log10(abs(hs));
ans=angle(hs);

subplot(4,2,1);
plot(om/pi,m);
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');
title("Low pass Amplitude Response")
subplot(4,2,2);
plot(om/pi,an);
ylabel('phase in Radians \rightarrow');
xlabel('(b) Normalised Frequency \rightarrow');
title("Low pass Phase Response")

subplot(4,2,3);
plot(omh/pi,mh);
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');
title("High pass Amplitude Response")
subplot(4,2,4);
plot(omh/pi,anh);
ylabel('phase in Radians \rightarrow');
xlabel('(b) Normalised Frequency \rightarrow');
title("High pass Phase Response")

subplot(4,2,5);
plot(omp/pi,mp);
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');
title("Band pass Amplitude Response")
subplot(4,2,6);
plot(omp/pi,anp);
ylabel('phase in Radians \rightarrow');
xlabel('(b) Normalised Frequency \rightarrow');
title("Band pass Phase Response")

subplot(4,2,7);
plot(oms/pi,ms);
ylabel('Gain in Db \rightarrow');
xlabel('(a) Normalised Frequency \rightarrow');
title("Band stop Amplitude Response")
subplot(4,2,8);
plot(oms/pi,ans);
ylabel('phase in Radians \rightarrow');
xlabel('(b) Normalised Frequency \rightarrow');
title("Band stop Phase Response")