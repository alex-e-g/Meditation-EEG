function [outputArg1,outputArg2] = fieldtrip_plots(trialList, bsdatastructs, sdatastructs, datanames)
% Make spatial frequency plots for all trials and subjects using fieldtrip

figuresdir = './Plots/Fieldtrip'; 
load('FF_layout.mat');

% Fix label structure
lay.label(1) = cellstr('EEG Fp1');
lay.label(2) = cellstr('EEG F7');
lay.label(3) = cellstr('EEG Fp2');
lay.label(4) = cellstr('EEG F8');
lay.label(5) = cellstr('EEG F3');
lay.label(6) = cellstr('EEG Fz');
lay.label(7) = cellstr('EEG F4');
lay.label(8) = cellstr('EEG T8');
lay.label(9) = cellstr('EEG C4');
lay.label(10) = cellstr('EEG Cz');
lay.label(11) = cellstr('EEG C3');
lay.label(12) = cellstr('EEG T7');
lay.label(13) = cellstr('EEG P8');
lay.label(14) = cellstr('EEG P4');
lay.label(15) = cellstr('EEG Pz');
lay.label(16) = cellstr('EEG P3');
lay.label(17) = cellstr('EEG P7');
lay.label(18) = cellstr('EEG O1');
lay.label(19) = cellstr('EEG O2');

% Load Fieldtrip functions
addpath C:\Users\Catarina\fieldtrip-20210629 %change to your fieldtrip path
ft_defaults


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
        sStruct = sdatastructs(subject_index);
        
        %% BS data
        % Create fieldtrip structure with power fields
        med_data = bsStruct.bsdata;
        cfg              = [];
        cfg.trials       = med_data.trialinfo==trialnumber;
        data = ft_selectdata(cfg, med_data);
        cfg              = [];
        cfg.output       = 'pow';
        cfg.channel      = 'all';
        cfg.method       = 'mtmfft';
        cfg.taper        = 'hanning';
        cfg.foi          = 2:2:30;                         % analysis 2 to 30 Hz in steps of 2 Hz
        med_data_pow = ft_freqanalysis(cfg, data);    % new structure with power information

        % Plot
        cfg = [];
        cfg.xlim         = [4 4]; % freq (freq index, not the value in Hz, check med_data_pow.freq)
        cfg.zlim         = 'maxmin'; % color scale
        cfg.ylim         = [1 1];
        cfg.zlim         = [0 10];
        cfg.marker       = 'on';
        cfg.layout       = lay;
        
        figure;
        ft_topoplotTFR(cfg, med_data_pow);
        colorbar
        plttitle = char(strcat(subject_name, ' - Before Stimuli - ', trialtitle));
        sgtitle(plttitle);      
        saveas(gcf, fullfile(figuresdir, plttitle), 'png')
        %% S Data
        % Create fieldtrip structure with power fields
        med_data = sStruct.sdata;
        cfg              = [];
        cfg.trials       = med_data.trialinfo==trialnumber;
        data = ft_selectdata(cfg, med_data);
        cfg              = [];
        cfg.output       = 'pow';
        cfg.channel      = 'all';
        cfg.method       = 'mtmfft';
        cfg.taper        = 'hanning';
        cfg.foi          = 2:2:30;                         % analysis 2 to 30 Hz in steps of 2 Hz

        med_data_pow = ft_freqanalysis(cfg, data);    % new structure with power information

        % Plot
        cfg = [];
        cfg.xlim         = [4 4]; % freq (freq index, not the value in Hz, check med_data_pow.freq)
        cfg.zlim         = 'maxmin'; % color scale
        cfg.ylim         = [1 1];
        cfg.zlim         = [0 10];
        cfg.marker       = 'on';
        cfg.layout       = lay;
        
        ft_topoplotTFR(cfg, med_data_pow);
        colorbar
        plttitle = char(strcat(subject_name, ' - During Stimuli - ', trialtitle));
        sgtitle(plttitle);      
        saveas(gcf, fullfile(figuresdir, plttitle), 'png')
        %%        
        
             
    end
end
end

