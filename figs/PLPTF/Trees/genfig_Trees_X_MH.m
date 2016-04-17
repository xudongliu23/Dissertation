function []=genfig_Trees_X_MH(arg1)

addpath ~/.matlab/export_fig/

%% plot Trees_X_MH.pdf
fName1 =  '~/Codes/PrefLearnExperiments/';
fName1 = strcat(fName1,arg1);
fName1 = strcat(fName1,'/Results/sum.txt');
f1ID = fopen(fName1);
C_title1 = textscan(f1ID, '%s', 3, 'Delimiter',',');
C_data1 = textscan(f1ID,'%d %f %f', 'Delimiter',',');
fclose(f1ID);

fName2 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/UIUP/';
fName2 = strcat(fName2,arg1);
fName2 = strcat(fName2,'/sum.txt');
f2ID = fopen(fName2);
C_title2 = textscan(f2ID, '%s', 4, 'Delimiter',',');
C_data2 = textscan(f2ID,'%d %f %f %f', 'Delimiter',',');
fclose(f2ID);

%fName3 =  '~/Codes/DecisionTreeLearning/';
%fName3 = strcat(fName3,arg1);
%fName3 = strcat(fName3,'/sumFitctree.txt');
%f3ID = fopen(fName3);
%C_title3 = textscan(f3ID, '%s', 3, 'Delimiter',',');
%C_data3 = textscan(f3ID,'%d %f %f', 'Delimiter',',');
%fclose(f3ID);

% celldisp(C_title1)
% celldisp(C_data1)

plot(C_data1{1}, C_data1{3},  '-r', 'MarkerSize', 6, 'LineWidth', 1.5);
hold on;
plot(C_data2{1}, C_data2{3},  '-b', 'MarkerSize', 6, 'LineWidth', 1.5);
%plot(C_data3{1}, C_data3{3},  '-k', 'MarkerSize', 6, 'LineWidth', 1.5);
hold off;

xlabel('Sample size')
ylabel('Accuracy on Testing%')
xlim([1 250])
ylim([0.4 1])
%ax = gca;
%ax.XLabel.String = 'Sample size';
%ax.XLabel.FontSize = 20;
%ax.YLabel.String = 'Accuracy on Testing%';
%ax.YLabel.FontSize = 20;
%ax.XLim = [1 250];
%ax.YLim = [0.4 1];

%hleg1 = legend(C_title1{1}{[2,3]},C_title2{1}{[2,3]},C_title3{1}{[2,3]});
hleg1 = legend('BA-UIUP','G-UIUP');
set(hleg1, 'Location','SouthEast')
%set(ax, 'FontSize', 15)

%% export the figure to pdf
% exportfigure(gcf, '~/test.pdf', [4 3], 300)
plotPath = './';
plotPath = strcat(plotPath, arg1);
plotPath = strcat(plotPath, '_Trees_X_MH.pdf');
export_fig (plotPath, '-transparent')

end
