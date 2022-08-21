%% add path and init
addpath(genpath("src"))
init_var; % clear and init variables
init_create; % create vedio folder and diary
%% load mat data
dataName = "data"; % draw vedio from dataName in data folder
Path = ".";
files = orderFile(dirFiles(strcat(Path,"\",dataName),"mat"),1,2);
filePath = strcat(Path,"\",dataName);
%% open window and init gameMap, ghosts, pacMan
init_csv;
vedioWidth = 800;
vedioHeight = 1170;
%% draw whole day
drawDayFromMAT(filePath, files, vedioWidth, vedioHeight);
%% 
sca
rmpath(genpath("src"))
diary off