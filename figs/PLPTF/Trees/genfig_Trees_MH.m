function []=genfig_Trees_MH(arg1)

addpath ~/.matlab/export_fig/

%% plot Trees_MH.pdf
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

fName3 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/SCIUP/';
fName3 = strcat(fName3,arg1);
fName3 = strcat(fName3,'/sum.txt');
f3ID = fopen(fName3);
C_title3 = textscan(f3ID, '%s', 4, 'Delimiter',',');
C_data3 = textscan(f3ID,'%d %f %f %f', 'Delimiter',',');
fclose(f3ID);

fName4 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/CICP/';
fName4 = strcat(fName4,arg1);
fName4 = strcat(fName4,'/sum.txt');
f4ID = fopen(fName4);
C_title4 = textscan(f4ID, '%s', 4, 'Delimiter',',');
C_data4 = textscan(f4ID,'%d %f %f %f', 'Delimiter',',');
fclose(f4ID);

%fName5 =  '~/Qt/UIUPPLPTreeLearnHeuristic/ExpResults/SCICP/';
%fName5 = strcat(fName5,arg1);
%fName5 = strcat(fName5,'/sum.txt');
%f5ID = fopen(fName5);
%C_title5 = textscan(f5ID, '%s', 4, 'Delimiter',',');
%C_data5 = textscan(f5ID,'%d %f %f %f', 'Delimiter',',');
%fclose(f5ID);

% celldisp(C_title1)
% celldisp(C_data1)

plot(C_data1{1}, C_data1{2},  '-r', 'MarkerSize', 6, 'LineWidth', 1.5);
hold on;
plot(C_data1{1}, C_data1{3},  '--r', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data2{1}, C_data2{2},  '-b', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data2{1}, C_data2{3},  '--b', 'MarkerSize', 6, 'LineWidth', 1.5);
%plot(C_data3{1}, C_data3{2},  '-g', 'MarkerSize', 6, 'LineWidth', 1.5);
%plot(C_data3{1}, C_data3{3},  '--g', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data4{1}, C_data4{2}, '-m', 'MarkerSize', 6, 'LineWidth', 1.5);
plot(C_data4{1}, C_data4{3}, '--m', 'MarkerSize', 6, 'LineWidth', 1.5);
%plot(C_data5{1}, C_data5{2},  '-k', 'MarkerSize', 6, 'LineWidth', 1.5);
%plot(C_data5{1}, C_data5{3},  '--k', 'MarkerSize', 6, 'LineWidth', 1.5);
hold off;

xlabel('Sample size')
ylabel('Accuracy%')

if strcmp(arg1, 'MammographicMassDownsampled')
	xlim([1 700])
else
	xlim([1 3000])
end
ylim([0.4 1])

%hleg1 = legend(C_title1{1}{[2,3]},C_title2{1}{[2,3]},C_title3{1}{[2,3]},C_title4{1}{[2,3]},C_title5{1}{[2,3]});
%hleg1 = legend(C_title1{1}{[2,3]},C_title2{1}{[2,3]},C_title3{1}{[2,3]},C_title4{1}{[2,3]});
hleg1 = legend(C_title1{1}{[2,3]},C_title2{1}{[2,3]},C_title4{1}{[2,3]});
set(hleg1, 'Location','SouthEast')

%% export the figure to pdf
% exportfigure(gcf, '~/test.pdf', [4 3], 300)
plotPath = './';
plotPath = strcat(plotPath, arg1);
plotPath = strcat(plotPath, '_Trees_MH.pdf');
export_fig (plotPath, '-transparent')

end
