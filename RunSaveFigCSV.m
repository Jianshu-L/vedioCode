%% add path and init
addpath(genpath("src"))
init_var; % clear and init variables
init_create; % create vedio folder and diary
%% load csv data
dataName = "xuda-13-Nov-2021-3.csv"; % draw vedio from dataName in data folder
T = loadcsv(strcat('data/',dataName));
%% open window and init gameMap, ghosts, pacMan
init_csv;
vedioWidth = 800;
vedioHeight = 1170;
%% draw whole day
drawDayFromCSV(T, vedioWidth, vedioHeight);
%% 
sca
rmpath(genpath("src"))
diary off