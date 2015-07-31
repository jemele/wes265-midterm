function midterm_1d(x)
% 1d. Write the Matlab script that modulates 1000 symbols of shaped QPSK input
% data for each of the three SQRT Nyquist filters. Plot the state transition
% diagrams of the three modulated series on a single figure.

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1d')

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
symbols = 1000
dim=ceil(length(alphas)/2)
subplot(dim,dim,i)
plot(h_s(1:symbols*sps))
hold on
plot(h_s(1+64:sps:symbols*sps),'r.')
plot([-2 2],[0 0],'k')
plot([0 0],[-2 2],'k')
hold off
grid on
axis('equal')
axis([-2. 2 -2 2])
%set(gca,'xtick',[-2:0.5:2])
title(['Transition Diagram, Modulated Time Series, \alpha=',num2str(alpha)])
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

