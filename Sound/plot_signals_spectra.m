function [] = plot_signals_spectra(datatype, datastruct, i, plttitle)
%% Extract individual EEG signals and plot their power spectra
%   datatype = bsdata or sdata
%   datastruct = name of extracted data structure
%   i = trial number
%   plttitle = plot title

figuresdir = './Plots/StartingSignals/PowerSpectra';

if datatype == "bsdata"
    fs = datastruct.bsdata.fsample;
    signalmat = datastruct.bsdata.trial{1,i};
    signalLabels = datastruct.bsdata.label;
end

if datatype == "sdata"
    fs = datastruct.sdata.fsample;
    signalmat = datastruct.sdata.trial{1,i};
    signalLabels = datastruct.sdata.label;
end

figure('Renderer', 'painters', 'Position', [0 0 2000 1200])
for j = 1: length(signalLabels)
    subplot(ceil(length(signalLabels)/2),2,j)
    singlesided_fft(signalmat(j,:), fs);
    title([signalLabels(j)])
end
sgtitle(plttitle)

saveas(gcf, fullfile(figuresdir, plttitle), 'png')

end

