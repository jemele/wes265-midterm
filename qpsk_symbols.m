function x=qpsk_symbols(K,N)
% Generate a number of qpsk symbols using the specified upsample.
% generate qpsk symbols (upsampled N:1)
s_n = K
s_d = [ -1-j -1+j 1-j 1+j ]
s = arrayfun(@(i) s_d(i),randi(length(s_d),s_n,1))
x = upsample(s,N)
end
