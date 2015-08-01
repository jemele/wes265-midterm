sps = 4
x = qpsk_symbols(1000,4)

% 1a. Write the Matlab script that forms and plots the amplitude normalized impulse
% response for 3 SQRT Nyquist harris taper filters containing 20 symbols with
% 4-samples per symbol for values of alpha = 0.2, 0.4 and 0.6. Use harris taper
% filter designed with sqrt_nyq_y2 script.
midterm_1a(0.2)
midterm_1a(0.4)
midterm_1a(0.6)

% 1b. Write the Matlab script that modulates 1000 symbols of shaped QPSK input
% data for each of the three SQRT Nyquist filters. Plot the first 400 samples
% (100 symbols) of the real part of the three modulated series on a single
% figure with three subplots. 
midterm_1b(x)

% 1c. Plot 2048 point windowed spectra of the three modulation time series on a
% single figure with three subplots.
midterm_1c(x)

% 1d. Write the Matlab script that modulates 1000 symbols of shaped QPSK input
% data for each of the three SQRT Nyquist filters. Plot the state transition
% diagrams of the three modulated series on a single figure.
midterm_1d(x)

% 1e. Write the Matlab script that plots the eye diagrams of the shaped QPSK
% data for each of the three SQRT Nyquist filters on a single figure. Plot the
% eye diagrams.
midterm_1e(x)

% 1f. Write the Matlab script that plots the mean and standard deviation of the
% average absolute value of the eye diagrams for shaped QPSK data for each of
% the three SQRT Nyquist filters. Plot the position dependent mean and variance
% of the three modulated time series on a single figure. These position
% dependent statistics demonstrate the cyclostationarity of the modulated
% signal.
midterm_1f(x)

% 1g. Here we use the non-linearity of a conjugate cross product to access the
% periodic (cyclostationary) component of the shaped modulated signal. Write
% the Matlab script that plots the magnitude of the windowed spectrum of the
% conjugate product time series xx(1:2048).*conj(xx(1:2048)) for each time
% series xx of the three shaped QPSK time series. Plot the three spectra on a
% single figure. Note the amplitude and frequency of the spectral lines in the
% spectrum. How do the amplitude of these lines vary with excess bandwidth ?
midterm_1g(x)

% 1h. This is similar to part 1g but alter one of the signal components in the
% conjugate product. We differentiate the time series with dxx=filter([1 0
% -1]/2,1 xx] and then form the conjugate product offset time series
% xx(1:2048).*conj(dxx(2:2049)) for each time series xx of the three shaped
% QPSK time series (note the offset time index of dxx). Plot the three spectra
% on a single figure. Note the amplitude and frequency of the spectral lines in
% the spectrum. What change in the spectra is caused by using the derivative in
% the conjugate cross product. How do the amplitude of these lines vary with
% excess bandwidth ?
midterm_1h(x)

% 1i. Pass the three modulation time series through their corresponding matched
% filters and plot the eye diagrams for the three matched filter output series.
midterm_1i(x)

% 1j. Plot the constellation diagrams for the three matched filter output
% series and a zoom to the constellation point ISI spreading. Comment on the
% relative size of the constellation point spreading.
midterm_1j(x)
