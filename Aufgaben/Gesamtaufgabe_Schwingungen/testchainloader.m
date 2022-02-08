function [m, c, y] = testchainloader(filename)
%Testfunktion, nicht ernst nehmen
% clc; 

fid = fopen(filename + ".chain", "r");

fgetl(fid)
fgetl(fid)
fgetl(fid)
fgetl(fid)
fgetl(fid)
fgetl(fid)
fgetl(fid)
fgetl(fid)
fgetl(fid)

fclose(fid);