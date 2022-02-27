function [] = plotComparison(trial_list, bsdatastructs, sdatastructs, bsdatanames, sdatanames)
%% Plot Comparisons Between Bs and S
%   trial_list = list of trials to be filtered

for i = 1:length(trial_list)
    trialnumber = trial_list(i);
    
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
      
    
    for j = 1:length(bsdatastructs)
        bsdatastruct = bsdatastructs(j);
        sdatastruct = sdatastructs(j);
        bsdataname = bsdatanames(j,:);
        sdataname = sdatanames(j,:);
        bsfs = bsdatastruct.bsdata.fsample;
        sfs = sdatastruct.sdata.fsample;
        
        timesamples = bsdatastruct.bsdata.time{1,trialnumber};
        bsmat = bsdatastruct.bsdata.trial{1,trialnumber};
        smat = sdatastruct.sdata.trial{1,trialnumber};
        signalLabels = bsdatastruct.bsdata.label;
        
        figure('Renderer', 'painters', 'Position', [0 0 2000 1000])
        for x = 1:length(signalLabels)
            subplot(ceil(length(signalLabels)/2),2,x)
            plot(timesamples, bsmat(x,:));
            hold on
            plot(timesamples, smat(x,:));
            title(signalLabels(x));
            %legend('bsdata', 'sdata');
        end
        plttitle = strcat(bsdataname, ' Filtered ' ,trialtitle);
        sgtitle(plttitle)
        figuresdir = './Plots/Comparisons';
        saveas(gcf, fullfile(figuresdir, plttitle), 'png')
        
        
        figure('Renderer', 'painters', 'Position', [0 0 2000 1000])
        for x = 1:length(signalLabels)
            subplot(ceil(length(signalLabels)/2),2,x)
            singlesided_fft(bsmat(x,:), bsfs);
            hold on
            singlesided_fft(smat(x,:), sfs);
            title(signalLabels(x));
            legend('bsdata', 'sdata');
        end
        plttitle = strcat(bsdataname, ' Filtered FFT' ,trialtitle);
        sgtitle(plttitle)
        figuresdir = './Plots/Comparisons/FFT';
        saveas(gcf, fullfile(figuresdir, plttitle), 'png')
        
    end

end



end

