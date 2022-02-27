function EEG_fft(data,labels,title)
%data = signal (all channels)
%labels = data labels (eg: Fp1, Fp2, F7, etc)
%title = title of the plot
figure('Renderer', 'painters', 'Position', [0 0 2000 1200]);
sgtitle(title);
for j = 1: length(labels)
    subplot(ceil(length(labels)/2),2,j)
    singlesided_fft(data(j,:), 250);
    subtitle([labels(j)])
end

saveas(gcf, fullfile('./plots/ffts', title), 'png')

end

