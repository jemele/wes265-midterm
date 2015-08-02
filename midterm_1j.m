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
subplot(length(alphas),2,2*i-1)
delay=160
plot(h_m(1+delay:sps:length(h_m)-(delay+1)),'r.')
grid on
axis('equal')
axis([-2 2 -2 2])
title(['Constellation Diagram, Matched Filter, \alpha=',num2str(alpha)])

subplot(length(alphas),2,2*i)
delay=160
plot(h_m(1+delay:sps:length(h_m)-(delay+1)),'r.')
grid on
axis('equal')
axis([0.5 1.5 0.5 1.5])
title(['Zoom to constellation plot'])

end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

