function [timesamples, signalmat] = plot_signals(datatype, datastruct, i, plttitle)
%% Extract individual EEG signals and plot them
%   datatype = bsdata or sdata
%   datastruct = name of extracted data structure
%   i = trial number
%   plttitle = plot title

figuresdir = './Plots/StartingSignals';

if datatype == "bsdata"
    timesamples = datastruct.bsdata.time{1,i};
    signalmat = datastruct.bsdata.trial{1,i};
    signalLabels = datastruct.bsdata.label;
end

if datatype == "sdata"
    timesamples = datastruct.sdata.time{1,i};
    signalmat = datastruct.sdata.trial{1,i};
    signalLabels = datastruct.sdata.label;
end

figure('Renderer', 'painters', 'Position', [0 0 2000 1000])
for j = 1: length(signalLabels)
    subplot(ceil(length(signalLabels)/2),2,j)
    plot(timesamples, signalmat(j,:))
    title(signalLabels(j))
end
sgtitle(plttitle)

saveas(gcf, fullfile(figuresdir, plttitle), 'png')

end

