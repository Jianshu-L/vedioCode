function Stop = drawTrialFromCSV(T_trial, vedioWidth, vedioHeight)
%% init var
Stop = 0;
num_j = 1;
file_name = unique(T_trial.DayTrial);
%% creat vedio folder
[fname,vname] = creatVF(file_name, "results/vedio/");
vedioName = sprintf('%s/%s.mp4', fname, vname);
%% main loop
for index = 1:length(T_trial.Step)
    %% key input to stop
    [~, ~, keyCode] = KbCheck;
    if keyCode(KbName('p'))
        break;
    end
    if keyCode(KbName('escape'))
        Stop = 1;
        break;
    end
    %% update data
    T_i = T_trial(index,:);
    [ghostNumber, up, down, left, right] = getFrameFromCSV(T_i);
    %% draw information
    draw_el(T_i); % draw eyelink point
    drawMonkeyMove(up,right,down,left); % draw monkey move
    draw_text(file_name); % draw trial name
    %% draw one frame image and flip
    draw_frame(ghostNumber);
    %% save image
    saveImage(fname, num_j);
    num_j = num_j + 1;
end
%% create MP4
createMP4(fname, vedioName, vedioWidth, vedioHeight);
end