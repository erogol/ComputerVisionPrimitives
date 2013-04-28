% This script executes all demos in this folder
% 
% AUTHOR: Nikolaos Sismanis
% CONTACT INFO: e-mail: nik_sism@hotmail.com nsismani@auth.gr

clear all
close all

random2Dpoints(4096, 4);

random2Dpoints(2000, 6);

random3Dpoints(4096, 4);


[accel_C] = comparePerformance2C(50000, 32, 64)

[accel_matlab] = comparePerformance2matlab(50000, 32, 64)

