function midterm_1i(x)

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1i')

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
k = 2*sps
subplot(length(alphas),1,i)
plot(0,0)
hold on
for n=1+80:k:length(x)-k
plot(-1:1/sps:1,real(h_m(n:n+k)))
end
hold off
grid on
title(['Eye Diagram, Real Part Matching Filter Output, \alpha=',num2str(alpha)])
ylabel('Amplitude')

end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

