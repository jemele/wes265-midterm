function midterm_1a(alpha)
% Write the Matlab script that forms and plots the amplitude normalized impulse
% response for 3 SQRT Nyquist harris taper filters containing 20 symbols with
% 4-samples per symbol for values of alpha = 0.2, 0.4 and 0.6. Use harris taper
% filter designed with sqrt_nyq_y2 script.

% On single pages, plot the impulse response, the frequency response, a zoom to
% the passband ripple, and a zoom to the transition BW and stop band level of
% each of three filters. 
bins = 2048
M = 10
sps = 4
bb = (1+alpha)/2
path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1a-alpha-',num2str(alpha))

h = sqrt_nyq_y2(sps,alpha,M,0)
h = h/max(h)

f = figure('Visible','Off')
subplot(4,1,1)
plot(-M:1:M,h(1:sps:length(h)),'ro')
plot(-M:1/4:M,h)
hold off
grid on
axis([-M-1 M+1 -0.3 1.2])
xlabel('Time index (symbols)')
ylabel('Amplitude')
title('Impulse response, SQRT Nyquist Harris Taper')

subplot(4,1,2)
fh = fftshift(20*log10(abs(fft(h/sum(h),bins))));
plot((-0.5:1/bins:0.5-1/bins)*sps,fh)
hold on
plot([bb bb],[-100 5],'r')
plot(-[bb bb],[-100 5],'r')
hold off
grid on
axis([-2 2 -80 10])
xlabel('Frequency')
ylabel('Log Magnitude (dB)')
title('Frequency Response, SQRT Nyquist Harris Taper')

subplot(4,1,3)
plot((-0.5:1/bins:0.5-1/bins)*sps,fh)
hold on
hold off
grid on
axis([-0.5 0.5 -0.1 .1])
xlabel('Frequency')
ylabel('Log Magnitude (dB)')
title('Zoom to passband ripple, Magnitude Response, SQRT Nyquist Harris Taper')

subplot(4,1,4)
plot((-0.5:1/bins:0.5-1/bins)*sps,fh)
hold on
hold off
grid on
axis([0 1.0 -80 10])
xlabel('Frequency')
ylabel('Log Magnitude (dB)')
title('Zoom to stopband ripple, Magnitude Response, SQRT Nyquist Harris Taper')
print(f,'-dpng',strcat(path,'.png'))
end
