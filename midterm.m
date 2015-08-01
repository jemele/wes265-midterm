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

