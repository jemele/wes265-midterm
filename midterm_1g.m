function midterm_1g(x)

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1g')

bins = 2048
M = 10
sps = 4

% create a figure for rendering
f = figure('Visible','Off')

% for each alpha
alphas=[0.2 0.4 0.6]
for i = 1:length(alphas)
alpha=alphas(i)
bb = (1+alpha)/2

% generate filter chain
h = sqrt_nyq_y2(sps,alpha,M,0)
h = h/max(h)
h_s = filter(h,1,x)
h_s = h_s/sum(h_s)

y = h_s(1:2048).*conj(h_s(1:2048))
w = kaiser(length(y),10)
y_f = fftshift(20*log10(abs(fft(y.*w,bins))))

% plot
subplot(length(alphas),1,i)
plot((-0.5:1/bins:0.5-1/bins)*sps,y_f)
grid on
axis([-0.5*sps 0.5*sps min(y_f) max(y_f)])
title(['2048 Point Windowed Spectra, Cyclostationary Component, \alpha=',num2str(alpha)])
xlabel('Normalized Frequency')
ylabel('Log Magnitude (dB)')
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))
end
