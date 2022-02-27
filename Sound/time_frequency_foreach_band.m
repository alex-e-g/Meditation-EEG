function [] = time_frequency_foreach_band(trialList, bsdatastructs, sdatastructs, datanames)
% Make the time frequency plots for each EEG band (all sounds and subjects)
%   

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

        % For each EEG channel, plot the time-frequency comparisons for
        % each band
        for signal_index = 1:size(bsSignalMat,1)
            % BS signal
            signal = bsSignalMat(signal_index, :);
            signal_label = bsStruct.bsdata.label(signal_index);
            
            delta = lowpass(signal, 4, bsfs);
            theta = bandpass(signal, [4, 7.5], bsfs);
            alpha_lower = bandpass(signal, [7.5, 9.5], bsfs);
            alpha_upper = bandpass(signal, [9.5, 12.5], bsfs);
            beta = bandpass(signal, [12.5, 30], bsfs);
            gamma = highpass(signal, 30, bsfs);
            
            figure('Renderer', 'painters', 'Position', [0 0 2000 1000])
            subplot(6,2,1); spectrogram(delta, 256, 0, [], bsfs, 'yaxis'); ylim([0 4]); title('BS delta')
            subplot(6,2,3); spectrogram(theta, 256, 0, [], bsfs, 'yaxis'); ylim([4 7.5]); title('BS theta')
            subplot(6,2,5); spectrogram(alpha_lower, 256, 0, [], bsfs, 'yaxis'); ylim([7.5 9.5]); title('BS lower alpha')
            subplot(6,2,7); spectrogram(alpha_upper, 256, 0, [], bsfs, 'yaxis'); ylim([9.5 12.5]); title('BS upper alpha')
            subplot(6,2,9); spectrogram(beta, 256, 0, [], bsfs, 'yaxis'); ylim([12.5 30]); title('BS beta')
            subplot(6,2,11); spectrogram(gamma, 256, 0, [], bsfs, 'yaxis'); ylim([30 40]); title('BS gamma+noise')
            
            % S Signal
            signal = sSignalMat(signal_index, :);
            delta = lowpass(signal, 4, sfs);
            theta = bandpass(signal, [4, 7.5], sfs);
            alpha_lower = bandpass(signal, [7.5, 9.5], sfs);
            alpha_upper = bandpass(signal, [9.5, 12.5], sfs);
            beta = bandpass(signal, [12.5, 30], sfs);
            gamma = highpass(signal, 30, sfs);
            
            subplot(6,2,2); spectrogram(delta, 256, 0, [], sfs, 'yaxis'); ylim([0 4]); title('S delta')
            subplot(6,2,4); spectrogram(theta, 256, 0, [], sfs, 'yaxis'); ylim([4 7.5]); title('S theta')
            subplot(6,2,6); spectrogram(alpha_lower, 256, 0, [], sfs, 'yaxis'); ylim([7.5 9.5]); title('S lower alpha')
            subplot(6,2,8); spectrogram(alpha_upper, 256, 0, [], sfs, 'yaxis'); ylim([9.5 12.5]); title('S upper alpha')
            subplot(6,2,10); spectrogram(beta, 256, 0, [], sfs, 'yaxis'); ylim([12.5 30]); title('S beta')
            subplot(6,2,12); spectrogram(gamma, 256, 0, [], sfs, 'yaxis'); ylim([30 40]); title('S gamma+noise')
            
            plttitle = char(strcat(subject_name, ' - ', signal_label));
            sgtitle(plttitle);
                      
            figuresdir = strcat('./Plots/TimeFrequency EEG Bands/', trialtitle, '/', subject_name); 
            saveas(gcf, fullfile(figuresdir, plttitle), 'png')
            
        end
        
    end
end

end

