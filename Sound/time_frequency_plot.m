function [] = time_frequency_plot(bs_signal, s_signal, bsfs, sfs)
% Make a time frequency plot
%   bs_signal: signal before stimuli
%   s_signal: signal during stimuli
%   fs: sampling frequency (bs or s)
subplot(121)
spectrogram(bs_signal, 256, 0, [], bsfs, 'yaxis')
ylim([0 40])
title('Before Stimuli')
subplot(122)
spectrogram(s_signal, 256, 0, [], sfs, 'yaxis')
ylim([0 40])
title('During Stimuli')
end

