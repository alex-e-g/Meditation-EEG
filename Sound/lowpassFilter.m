function [filtered_mat] = lowpassFilter(freq, datatype, datastruct, i, plttitle, plotting)
%% Apply a low pass filter to the signals
%   freq = bandpass frequency
%   datatype = bsdata or sdata
%   datastruct = name of extracted data structure
%   i = trial number
%   plttitle = plot title
%   plotting = 'ON' or 'OFF'


if datatype == "bsdata"
    fs = datastruct.bsdata.fsample;
    timesamples = datastruct.bsdata.time{1,i};
    signalmat = datastruct.bsdata.trial{1,i};
    signalLabels = datastruct.bsdata.label;
end

if datatype == "sdata"
    fs = datastruct.sdata.fsample;
    timesamples = datastruct.sdata.time{1,i};
    signalmat = datastruct.sdata.trial{1,i};
    signalLabels = datastruct.sdata.label;
end

filtered_mat = signalmat;

for j = 1: length(signalLabels)
    filteredsig = lowpass(signalmat(j,:), freq, fs); % filtered signal
    filtered_mat(j,:) = filteredsig;
end

if plotting == "ON"

    % Plot FFT
    figuresdir = './Plots/Filtered/1 Power Line LowPass/FFT';

    figure('Renderer', 'painters', 'Position', [0 0 2000 1200])
    for j = 1: length(signalLabels)
        subplot(ceil(length(signalLabels)/2),2,j)
        singlesided_fft(filtered_mat(j,:), fs);
        title([signalLabels(j)])
    end
    sgtitle(strcat(plttitle, ' FFT'))

    saveas(gcf, fullfile(figuresdir, strcat(plttitle, ' FTT')), 'png')

    % Plot signal
    figuresdir = './Plots/Filtered/1 Power Line LowPass';

    figure('Renderer', 'painters', 'Position', [0 0 2000 1200])
    for j = 1: length(signalLabels)
        subplot(ceil(length(signalLabels)/2),2,j)
        plot(timesamples, filtered_mat(j,:));
        title([signalLabels(j)])
    end
    sgtitle(plttitle)

    saveas(gcf, fullfile(figuresdir, plttitle), 'png')
end

end

