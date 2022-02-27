function mind_timefreq(data,fs,labels,title)
%plot the spectogram of each channel of the signal
figure('Renderer', 'painters', 'Position', [0 0 2000 1200]);
sgtitle(title);
for i=1:length(labels)
    subplot(5,4,i);
    spectrogram(data(i,:), 256, 0, [], fs, 'yaxis');
    subtitle(labels(i));
end
saveas(gcf, fullfile('./plots/time-frequency', title), 'png')
end

