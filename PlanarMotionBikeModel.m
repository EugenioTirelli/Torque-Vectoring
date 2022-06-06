%% Bike model con modello gomma tramite funzione
clear all
A = 1.446;
B = 1.408;
T = 2.1/2;
M = 2200;
JZZPRIME = 1550;
g = 9.81;
RWHEEL = 0.3;
JWHEEL = 2.025;
% ALPHAP = 15;
% SIGP   = 1;
% MUP = 0.9;

MU0 = 0.015;
MU1 = 7e-6;
CWHEEL = 0.15;
KTL = 90000;
KR = 4e8;
KTV = 110000;

v0 = 5;
ometa0 = v0/RWHEEL;

%% Roll Motion parameters Double-Wishbone
JXX_PRIME = 62.834;
HGC = 0.1;
KSPRING = 5000;
H = 0.4; 
BETA = 40;
D = 0.4;
E = 1;
F = 0.3;
GAMMA = 75;
CDAMPING = 4000;
HG = 0.53;
