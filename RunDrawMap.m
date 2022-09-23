%% add path and init
addpath(genpath("src"))
init_var; % clear and init variables
init_create; % create vedio folder and diary
%% open window and init gameMap, ghosts, pacMan
init_csv;
vedioWidth = 800;
vedioHeight = 1170;
%% load data and draw map
load("data/2-1-ljs-23-Sep-2022.mat","data");
map = data.gameMap.currentTiles(:,1);

init_gameVar;
drawMap;
Screen('Flip', gameWindow, 0, 0, 1);
imageArray = Screen('GetImage', gameWindow);
imwrite(imageArray, sprintf('Map-%s.jpg',datetime('now','Format','yMMdd-HHmm')))
rmpath(genpath("src"))