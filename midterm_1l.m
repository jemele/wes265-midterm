function midterm_1d(x)

M = 10
sps = 4

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

input_variance = var(h_s)
noise_variance = var(n)
input_noise_variance = var(h_s_n)
match_variance = var(h_m_n)

input_snr = snr(h_s_n, n')
output_snr = snr(h_m_n, h_m_n - h_m)
delta_snr = snr(h_m_n, h_m_n - h_m) - snr(h_s,n')

end
