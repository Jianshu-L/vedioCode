function drawDayFromCSV(T, vedioWidth, vedioHeight)
Trials = unique(T.DayTrial);
for file_name = Trials'
    %% draw
    T_ = T(T.DayTrial == file_name,:);
    map = char(T_.Map(1)); %#ok<NASGU>
    init_gameVar;
    Stop = drawTrialFromCSV(T_, vedioWidth, vedioHeight);
    if Stop
        break
    end
end
end