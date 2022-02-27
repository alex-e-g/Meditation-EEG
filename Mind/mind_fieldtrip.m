%% Load filtered signals
clear all
close all

load('./Filtered Signals/AF_filt1.mat')
load('./Filtered Signals/AF_filt2.mat')
load('./Filtered Signals/AF_filt3.mat')
load('./Filtered Signals/MA_filt1.mat')
load('./Filtered Signals/MA_filt2.mat')
load('./Filtered Signals/MA_filt3.mat')
load('./Filtered Signals/EC1_filt.mat')
load('./Filtered Signals/EC2_filt.mat')
load('./Filtered Signals/EO1_filt.mat')
load('./Filtered Signals/EO2_filt.mat')
load('./Filtered Signals/labels.mat')

load('time.mat')

%% Load original structures and build filtered structures
load('FF_EO_2.mat');
med_data.trial{1,1} = EO2_filt;
med_data.time{1,1} = time;
% load('FF_EO_2.mat');
% load('FF_EO_1.mat');
% load('FF_EC_1.mat');
% load('FF_EC_2.mat');
% load('FF_MA.mat');

% Load fieldtrip matrix
load('FF_layout.mat')


%% Make the plots
figuresdir = './Plots/Fieldtrip'; 

% Load Fieldtrip functions
addpath C:\Users\Catarina\fieldtrip-20210629 %change to your fieldtrip path
ft_defaults


% Create fieldtrip structure with power fields
cfg              = [];
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
plttitle = 'EO2 filt';
sgtitle(plttitle);      
saveas(gcf, fullfile(figuresdir, plttitle), 'png')
