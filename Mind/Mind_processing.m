%% Process Mind Data

%%
%Initialization
clear all
close all

load('EC1_filt');
load('EC2_filt');
load('EO1_filt');
load('EO2_filt');
load('AF_filt1');
load('AF_filt2');
load('AF_filt3');
load('MA_filt1');
load('MA_filt2');
load('MA_filt3');
load('labels');

%% Plot Comparisons
%Comparing the four baseline signals, two with closed eyes and two with
%open eyes
plot_multiple(EC1_filt,EO1_filt,labels,'EC1-EO1 Comparison','./plots/comparisons','EC1','EO1');
multiple_fft(EC1_filt,EO1_filt,labels, 'EC1-EO1 fft','EC1','EO1');
plot_multiple(EC2_filt,EO2_filt,labels,'EC2-EO2 Comparison','./plots/comparisons','EC2','EO2');
multiple_fft(EC2_filt,EO2_filt,labels, 'EC2-EO2 fft','EC2','EO2');

%Comparing closed eyes with meditation
plot_multiple(EC1_filt,AF_filt1,labels,'EC1-AF1 Comparison','./plots/comparisons','EC1','AF1');
multiple_fft(EC1_filt,AF_filt1,labels, 'EC1-AF1 fft','EC1','AF1');
plot_multiple(EC1_filt,AF_filt2,labels,'EC1-AF2 Comparison','./plots/comparisons','EC1','AF2');
multiple_fft(EC1_filt,AF_filt2,labels, 'EC1-AF2 fft','EC1','AF2');
plot_multiple(EC1_filt,AF_filt3,labels,'EC1-AF3 Comparison','./plots/comparisons','EC1','AF3');
multiple_fft(EC1_filt,AF_filt3,labels, 'EC1-AF3 fft','EC1','AF3');

plot_multiple(EC1_filt,MA_filt1,labels,'EC1-MA1 Comparison','./plots/comparisons','EC1','MA1');
multiple_fft(EC1_filt,MA_filt1,labels, 'EC1-MA1 fft','EC1','MA1');
plot_multiple(EC1_filt,MA_filt2,labels,'EC1-MA2 Comparison','./plots/comparisons','EC1','MA2');
multiple_fft(EC1_filt,MA_filt2,labels, 'EC1-MA2 fft','EC1','MA2');
plot_multiple(EC1_filt,MA_filt3,labels,'EC1-MA3 Comparison','./plots/comparisons','EC1','MA3');
multiple_fft(EC1_filt,MA_filt3,labels, 'EC1-MA3 fft','EC1','MA3');

%Let us plot the Cz channel for comparison of EC1 and EO1
figure();
hold on
singlesided_fft(EC2_filt(10,:), 250);
singlesided_fft(EO2_filt(10,:), 250);
saveas(gcf, fullfile('./plots/comparisons', 'EC2-EO2 Cz Channel'), 'png');
%The intersections are at 8.6 and 11.9

%%
%Time-frequency plots
mind_timefreq(EC1_filt,250,labels,'EC1 time-frequency plot');
mind_timefreq(EC2_filt,250,labels,'EC2 time-frequency plot');
mind_timefreq(EO1_filt,250,labels,'EO1 time-frequency plot');
mind_timefreq(EO2_filt,250,labels,'EO2 time-frequency plot');

mind_timefreq(AF_filt1,250,labels,'AF1 time-frequency plot');
mind_timefreq(AF_filt2,250,labels,'AF2 time-frequency plot');
mind_timefreq(AF_filt3,250,labels,'AF3 time-frequency plot');

mind_timefreq(MA_filt1,250,labels,'MA1 time-frequency plot');
mind_timefreq(MA_filt2,250,labels,'MA2 time-frequency plot');
mind_timefreq(MA_filt3,250,labels,'MA3 time-frequency plot');

%%
%Plotting the bands for each channel of each signal
time = 0:1/250:10;
plotBands_mind(EC1_filt,time,250,'ON',labels,'EC1 Bands');
plotBands_mind(EC2_filt,time,250,'ON',labels,'EC2 Bands');
plotBands_mind(EO1_filt,time,250,'ON',labels,'EO1 Bands');
plotBands_mind(EO2_filt,time,250,'ON',labels,'EO2 Bands');

plotBands_mind(AF_filt1,time,250,'ON',labels,'AF1 Bands');
plotBands_mind(AF_filt2,time,250,'ON',labels,'AF2 Bands');
plotBands_mind(AF_filt3,time,250,'ON',labels,'AF3 Bands');

plotBands_mind(MA_filt1,time,250,'ON',labels,'MA1 Bands');
plotBands_mind(MA_filt2,time,250,'ON',labels,'MA2 Bands');
plotBands_mind(MA_filt3,time,250,'ON',labels,'MA3 Bands');

%%
%Topographic Plots


%%
%Calculating relative alpha power
[alpha_EC1,rel_alpha_EC1] = alphaPower(EC1_filt,250);
[alpha_EC2,rel_alpha_EC2] = alphaPower(EC2_filt,250);
[alpha_EO1,rel_alpha_EO1] = alphaPower(EO1_filt,250);
[alpha_EO2,rel_alpha_EO2] = alphaPower(EO2_filt,250);

[alpha_AF1,rel_alpha_AF1] = alphaPower(AF_filt1,250);
[alpha_AF2,rel_alpha_AF2] = alphaPower(AF_filt2,250);
[alpha_AF3,rel_alpha_AF3] = alphaPower(AF_filt3,250);

[alpha_MA1,rel_alpha_MA1] = alphaPower(MA_filt1,250);
[alpha_MA2,rel_alpha_MA2] = alphaPower(MA_filt2,250);
[alpha_MA3,rel_alpha_MA3] = alphaPower(MA_filt3,250);


