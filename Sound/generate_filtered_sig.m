function [filt_bsdatastructs, filt_sdatastructs] = generate_filtered_sig(trial_list, bsdatastructs, sdatastructs, bsdatanames, sdatanames, filtertype, freq, plotting)
%% Create new structure files with the filtered signals
%   trial_list = list of trials to be filtered
%   struct_list = list with data structures to be filtered
%   filtertype = 'lowpass', 'highpass'
%   freq = bandpass frequency

 if ~exist('freq','var')
     % parameter does not exist, so default it to something
      freq = -1;
 end
 

filt_bsdatastructs = bsdatastructs;
filt_sdatastructs = sdatastructs;

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
      
    
    
    if filtertype == "lowpass"
        for j = 1:length(bsdatastructs)
            filt_bsdatastructs(j).bsdata.trial{1, trialnumber} = lowpassFilter(freq, 'bsdata', bsdatastructs(j), trialnumber, strcat(bsdatanames(j,:), 'Low-Pass Filtered ' ,trialtitle), plotting);
        end

        for j = 1:length(sdatastructs)
            filt_sdatastructs(j).sdata.trial{1, trialnumber} = lowpassFilter(freq, 'sdata', sdatastructs(j), trialnumber, strcat(sdatanames(j,:),'Low-Pass Filtered ', trialtitle), plotting);
        end
    end
    
    if filtertype == "highpass"
        for j = 1:length(bsdatastructs)
            filt_bsdatastructs(j).bsdata.trial{1, trialnumber} = highpassFilter(freq, 'bsdata', bsdatastructs(j), trialnumber, strcat(bsdatanames(j,:), 'High-Pass Filtered ' ,trialtitle), plotting);
        end

        for j = 1:length(sdatastructs)
            filt_sdatastructs(j).sdata.trial{1, trialnumber} = highpassFilter(freq, 'sdata', sdatastructs(j), trialnumber, strcat(sdatanames(j,:),'High-Pass Filtered ', trialtitle), plotting);
        end
    end
end



end

