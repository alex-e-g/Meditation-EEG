function [] = plotBands(trialList, bsdatastructs, sdatastructs, datanames)
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
        bstimesamples = bsStruct.bsdata.time{1, trial_index};
        bsfs = bsStruct.bsdata.fsample;
        
        sStruct = sdatastructs(subject_index);
        sSignalMat = sStruct.sdata.trial{1, trial_index};
        stimesamples = sStruct.sdata.time{1, trial_index};
        sfs = sStruct.sdata.fsample;

        % ECG band for each signal in before-stimuli
        for signal_index = 1:size(bsSignalMat,1)
            signal = bsSignalMat(signal_index, :);
            signal_label = bsStruct.bsdata.label(signal_index);
            
            figure()
            extractBands(signal , bstimesamples, bsfs, 'ON');
            plttitle = char(strcat(subject_name, ' Before Stimuli - ECG Bands - ', signal_label));
            sgtitle(plttitle);
            
            figuresdir = strcat('./Plots/EEG Bands/', trialtitle, '/', subject_name); 
            saveas(gcf, fullfile(figuresdir, plttitle), 'png')
            
        end
           
        
        % ECG band for each signal in stimuli
        for signal_index = 1:size(sSignalMat,1)
            signal = sSignalMat(signal_index, :);
            signal_label = sStruct.sdata.label(signal_index);
            
            figure('Renderer', 'painters', 'Position', [0 0 2000 1000])
            extractBands(signal , stimesamples, sfs, 'ON');
            plttitle = char(strcat(subject_name, ' Stimuli - EEG Bands - ', signal_label));
            sgtitle(plttitle);
            
            figuresdir = strcat('./Plots/EEG Bands/', trialtitle, '/', subject_name); 
            saveas(gcf, fullfile(figuresdir, plttitle), 'png')
            
            
        end
        
    end
end

end

