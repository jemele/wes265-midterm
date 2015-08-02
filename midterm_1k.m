function midterm_1d(x)

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1k')

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
subplot(length(alphas),1,i)

% Note: every time you convolve, you incur the delay penalty of the filter.
delay=2*160
k = 2*sps
hold on
for n=1+delay:k:length(x)-k
plot(-1:1/sps:1,real(h_m_n(n:n+k)))
end
hold off
grid on
title(['Eye Diagram, Matched (Modulated + Noise), \alpha=',num2str(alpha)])
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

