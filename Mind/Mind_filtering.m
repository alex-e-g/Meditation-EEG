%%
%Loading Mindfulness Meditation Data
AF = load('FF_AF');
EC1 = load('FF_EC_1');
EC2 = load('FF_EC_2');
EO1 =load('FF_EO_1');
EO2 = load('FF_EO_2');
MA = load('FF_MA');
labels = EC1.med_data.label;
%%
%Now, let us plot the baseline signals and choose epochs of 10 seconds
%with no visible artifacts
EC1_data = EC1.med_data.trial{1,1};
plot_mind(EC1_data,labels, 'Complete EC1 signal','./plots/original signals');
%because the sampling frequency is 250Hz, we know 10s correspond to 2500
%samples
EC1_data2 = EC1_data(:,2500:5000);
plot_mind(EC1_data2,labels, '10s of EC1 signal','./plots/10sec signals');

labels = EC2.med_data.label;
EC2_data = EC2.med_data.trial{1,1};
plot_mind(EC2_data,labels, 'Complete EC2 signal','./plots/original signals');
EC2_data2 = EC2_data(:,20000:22500);
plot_mind(EC2_data2,labels, '10s of EC2 signal','./plots/10sec signals');


EO1_data = EO1.med_data.trial{1,1};
plot_mind(EO1_data,labels, 'Complete EO1 signal','./plots/original signals');
EO1_data2 = EO1_data(:,15000:17500);
plot_mind(EO1_data2,labels, '10s of EO1 signal','./plots/10sec signals');


EO2_data = EO2.med_data.trial{1,1};
plot_mind(EO2_data,labels, 'Complete EO2 signal','./plots/original signals');
EO2_data2 = EO2_data(:,17500:20000);
plot_mind(EO2_data2,labels, '10s of EO2 signal','./plots/10sec signals');

%%
%Same procedure but for the focused attention and open monitoring signals.
%Because these signals are much longer, we will isolate 3 separate 10
%second epochs per signal.

AF_data = AF.med_data.trial{1,1};
plot_mind(AF_data,labels, 'Complete AF signal','./plots/original signals');

AF_data1 = AF_data(:,2500:5000);
plot_mind(AF_data1,labels, '10s of AF signal (from 10 to 20 seconds)','./plots/10sec signals');

AF_data2 = AF_data(:,250000:252500);
plot_mind(AF_data2,labels, '10s of AF signal (from 1000 to 1010 seconds)','./plots/10sec signals');

AF_data3 = AF_data(:,500000:502500);
plot_mind(AF_data3,labels, '10s of AF signal (from 2000 to 2010 seconds)','./plots/10sec signals');


MA_data = MA.med_data.trial{1,1};
plot_mind(MA_data,labels, 'Complete MA signal','./plots/original signals');

MA_data1 = MA_data(:,2500:5000);
plot_mind(MA_data1,labels, '10s of MA signal (from 10 to 20 seconds)','./plots/10sec signals');

MA_data2 = MA_data(:,75000:77500);
plot_mind(MA_data2,labels, '10s of MA signal (from 300 to 310 seconds)','./plots/10sec signals');

MA_data3 = MA_data(:,125000:127500);
plot_mind(MA_data3,labels, '10s of MA signal (from 500 to 510 seconds)','./plots/10sec signals');

%%
%Compute the spectrum of each 10 second sample obtained previously (for
%both the baseline and meditation signals)

EEG_fft(EC1_data2,labels_EC1,'EC1 fft');
EEG_fft(EC2_data2,labels_EC2,'EC2 fft');
EEG_fft(EO1_data2,labels_EO1,'EO1 fft');
EEG_fft(EO2_data2,labels,'EO2 fft');
EEG_fft(AF_data1,labels,'AF fft1');
EEG_fft(AF_data2,labels,'AF fft2');
EEG_fft(AF_data3,labels,'AF fft3');
EEG_fft(MA_data1,labels,'MA fft1');
EEG_fft(MA_data2,labels,'MA fft2');
EEG_fft(MA_data3,labels,'MA fft3');

%%
%High pass filtering to eliminate frequencies below 0.5Hz
EC1_filt = highpass(EC1_data2,0.5,250);
EC2_filt = highpass(EC2_data2,0.5,250);
EO1_filt = highpass(EO1_data2,0.5,250);
EO2_filt = highpass(EO2_data2,0.5,250);
AF_filt1 = highpass(AF_data1,0.5,250);
AF_filt2 = highpass(AF_data2,0.5,250);
AF_filt3 = highpass(AF_data3,0.5,250);
MA_filt1 = highpass(MA_data1,0.5,250);
MA_filt2 = highpass(MA_data2,0.5,250);
MA_filt3 = highpass(MA_data3,0.5,250);

%Plot the fft of the filtered signal
EEG_fft(EC1_filt,labels_EC1,'filtered EC1 fft');
EEG_fft(EC2_filt,labels_EC2,'filtered EC2 fft');
EEG_fft(EO1_filt,labels_EO1,'filtered EO1 fft');
EEG_fft(EO2_filt,labels,'filtered EO2 fft');
EEG_fft(AF_filt1,labels,'filtered AF fft1');
EEG_fft(AF_filt2,labels,'filtered AF fft2');
EEG_fft(AF_filt3,labels,'filtered AF fft3');
EEG_fft(MA_filt1,labels,'filtered MA fft1');
EEG_fft(MA_filt2,labels,'filtered MA fft2');
EEG_fft(MA_filt3,labels,'filtered MA fft3');

%Saving the filtered signals
save('EC1_filt.mat', 'EC1_filt');
save('EC2_filt.mat', 'EC2_filt');
save('EO1_filt.mat', 'EO1_filt');
save('EO2_filt.mat', 'EO2_filt');
save('AF_filt1.mat', 'AF_filt1');
save('AF_filt2.mat', 'AF_filt2');
save('AF_filt3.mat', 'AF_filt3');
save('MA_filt1.mat', 'MA_filt1');
save('MA_filt2.mat', 'MA_filt2');
save('MA_filt3.mat', 'MA_filt3');
save('labels.mat', 'labels');