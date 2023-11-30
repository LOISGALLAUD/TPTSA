%% TP2 TSA: détection de signaux noyés dans du bruit
% Loïs Gallaud 2A géné
clear all;
close all;

%% Génération des signaux utilisés dans la partie III du TP2 TSA

% Signal de période inconnue
Te = 1e-4;
T_final = 1 ;
t = 0:Te:T_final;

% sig6-1 : f0 = 8,85 Hz, RSB = 10 dB, phase = 0
f0 = 8.85;
rsb = -20;
a = 0.2;
sig = a / sqrt(2) * 10^(-rsb/20);
phi = 0;
x = 1*sin(2*pi*f0*t+phi);
y = x + randn(size(x)) * sig;
save('sig2-1.mat','y', 'T_final', 'Te');

% sig6-2 : f0 = 16,4 Hz, RSB = 0 dB, phase = 2*pi/3
f0 = 16.4;
rsb = 0;
a = 5;
phi = 2*pi/3;
sig = a / sqrt(2) * 10^(-rsb/20);
x = a*sin(2*pi*f0*t+phi);
y = x + randn(size(x)) * sig;
save('sig2-2.mat','y', 'T_final', 'Te');

% sig6-3 : f0 = 6 et 12 Hz, RSB = 5 dB, phases = 0 et pi/3
rsb = 5;
a = 2;
sig = a / sqrt(2) * 10^(-rsb/20);
f0 = 6;     phi = 0;    x =     a*sin(2*pi*f0*t+phi);
f0 = 12;    phi = pi/3; x = x + a*sin(2*pi*f0*t+phi);
y = x + randn(size(x)) * sig;
save('sig2-3.mat','y', 'T_final', 'Te');
