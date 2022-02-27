function [delta, theta, alpha, beta, gamma] = extractBands(signal, timesamples, fs, plotting)
%% Extract EEG Bands from a signal
%   delta: <4 Hz
%   theta: 4-7.5Hz
%   lower alpha: 7.5-9.5 Hz
%   upper alpha: 9.5-12.5 Hz
%   beta: 12.5-30 Hz
%   gamma+noise: > 30 Hz
%   plotting: 'ON' or 'OFF'

delta = lowpass(signal, 4, fs);
theta = bandpass(signal, [4, 7.5], fs);
alpha_lower = bandpass(signal, [7.5, 9.5], fs);
alpha_upper = bandpass(signal, [9.5, 12.5], fs);
beta = bandpass(signal, [12.5, 30], fs);
gamma = highpass(signal, 30, fs);



if plotting == "ON"
    subplot(5,1,1); plot(timesamples, delta); legend('delta')
    subplot(5,1,2); plot(timesamples, theta); legend('theta')
    subplot(5,1,3); plot (timesamples, alpha_lower); legend('lower alpha')
    subplot(5,1,4); plot (timesamples, alpha_upper); legend('upper alpha')
    subplot(5,1,5); plot(timesamples, beta); legend('beta')
    subplot(5,1,6); plot(timesamples, gamma); legend('gamma + noise')

end
end

