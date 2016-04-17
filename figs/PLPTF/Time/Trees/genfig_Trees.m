function []=genfig_Trees_MH(arg1)

addpath ~/.matlab/export_fig/

%% plot Trees_MH.pdf
fName0 =  '~/Codes/PrefLearnExperiments/';
fName0 = strcat(fName0,arg1);
fName0 = strcat(fName0,'/Results/sumWithTime.txt');
f0ID = fopen(fName0);
C_title0 = textscan(f0ID, '%s', 4, 'Delimiter',',');
C_data0 = textscan(f0ID,'%d %f %f %f', 'Delimiter',',');
fclose(f0ID);

fName1 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/UIUP/';
fName1 = strcat(fName1,arg1);
fName1 = strcat(fName1,'/sum.txt');
f1ID = fopen(fName1);
C_title1 = textscan(f1ID, '%s', 4, 'Delimiter',',');
C_data1 = textscan(f1ID,'%d %f %f %f', 'Delimiter',',');
fclose(f1ID);

fName2 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/UICP-1/';
fName2 = strcat(fName2,arg1);
fName2 = strcat(fName2,'/sum.txt');
f2ID = fopen(fName2);
C_title2 = textscan(f2ID, '%s', 4, 'Delimiter',',');
C_data2 = textscan(f2ID,'%d %f %f %f', 'Delimiter',',');
fclose(f2ID);

fName3 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/CIUPB/';
fName3 = strcat(fName3,arg1);
fName3 = strcat(fName3,'/sum.txt');
f3ID = fopen(fName3);
C_title3 = textscan(f3ID, '%s', 5, 'Delimiter',',');
C_data3 = textscan(f3ID,'%d %f %f %f %f', 'Delimiter',',');
fclose(f3ID);

fName4 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/CIUP/';
fName4 = strcat(fName4,arg1);
fName4 = strcat(fName4,'/sum.txt');
f4ID = fopen(fName4);
C_title4 = textscan(f4ID, '%s', 5, 'Delimiter',',');
C_data4 = textscan(f4ID,'%d %f %f %f %f', 'Delimiter',',');
fclose(f4ID);

fName5 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/CICP/';
fName5 = strcat(fName5,arg1);
fName5 = strcat(fName5,'/sum.txt');
f5ID = fopen(fName5);
C_title5 = textscan(f5ID, '%s', 4, 'Delimiter',',');
C_data5 = textscan(f5ID,'%d %f %f %f', 'Delimiter',',');
fclose(f5ID);

plot(C_data0{1}, C_data0{4},  '-c', 'MarkerSize', 6, 'LineWidth', 1.5);
hold on;
plot(C_data1{1}, C_data1{4},  '-r', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data2{1}, C_data2{4},  '-b', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data3{1}, C_data3{4},  '-g', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data4{1}, C_data4{4},  '-m', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data5{1}, C_data5{4},  '-k', 'MarkerSize', 6, 'LineWidth', 1.5);
hold off;

xlabel('Sample size')
ylabel('Training Time (s)')
if strcmp(arg1, 'MammographicMassDownsampled')
	xlim([1 700])
else
	xlim([1 3000])
end
ylim([1 120])
%ax = gca;
%ax.XLabel.String = 'Sample size';
%ax.XLabel.FontSize = 20;
%ax.YLabel.String = 'Training Time (s)';
%ax.YLabel.FontSize = 20;
%if strcmp(arg1, 'MammographicMassDownsampled')
%	ax.XLim = [1 700];
%else
%	ax.XLim = [1 3000];
%end
%ax.YLim = [1 120];

%hleg1 = legend(C_title1{1}{[2,3]},C_title2{1}{[2,3]},C_title3{1}{[2,3]},C_title4{1}{[2,3]},C_title5{1}{[2,3]});
%hleg1 = legend(C_title0{1}{4},C_title1{1}{4},C_title2{1}{4},C_title3{1}{4},C_title4{1}{4});
hleg1 = legend('BA-UIUP','G-UIUP','G-UICP-1','G-CIUPB','G-CIUPD','G-CICP');
set(hleg1, 'Location','NorthEast')
%set(ax, 'FontSize', 15)

%% export the figure to pdf
% exportfigure(gcf, '~/test.pdf', [4 3], 300)
plotPath = './';
plotPath = strcat(plotPath, arg1);
plotPath = strcat(plotPath, '.pdf');
export_fig (plotPath, '-transparent')

end
