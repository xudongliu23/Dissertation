function []=genfig_Forests_MH(arg1, percent1, percent2)

%% plot Forests_MH.pdf
fName1 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/UIUPForests/';
fName1 = strcat(fName1, arg1);
fName1 = strcat(fName1,'/50samplePerTree/sum.txt');
f1ID = fopen(fName1,'r');
if f1ID == -1
  error('Author:Function:OpenFile', 'Cannot open file: %s', fName1);
end
C_title1 = textscan(f1ID, '%s', 6, 'Delimiter',',');
C_data1 = textscan(f1ID,'%d %f %f %f %f %f', 'Delimiter',',');
fclose(f1ID);

fName2 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/CICPForests/';
fName2 = strcat(fName2, arg1);
fName2 = strcat(fName2,'/50samplePerTree/sum.txt');
f2ID = fopen(fName2,'r');
if f2ID == -1
  error('Author:Function:OpenFile', 'Cannot open file: %s', fName2);
end
C_title2 = textscan(f2ID, '%s', 6, 'Delimiter',',');
C_data2 = textscan(f2ID,'%d %f %f %f %f %f', 'Delimiter',',');
fclose(f2ID);

% celldisp(C_title1)
% celldisp(C_data1)

plot([1 10000],[percent1 percent1],  '--r', 'MarkerSize', 6, 'LineWidth', 1.5);
hold on;
plot(C_data1{2}, C_data1{4},  '-r', 'MarkerSize', 6, 'LineWidth', 1.5);
plot([1 10000],[percent2 percent2],  '--b', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data2{2}, C_data2{4},  '-b', 'MarkerSize', 6, 'LineWidth', 1.5);
hold off;

xlabel('Forest size')
ylabel('Accuracy on Testing%')
xlim([1 5000])
ylim([0.5 1])
%ax = gca;
%ax.XLabel.String = 'Forest size';
%ax.XLabel.FontSize = 20;
%ax.YLabel.String = 'Accuracy on Testing%';
%ax.YLabel.FontSize = 20;
%ax.XLim = [1 5000]; 
%ax.YLim = [0.5 1];

%hleg1 = legend('MH-UIUPTrees-Testing%', C_title1{1}{4}, 'MH-CICPTrees-Testing%', C_title2{1}{4});
hleg1 = legend('UIUP PLP-Trees','UIUP PLP-Forests','CICP PLP-Trees','CICP PLP-Forests');
set(hleg1, 'Location','SouthEast')
%set(ax, 'FontSize', 15)

%% export the figure to pdf
addpath ~/.matlab/export_fig/
% exportfigure(gcf, '~/test.pdf', [4 3], 300)
plotPath = './';
plotPath = strcat(plotPath, arg1);
plotPath = strcat(plotPath, '_Forests_MH.pdf');
export_fig (plotPath, '-transparent')

end
