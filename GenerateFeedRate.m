%%% This function generates the feed rate data according to 
% cell parameters, no. of cells and no. of layers
% by incrementing the extrusion co-rdinate (E) through constant value 
% nExtr => no of extrusion moves %%%

function [E,E0,nExtr] = GenerateFeedRate(nelem,nLayer,LCell,Linclined,dldeRed,dldeGreen,dldeBlue)

nExtr = nelem;
E=[];
for j=1:nLayer
    if j==1
        E0(j)=0.5;
    else
        E0(j)=0.5+E((j-1)*nExtr);
    end
    for i=1:nExtr
        if i==1
            E((j-1)*nExtr+i)=E0(j)+LCell/dldeBlue;
        elseif i>=2 && i<=25
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeBlue;
        elseif i==26
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeRed;
        elseif i==27 || i==28 || i==29
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeGreen;
        elseif i==30
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeRed;
        elseif i>=31 && i<=35
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeRed;
        elseif i==36
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeBlue;
        elseif i==37
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeGreen;
        elseif i>=38 && i<=43
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeRed;
        elseif i==44
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeGreen;
        elseif i==45 || i==46
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeBlue;
        elseif i==47
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeGreen;
        elseif i>=48 && i<=53
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeRed;
        elseif i==54
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeGreen;
        elseif i==55
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeBlue;
        elseif i>=56 && i<=60
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+LCell/dldeRed;
        elseif i>=61 && i<=70
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==71
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==72
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==73
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeGreen;
        elseif i==74
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==75 || i==76
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeGreen;
        elseif i==77
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==78
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeGreen;
        elseif i==79
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==80
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==81
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==82
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==83
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==84
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==85 || i==86
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeGreen;
        elseif i==87
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==88
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==89
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==90
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeRed;
        elseif i==91
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==92
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeGreen;
        elseif i>=93 && i<=98
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        elseif i==99
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeGreen;
        elseif i>=100 && i<=160
            E((j-1)*nExtr+i)=E((j-1)*nExtr+i-1)+Linclined/dldeBlue;
        end
    end
end

E=E';
end