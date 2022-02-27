function plot_multiple(data1,data2,labels,title,path,name1,name2)
%this function plots 2 signals to allow for comparison
figure('Renderer', 'painters', 'Position', [0 0 2000 1200]);
sgtitle(title);
siz = size(data1);
for i=1:siz(1)
    subplot(10,2,i);
    hold on
    time = (0:siz(2)-1)/250;
    plot(time,data1(i,:));
    subtitle(labels(i));
end

for i=1:siz(1)
    subplot(10,2,i);
    time = (0:siz(2)-1)/250;
    plot(time,data2(i,:));
    legend(name1,name2);
    subtitle(labels(i));
end
saveas(gcf, fullfile(path, title), 'png')
end

