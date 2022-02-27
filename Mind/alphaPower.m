function [alpha_power,relative_ap] = alphaPower(data,fs)
%Calculating the relative alpha power for each channel of the EEG signal
relative_ap = [];
alpha_power = [];
for i = 1:length(data(:,1))
    alphap = bandpower(data(i,:),fs,[7.5 12.5]);
    alpha_power(end+1) = alphap;
    totalp = bandpower(data(i,:));
    relative_ap(end+1) = alphap/totalp;
end

