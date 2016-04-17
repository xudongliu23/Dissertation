function [] = genfig_Forests_X_MH(arg1, percent)

%% plot Forests_X_MH.pdf
fName1 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/UIUPForests/';
fName1 = strcat(fName1, arg1);
fName1 = strcat(fName1,'/X/50samplePerTree/sum.txt');
f1ID = fopen(fName1,'r');
if f1ID == -1
  error('Author:Function:OpenFile', 'Cannot open file: %s', fName1);
end
C_title1 = textscan(f1ID, '%s', 5, 'Delimiter',',');
C_data1 = textscan(f1ID,'%d %f %f %f %f', 'Delimiter',',');
fclose(f1ID);

fName2 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/UIUPForests/';
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

plot(C_data1{1}, C_data1{3},  '-r', 'MarkerSize', 6, 'LineWidth', 1.5);
hold on;
plot(C_data2{2}, C_data2{4},  '-b', 'MarkerSize', 6, 'LineWidth', 1.5);
plot([1 5000],[percent percent],  '-c', 'MarkerSize', 6, 'LineWidth', 1.5);
hold off;

xlabel('Forest size')
ylabel('Accuracy%')
xlim([1 5000])
ylim([0.5 1])

hleg1 = legend(C_title1{1}{3}, C_title2{1}{4}, 'MH-UIUPTrees-Testing%');
set(hleg1, 'Location','SouthEast')

%% export the figure to pdf
addpath ~/.matlab/export_fig/
% exportfigure(gcf, '~/test.pdf', [4 3], 300)
plotPath = './';
plotPath = strcat(plotPath, arg1);
plotPath = strcat(plotPath, '_Forests_X_MH.pdf');
export_fig (plotPath, '-transparent')

end
