% TP 6. Traitement des signaux aléatoires
% Création des signaux tp41, tp42, tp43, tp44, tp45, tp46
% vincent.mazet@unistra.fr, août 2011

clear all;
close all;

% Signal de période inconnue
Te = 10e-3;
t = 0:Te:1;

% sig6-1 : f0 = 8,85 Hz, RSB = 10 dB, phase = 0
f0 = 8.85;
rsb = 10;
a = 0.2;
sig = a / sqrt(2) * 10^(-rsb/20);
phi = 0;
x = 1*sin(2*pi*f0*t+phi);
y = x + randn(size(x)) * sig;
save('sig6-1.mat','y');

% sig6-2 : f0 = 16,4 Hz, RSB = 0 dB, phase = 2*pi/3
f0 = 16.4;
rsb = 0;
a = 5;
phi = 2*pi/3;
sig = a / sqrt(2) * 10^(-rsb/20);
x = a*sin(2*pi*f0*t+phi);
y = x + randn(size(x)) * sig;
save('sig6-2.mat','y');

% sig6-3 : f0 = 6 et 12 Hz, RSB = 5 dB, phases = 0 et pi/3
rsb = 5;
a = 2;
sig = a / sqrt(2) * 10^(-rsb/20);
f0 = 6;     phi = 0;    x =     a*sin(2*pi*f0*t+phi);
f0 = 12;    phi = pi/3; x = x + a*sin(2*pi*f0*t+phi);
y = x + randn(size(x)) * sig;
save('sig6-3.mat','y');
