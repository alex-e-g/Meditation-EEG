%% Read and filter Sound Data
% 

% Subjects:
% FDWF_6874
% MCCN_1778
% QSAL_6152
% SIUY_9971 (musician)
% WSAD_3215

% Relevant trials:
% 18 - «Shaman dream» - Border meditation & sleep
% 19 - «Mind awake & body asleep» - Trance meditation
% 24 - «Calm» (Pink Noise + Delta 1.5 Hz + Theta 6 Hz; FP1 = 100 Hz + FP2 = 150 Hz)
% 28 - «Deep chillout»
% 42 - «Mantra» Pad - Relaxing Sound 
% 43 - «Relaxation» Pad - Relaxing Sound


%%
% Initialization
clear all;
close all;

% Read before-stimulus data (all subjects)
bsdata_FDWF_6874 = load('../../Sound/bsdata/bsdata_FDWF_6874.mat');
bsdata_MCCN_1778 = load('../../Sound/bsdata/bsdata_MCCN_1778.mat');
bsdata_QSAL_6152 = load('../../Sound/bsdata/bsdata_QSAL_6152.mat');
bsdata_SIUY_9971 = load('../../Sound/bsdata/bsdata_SIUY_9971.mat');
bsdata_WSAD_3215 = load('../../Sound/bsdata/bsdata_WSAD_3215.mat');

% Read stimulus data (all subjects)
sdata_FDWF_6874 = load('../../Sound/sdata/sdata_FDWF_6874.mat');
sdata_MCCN_1778 = load('../../Sound/sdata/sdata_MCCN_1778.mat');
sdata_QSAL_6152 = load('../../Sound/sdata/sdata_QSAL_6152.mat');
sdata_SIUY_9971 = load('../../Sound/sdata/sdata_SIUY_9971.mat');
sdata_WSAD_3215 = load('../../Sound/sdata/sdata_WSAD_3215.mat');

bsdatastructs = [bsdata_FDWF_6874, bsdata_MCCN_1778, bsdata_QSAL_6152, bsdata_SIUY_9971, bsdata_WSAD_3215];
sdatastructs = [sdata_FDWF_6874, sdata_MCCN_1778, sdata_QSAL_6152, sdata_SIUY_9971, sdata_WSAD_3215];

bsdatanames = ['Before Stimulus FDWF 6874 - '; 'Before Stimulus MCCN 1778 - '; 'Before Stimulus QSAL 6152 - '; 'Before Stimulus SIUY 9971 - '; 'Before Stimulus WSAD 3215 - '];
sdatanames = ['Stimulus FDWF 6874 - '; 'Stimulus MCCN 1778 - '; 'Stimulus QSAL 6152 - '; 'Stimulus SIUY 9971 - '; 'Stimulus WSAD 3215 - '];

trials_list = [18, 19, 24, 28, 42, 43];

%% Plot the relevant signals
plotbytrialname(18, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'signal');
plotbytrialname(19, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'signal');
plotbytrialname(24, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'signal');
plotbytrialname(28, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'signal');
plotbytrialname(42, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'signal');
plotbytrialname(43, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'signal');

%% Plot the Power Spectra of the Signals
plotbytrialname(18, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'fft');
plotbytrialname(19, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'fft');
plotbytrialname(24, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'fft');
plotbytrialname(28, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'fft');
plotbytrialname(42, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'fft');
plotbytrialname(43, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'fft');

%% Low Pass Filter the signals
% Most FFTs show a 50 Hz peak corresponding to the power line. Let us
% filter it.

freq1 = 40;
[bsdata_filt, sdata_filt] = generate_filtered_sig(trials_list, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq1, 'ON');

% Now let us apply a high pass filer to eliminate frequencies below 0.5 Hz.
freq2 = 0.5;
[bsdata_filt2, sdata_filt2] = generate_filtered_sig(trials_list, bsdata_filt, sdata_filt, bsdatanames, sdatanames, 'highpass', freq2, 'ON');


% Plot the filtered signals and their FFTs
% plotbytrialname(18, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq);
% plotbytrialname(19, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq);
% plotbytrialname(24, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq);
% plotbytrialname(28, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq);
% plotbytrialname(42, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq);
% plotbytrialname(43, bsdatastructs, sdatastructs, bsdatanames, sdatanames, 'lowpass', freq);

%%
% Save the filtered signals in their new structures
bsdata_FDWF_6874_filt = bsdata_filt2(1);
bsdata_MCCN_1778_filt = bsdata_filt2(2);
bsdata_QSAL_6152_filt = bsdata_filt2(3);
bsdata_SIUY_9971_filt = bsdata_filt2(4);
bsdata_WSAD_3215_filt = bsdata_filt2(5);

sdata_FDWF_6874_filt = sdata_filt2(1);
sdata_MCCN_1778_filt = sdata_filt2(2);
sdata_QSAL_6152_filt = sdata_filt2(3);
sdata_SIUY_9971_filt = sdata_filt2(4);
sdata_WSAD_3215_filt = sdata_filt2(5);

save('bsdata_FDWF_6874_filt.mat', 'bsdata_FDWF_6874_filt');
save('bsdata_MCCN_1778_filt.mat', 'bsdata_MCCN_1778_filt');
save('bsdata_QSAL_6152_filt.mat', 'bsdata_QSAL_6152_filt');
save('bsdata_SIUY_9971_filt.mat', 'bsdata_SIUY_9971_filt');
save('bsdata_WSAD_3215_filt.mat', 'bsdata_WSAD_3215_filt');

save('sdata_FDWF_6874_filt.mat', 'sdata_FDWF_6874_filt');
save('sdata_MCCN_1778_filt.mat', 'sdata_MCCN_1778_filt');
save('sdata_QSAL_6152_filt.mat', 'sdata_QSAL_6152_filt');
save('sdata_SIUY_9971_filt.mat', 'sdata_SIUY_9971_filt');
save('sdata_WSAD_3215_filt.mat', 'sdata_WSAD_3215_filt');


