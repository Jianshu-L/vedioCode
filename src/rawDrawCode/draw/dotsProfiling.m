function [dots,sizes,colors,n]=dotsProfiling(numRows,numCols,Map,tileSize, ...
    mx, my,pelletSize,energizerSize,scale)

dotsIndex = find(Map == '.');
if isempty(dotsIndex)
    dotsPosX = [];
    dotsPosY = [];
else
    dotsPos = ItoP(dotsIndex);
    dotsPosX = (dotsPos(1,:)-1)*tileSize+mx;
    dotsPosY = (dotsPos(2,:)-1)*tileSize+my;
end
enersIndex = find(Map == 'o');
if isempty(enersIndex)
    enersPosX = [];
    enersPosY = [];
else
    enersPos = ItoP(enersIndex);
    enersPosX = (enersPos(1,:)-1)*tileSize+0.5*scale+mx;
    enersPosY = (enersPos(2,:)-1)*tileSize+0.5*scale+my;
end
n = length(dotsIndex)+length(enersIndex);
dots = [[dotsPosX,enersPosX];[dotsPosY,enersPosY]];
dotsSize = repmat(pelletSize,1,length(dotsIndex));
enersSize = repmat(20,1,length(enersIndex));
sizes = [dotsSize,enersSize];
dotsColor = repmat([1.0,184.0/255,174.0/255],length(dotsIndex),1)';
enersColor = repmat([1.0,184.0/255,174.0/255],length(enersIndex),1)';
colors = [dotsColor,enersColor];
end

function Pos = ItoP(Index)
Size = size(Index);
if Size(1) > 1 && Size(2) == 1
    Index = Index';
end
pos_x= rem(Index,28);
if pos_x ==0
    pos_x =28;
    pos_y = fix(Index/28);
else
    pos_y = fix(Index/28)+1;
end
Pos = [pos_x;pos_y];
end
