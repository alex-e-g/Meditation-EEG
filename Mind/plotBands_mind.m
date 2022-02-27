function plotBands_mind(signal, timesamples, fs, plotting,labels,title)
%plot delta,theta, lower and upper alpha, beta and gamma bands for each
%channel of the signal
for i = 1:length(labels)
    title2 = append(title,' - ',cell2mat(labels(i)));
    figure('Renderer', 'painters', 'Position', [0 0 2000 1200]);
    extractBands(signal(i,:), timesamples, fs, plotting);
    sgtitle(title2);
    saveas(gcf, fullfile('./plots/bands', title2), 'png')
end
end

