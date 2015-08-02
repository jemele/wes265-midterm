function midterm_1i(x)

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1m')

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
n = 0.5*randn(1,length(x))+(j*randn(1,length(x))/sqrt(2))
h_s_n = h_s + n'
h_m_n = conv(h,h_s_n)/(h*h')

% plot
subplot(length(alphas),2,2*i-1)
plot(h_m_n(181:sps:length(x)),'r.')
grid on
axis([-2 2 -2 2])
title(['Constellation Diagram, Noise + Matched Filter, \alpha=',num2str(alpha)])
ylabel('Amplitude')

subplot(length(alphas),2,2*i)
plot(h_m_n(181:sps:length(x)),'r.')
grid on
axis([0.5 1.5 0.5 1.5])
title('Zoom to constellation plot')
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

