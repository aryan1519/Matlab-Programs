% % Write a matlab program to find 8 point DFT,its magnitude and phase.
% % Also find its inverse DFT
% 
% n = 0:7; % time variable
% x1n = [0 1 1 1 1 1 0 0]; % our 8-point signal
% X1k = fft(x1n); % compute the DFT
% X1kmag = abs(X1k); % magnitude of the DFT
% X1karg = angle(X1k); % phase of the DFT
% % plot the signal
% figure(1);
% stem(n,x1n);
% axis([0 7 0 1.5]);
% title("Original Signal");
% xlabel("n");
% ylabel("x_1[n]");
% % plot DFT magnitude and phase as functions of k
% k = 0:7; % frequency index
% figure(2);
% stem(k,X1kmag); ylim([0 6]);
% 
% title("DFT Magnitude");
% xlabel("k");
% ylabel("|X_1[k]|");
% figure(3);
% stem(k,X1karg);
% title("DFT Phase");
% xlabel("k");
% ylabel("arg(X_1[k])");
% % plot DFT magnitude as a function of Matlab index
% Matlab_idx = [1:8]; % Matlab index
% figure(4);
% stem(Matlab_idx,X1kmag); ylim([0 6]);
% title("DFT Magnitude");
% xlabel("Matlab index");
% ylabel("|X_1[index]|");
% % plot DFT magnitude as a function of discrete frequency
% % (radians per sample)
% w = [0:2*pi/8:7*2*pi/8]; % discrete frequency
% figure(5);
% stem(w,X1kmag); ylim([0 6]);
% title("DFT Magnitude"); ylim([0 6]);
% xlabel("discrete radian frequency \omega");
% ylabel("|X_1[\omega]|");
% % Compute and plot the IDFT
% x2n = ifft(X1k);
% figure(6);
% stem(n,x2n);
% axis([0 7 0 1.5]);
% title("IDFT");
% xlabel("n");
% ylabel("IDFT");



x = [1 5 7 8 3 2 1];
out = zeros(length(x));
out1 = zeros(length(x));
n = length(x);
for i=1:n
    for k=1:n
        out(i) = out(i) + x(k).*exp(-1j.*2.*pi.*(k-1).*(i-1)./n);
    end
end
y = fft(x);
for i=1:n
    for k=1:n
        out1(i) = out1(i) + out(k).*exp(1j.*2.*pi.*(k-1).*(i-1)./n)/n;
    end
end
magnitude = abs(y);
phase = angle(y);
subplot(2,3,1)
stem(x)
title("Signal")
subplot(2,3,2)
stem(y)
title("FFT")
subplot(2,3,3)
stem(out)
title("FFT loop")
subplot(2,3,4)
stem(out1)
title("IFFT loop")
subplot(2,3,5)
stem(magnitude)
title("Magnitude")
subplot(2,3,6)
stem(phase)
title("Phase")