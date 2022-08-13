T = loadcsv("./data/xuda-13-Nov-2021-3.csv");
index = TtoI(T.pacMan_1, T.pacMan_2);
Map = char(T.Map(1,:));
floors = Map(index);
I = 1:length(floors);
floors = floors(T.pacMan_1>0 & T.pacMan_1<=28);
I = I(T.pacMan_1>0 & T.pacMan_1<=28);
bugI = I(floors == '|');
Tbug = T(bugI,:);
Tbug = T(T.DayTrial == unique(Tbug.DayTrial),:); 
save("T-18-Dec-2020-1.mat", "Tbug");