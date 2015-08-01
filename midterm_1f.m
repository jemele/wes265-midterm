function midterm_1f(x)

path=strcat('t:\xfer\xfer_res\jemele\projects\ucsd\wes265\assignments\midterm\1f')

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

% generate the mean for the shaped input
k = 2*sps
x_m = zeros(1,9)'
m = 0
for n = 1:k:length(h_s)-k
   x_m = x_m + abs(real(h_s(n:n+k)))
   m = m + 1
end
x_m = x_m/m

% generate sd for the shaped input
x_sd = zeros(1,9)'
m = 0
for n = 1:k:length(h_s)-k
    x_sd = x_sd + (abs(real(h_s(n:n+k)))-x_m).^2
    m = m + 1
end
x_sd = sqrt(x_sd/m)

% plot
subplot(length(alphas),2,(2*i)-1)
plot(-1:1/sps:1,x_m)
grid on
title(['Mean, \alpha=',num2str(alpha)])
ylabel('Amplitude')

subplot(length(alphas),2,2*i)
plot(-1:1/sps:1,x_sd)
grid on
title(['Standard Deviation, \alpha=',num2str(alpha)])
ylabel('Amplitude')
end

% write the plot out
print(f,'-dpng',strcat(path,'.png'))

