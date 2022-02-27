function [] = plotbytrialname(trialnumber, bsdatastructs, sdatastructs, bsdatanames, sdatanames, plottype, freq)
%   trialnumber - choose between 18, 19, 24, 28, 42 or 43
%   bsdatastructs - list with the before-simuli structures
%   sdatastructs - list with the stimuli structures
%   bsdatanames - title of the subjects in bsdatastructs
%   sdatanames - title of the subjects in sdatastructs
%   plottype - signal, FFT, lowpass


 if ~exist('freq','var')
     % parameter does not exist, so default it to something
      freq = -1;
 end

if trialnumber == 18
    trialtitle = 'Trial «Shaman dream»';
end
if trialnumber == 19
    trialtitle = 'Trial «Mind awake & body asleep»';
end
if trialnumber == 24
    trialtitle = 'Trial «Calm»';
end
if trialnumber == 28
    trialtitle = 'Trial «Deep chillout»';
end
if trialnumber == 42
    trialtitle = 'Trial «Mantra»';
end
if trialnumber == 43
    trialtitle = 'Trial «Relaxation»';
end

if plottype == "signal"
    for j = 1:length(bsdatastructs)
        plot_signals('bsdata', bsdatastructs(j), trialnumber, strcat(bsdatanames(j,:),trialtitle));
    end

    for j = 1:length(sdatastructs)
        plot_signals('sdata', sdatastructs(j), trialnumber, strcat(sdatanames(j,:),trialtitle));
    end
end

if plottype == "fft"
    for j = 1:length(bsdatastructs)
        plot_signals_spectra('bsdata', bsdatastructs(j), trialnumber, strcat(bsdatanames(j,:), 'Single-Sided Amplitude Spectrum' ,trialtitle));
    end

    for j = 1:length(sdatastructs)
        plot_signals_spectra('sdata', sdatastructs(j), trialnumber, strcat(sdatanames(j,:),'Single-Sided Amplitude Spectrum', trialtitle));
    end
end

if plottype == "lowpass"
    for j = 1:length(bsdatastructs)
        lowpassFilter(freq, 'bsdata', bsdatastructs(j), trialnumber, strcat(bsdatanames(j,:), 'Low-Pass Filtered ' ,trialtitle), 'ON');
    end

    for j = 1:length(sdatastructs)
        lowpassFilter(freq, 'sdata', sdatastructs(j), trialnumber, strcat(sdatanames(j,:),'Low-Pass Filtered ', trialtitle), 'ON');
    end
end

end

