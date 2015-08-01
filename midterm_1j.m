function midterm_1d(x)

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1j')

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
h_m = conv(h,h_s)/(h*h')

% plot
dim=ceil(length(alphas)/2)
subplot(dim,dim,i)

% Note: every time you convolve, you incur the delay penalty of the filter.
plot(h_m(1+160:sps:length(h_m)),'r.')
grid on
axis('equal')
title(['Delay=200 Constellation Diagram, Modulated Time Series, \alpha=',num2str(alpha)])
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

