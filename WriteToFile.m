%%% This function generates the G-code file according to the nodal path 
% and feed rate data %%%

function WriteToFile(NPh,NPv,NPzigzag,nx,ny,E,E0,nExtr,nLayer)

fileID = fopen('General2DFrameSO.gcode','wt');       

% Initial house-keeping commands
fprintf(fileID,strcat(';FLAVOR:Marlin','\n',';TIME:6','\n',';Layer height: 2','\n',';MINX:10','\n',';MINY:0', ...
    '\n',';MINZ:2','\n',';MAXX:240','\n',';MAXY:230','\n',';MAXZ:2','\n','T1','\n','M140 S70','\n','M105','\n','M190 S70','\n','M105','\n','M82 ;absolute extrusion mode', ...
    '\n','G21 ;metric values','\n','M107','\n','G28','\n','M420 S1','\n','G90 ;absolute positioning','\n','G92 E0; reset extruder distance', ...
    '\n','G1 X0 Y0 Z10 F5000 ;move nozzle up 10mm for safe homing','\n','M500','\n','M82 ;set extruder to absolute mode', ...
    '\n','M107 ;start with the fan off','\n','G92 E0 ;zero the extruded length','\n','M117 Printing...','\n','G92 E0','\n','G92 E0' ...
    ,'\n',';LAYER_COUNT:1','\n',';LAYER:0','\n','M107','\n','\n','\n','\n','\n')); 
        
        for i=1:nLayer
            fprintf(fileID,strcat(';Layer',num2str(i), ...
                ' Z',num2str(2*i),'\n'));
            k=(i-1)*nExtr+1;
            fprintf(fileID,strcat('G0',' F3600', ...
                        ' X',num2str(20), ...
                        ' Y',num2str(50), ...
                        ' Z',num2str(2*(i)),'\n'));
            for j=1:size(NPh,1)
                if j==1
                    fprintf(fileID,strcat('G1',' F420', ...
                        ' X',num2str(nx(NPh(j))), ...
                        ' Y',num2str(ny(NPh(j))), ...
                        ' E',num2str(E0(i)),'\n')); 
                elseif j==7 || j==13 || j==19 || j==25 || j==31
                    fprintf(fileID,strcat('G0',' F3600', ...
                        ' X',num2str(nx(NPh(j))), ...
                        ' Y',num2str(ny(NPh(j))),'\n')); 
                else
                    fprintf(fileID,strcat('G1',' F420', ...
                        ' X',num2str(nx(NPh(j))), ...
                        ' Y',num2str(ny(NPh(j))), ...
                        ' E',num2str(E(k)),'\n')); k=k+1;
                end
            end

            for j=1:size(NPv,1)
                if j==1 || j==7 || j==13 || j==19 || j==25 
                    fprintf(fileID,strcat('G0',' F3600', ...
                        ' X',num2str(nx(NPv(j))), ...
                        ' Y',num2str(ny(NPv(j))),'\n')); 
                else
                    fprintf(fileID,strcat('G1',' F420', ...
                        ' X',num2str(nx(NPv(j))), ...
                        ' Y',num2str(ny(NPv(j))), ...
                        ' E',num2str(E(k)),'\n')); k=k+1;
                end
            end 

            for j=1:size(NPzigzag,1)
                if j==1 || j==12 || j==33 || j==54 || j==75 || j==96
                    fprintf(fileID,strcat('G0',' F3600', ...
                        ' X',num2str(nx(NPzigzag(j))), ...
                        ' Y',num2str(ny(NPzigzag(j))),'\n')); 
                else
                    fprintf(fileID,strcat('G1',' F420', ...
                        ' X',num2str(nx(NPzigzag(j))), ...
                        ' Y',num2str(ny(NPzigzag(j))), ...
                        ' E',num2str(E(k)),'\n')); k=k+1;
                end
            end 
            
            if i<nLayer % inter - layer drying time
                fprintf(fileID,strcat('\n','\n','\n','\n', ...
                    ';Interlayer time gap','\n','G0',' F3600', ...
                    ' X',num2str(nx(NPh(1))), ...
                    ' Y',num2str(ny(NPh(1))), ...
                    ' Z',num2str(2*(i+1)),'\n', ...
                    'G91','\n','G1',' Z200','\n','G4',' S300','\n', ...
                    'G1',' Z-200','\n','G90','\n','\n','\n','\n','\n'));
            end
        end
  

% Final house-keeping commands
fprintf(fileID,strcat('\n','\n','\n','\n','\n',';End GCode','\n','M140 S0 ;heated bed heater off (if you have it)', ...
    '\n','G91 ;relative positioning','\n','G28;move X/Y to min endstops, so the head is out of the way','\n','M84 ;steppers off', ...
    '\n','M107','\n','G90 ;absolute positioning','\n','M82 ;absolute extrusion mode','\n',';End of Gcode'));

fclose(fileID);

% Open G-code file using Ultimaker Cura
winopen('General2DFrameSO.gcode'); 

end