function midterm_1b(x)
% Write the Matlab script that modulates 1000 symbols of shaped QPSK input data
% for each of the three SQRT Nyquist filters. Plot the first 400 samples (100
% symbols) of the real part of the three modulated series on a single figure
% with three subplots. 

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1b')

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

% plot
subplot(length(alphas),1,i)
symbols = 100
hold on
plot(0:1/sps:100,real(h_s(1:(sps*symbols)+1)))
stem((0:symbols)+M,real(x(1:sps:(sps*symbols)+1)),'r')
hold off
grid on
axis([0 symbols -1.5 1.5])
title(['Real part, \alpha=',num2str(alpha)])
xlabel('Symbol')
ylabel('Amplitude')
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))
end
