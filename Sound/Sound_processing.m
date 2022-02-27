%% Process Sound Data

%% 
% Initialization
clear all;
close all;

load('bsdata_FDWF_6874_filt.mat');
load('bsdata_MCCN_1778_filt.mat');
load('bsdata_QSAL_6152_filt.mat');
load('bsdata_SIUY_9971_filt.mat');
load('bsdata_WSAD_3215_filt.mat');

load('sdata_FDWF_6874_filt.mat');
load('sdata_MCCN_1778_filt.mat');
load('sdata_QSAL_6152_filt.mat');
load('sdata_SIUY_9971_filt.mat');
load('sdata_WSAD_3215_filt.mat');

trial_list = [18, 19, 24, 28, 42, 43];

bsdatastructs = [bsdata_FDWF_6874_filt, bsdata_MCCN_1778_filt, bsdata_QSAL_6152_filt, bsdata_SIUY_9971_filt, bsdata_WSAD_3215_filt];
sdatastructs = [sdata_FDWF_6874_filt, sdata_MCCN_1778_filt, sdata_QSAL_6152_filt, sdata_SIUY_9971_filt, sdata_WSAD_3215_filt];

bsdatanames = ['Before Stimulus FDWF 6874 - '; 'Before Stimulus MCCN 1778 - '; 'Before Stimulus QSAL 6152 - '; 'Before Stimulus SIUY 9971 - '; 'Before Stimulus WSAD 3215 - '];
sdatanames = ['Stimulus FDWF 6874 - '; 'Stimulus MCCN 1778 - '; 'Stimulus QSAL 6152 - '; 'Stimulus SIUY 9971 - '; 'Stimulus WSAD 3215 - '];
datanames = ['FDWF 6874'; 'MCCN 1778'; 'QSAL 6152'; 'SIUY 9971'; 'WSAD 3215'];

%%
% Compare before and after stimuli (signals and FFT)
plotComparison(trial_list, bsdatastructs, sdatastructs, bsdatanames, sdatanames);

%%
% Make the time-frequency plots (not much is seen)
plot_timefreq_allsignals(trial_list, bsdatastructs, sdatastructs, datanames);

%%
% Extract ECG bands from all the signals and make time-frequency plots for
% each one
plotBands(trial_list, bsdatastructs, sdatastructs, datanames);
time_frequency_foreach_band(trial_list, bsdatastructs, sdatastructs, datanames);

%%
% Topographic Plots
fieldtrip_plots(trial_list, bsdatastructs, sdatastructs, datanames);







