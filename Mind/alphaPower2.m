function [alpha_power,relative_ap] = alphaPower2(data,fs)
%Calculating the relative alpha power for each channel of the EEG signal
relative_ap = [];
alpha_power = [];
for i = 1:length(data(:,1))
    alpha = bandpass(data(i,:),[7.5 12.5],fs);
    [alpha_peri, f] = periodogram(alpha,rectwin(length(alpha)),length(alpha),fs);
    alphap = bandpower(alpha_peri,f,'psd');
    alpha_power(end+1) = alphap;
    [peri,f2] = periodogram(data(i,:),rectwin(length(data(i,:))),length(data(i,:)),fs);
    totalp = bandpower(peri,f2,'psd');
    relative_ap(end+1) = alphap/totalp;
end
