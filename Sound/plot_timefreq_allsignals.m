function [outputArg1,outputArg2] = plot_timefreq_allsignals(trialList, bsdatastructs, sdatastructs, datanames)
% Apply function extractBands to all the trials and subjects

for trial_index = 1:length(trialList)
    trialnumber = trialList(trial_index);
    
    %% Trial Titles
    if trialnumber == 18
        trialtitle = 'Trial Shaman dream';
    end
    if trialnumber == 19
        trialtitle = 'Trial Mind awake & body asleep';
    end
    if trialnumber == 24
        trialtitle = 'Trial Calm';
    end
    if trialnumber == 28
        trialtitle = 'Trial Deep chillout';
    end
    if trialnumber == 42
        trialtitle = 'Trial Mantra';
    end
    if trialnumber == 43
        trialtitle = 'Trial Relaxation';
    end
    
    %%
    for subject_index = 1:length(bsdatastructs)
        
        subject_name = datanames(subject_index,:);
        
        bsStruct = bsdatastructs(subject_index);
        bsSignalMat = bsStruct.bsdata.trial{1, trial_index};
        bsfs = bsStruct.bsdata.fsample;
        
        sStruct = sdatastructs(subject_index);
        sSignalMat = sStruct.sdata.trial{1, trial_index};
        sfs = sStruct.sdata.fsample;

        for signal_index = 1:size(bsSignalMat,1)
            bssignal = bsSignalMat(signal_index, :);
            ssignal = sSignalMat(signal_index, :);
            signal_label = bsStruct.bsdata.label(signal_index);
            
            figure('Renderer', 'painters', 'Position', [0 0 900 500])
            time_frequency_plot(bssignal, ssignal, bsfs, sfs);
            plttitle = char(strcat(subject_name, ' Time-Frequency Plots - ', signal_label));
            sgtitle(plttitle);
            
            figuresdir = strcat('./Plots/TimeFrequency/', trialtitle, '/', subject_name); 
            saveas(gcf, fullfile(figuresdir, plttitle), 'png')
            
        end   
             
    end
end

end

