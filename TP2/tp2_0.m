% TP 2. Traitement des signaux aléatoires
% Détection d'un signal périodique bruité par intercorrélation
% avec un signal auxiliaire de même période
% Vincent.Mazet@unistra.fr, 2011, modifié F. Heitz 2015, modifie C.
% Meillier 2018

clear all;
close all;


%% Signal de période inconnue

a = ###;
f0 = ###;
Te = ###;
t = ###;
phi= ###;
x = ###;

% Génération du bruit
rsb = ###; % A faire varier
sig = ###  % écart-type du bruit
b = ###  % vecteur de bruit de même taille que x

% Génération du signal bruité
y = ###;
figure;
plot(t,y,'b',t,x,'r');
title(['Signal de fréquence (f0 = ' num2str(f0) ' Hz, RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)','x(t)');

