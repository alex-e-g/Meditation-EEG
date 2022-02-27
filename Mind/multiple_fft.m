function multiple_fft(data1,data2,labels,title,name1,name2)
%Compare 2 ffts
figure('Renderer', 'painters', 'Position', [0 0 2000 1200]);
sgtitle(title);
for j = 1: length(labels)
    subplot(ceil(length(labels)/2),2,j)
    hold on
    singlesided_fft(data1(j,:), 250);
    singlesided_fft(data2(j,:), 250);
    subtitle([labels(j)])
    legend(name1,name2);
end

saveas(gcf, fullfile('./plots/comparisons', title), 'png')

end

