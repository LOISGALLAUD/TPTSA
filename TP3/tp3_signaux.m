% TP 7. Traitement des signaux aléatoires
% Création des signaux sig7-1, sig7-2, sig7-3
% vincent.mazet@unistra.fr, août 2011

clear all;
close all;

% Filtre adapté
Te = 10e-3;
tmin = -2;
tmax = 10;
t = tmin:Te:tmax;
N = length(t);
T = 1;

% Signal 7-1 : 1 motif, bruit faible
t0 = 4;
x = (1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
y1 = x + randn(size(x)) * 0.1;
save('sig3-1.mat','y1');

% Signal 7-2 : 1 motif, bruit fort
t0 = 0;
x = (1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
y2 = x + randn(size(x)) * 0.8;
save('sig3-2.mat','y2');

% Signal 7-3 : plusieurs motifs, bruit moyen
t0 = 5;      x =       (1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
t0 = 2;      x = x + 2*(1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
t0 = -1;     x = x + 3*(1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
t0 = -0.8;   x = x + 3*(1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
y3 = x + randn(size(x)) * 0.8;
save('sig3-3.mat','y3');