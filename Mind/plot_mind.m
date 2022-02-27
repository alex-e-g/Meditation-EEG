function plot_mind(data,labels,title,path)
%data = signal (all channels)
%labels = data labels (eg: Fp1, Fp2, F7, etc)
%title = title of the plot

siz = size(data);
figure('Renderer', 'painters', 'Position', [0 0 2000 1200]);
sgtitle(title);
for i=1:siz(1)
    subplot(10,2,i);
    time = (0:siz(2)-1)/250;
    plot(time,data(i,:));
    subtitle(labels(i));
end
saveas(gcf, fullfile(path, title), 'png')
end

