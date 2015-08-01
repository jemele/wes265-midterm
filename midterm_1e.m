function midterm_1e(x)
% 1d. Write the Matlab script that modulates 1000 symbols of shaped QPSK input
% data for each of the three SQRT Nyquist filters. Plot the state transition
% diagrams of the three modulated series on a single figure.

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1e')

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
h_sf = fftshift(20*log10(abs(fft(h_s/sum(h_s),bins))));

% plot
subplot(length(alphas),1,i)
plot(0,0)
hold on
for n=1+64:(2*sps):length(x)-(2*sps)
plot(-1:1/sps:1,real(h_s(n:n+(2*sps))))
end
hold off
grid on
title(['Eye Diagram, Real Part Shaping Filter Output, \alpha=',num2str(alpha)])
ylabel('Amplitude')

end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

