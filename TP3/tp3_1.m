%% TP3 TSA: Filtrage adapté
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 1. Détection d'un motif par filtrage adapté

% Définition des paramètres
Te = 10e-3;
tmin = -2;
tmax = 10;
t = tmin:Te:tmax;
N = length(t);
T = 1;
sig = 0.5;  % écart-type du bruit
t0 = 2;

% Signal à reconnaître (motif ou "template") x
x = (1-t/T) .* ((t)>=0) .* ((t)<=T);
% Réponse impulsionnelle du filtre adapté causal
h = (1-(T-t)/T) .* ((T-t)>=0) .* ((T-t)<=T);

% Signal bruité
xdecal = (1-(t-t0)/T) .* ((t-t0)>=0) .* ((t-t0)<=T);
y = xdecal + randn(size(x))*sig;

% Sortie du filtre (avec la fonction filter)
z = filter(h, 1, y);
t2 = t + tmin;

% Maximum du signal
[zmax,nmax] = max(z);

% Affichage
figure;
subplot(4,1,1);
plot(t,x);
title('Signal (motif) x(t)');
xlabel('t (s)');
subplot(4,1,2);
plot(t,h);
title('Réponse impulsionnelle h(t) du filtre adapté (causal)');
xlabel('t (s)');
subplot(4,1,3);
plot(t,y);
xlabel('t (s)');
title(['Signal observé bruité y(t) ']);
subplot(4,1,4);
plot(t2,z,'b',t2(nmax),zmax,'r*');
title(['Sortie du filtre adapté : maximale à t = ' num2str(t2(nmax)) ' s']);
xlabel('t (s)');
text(t2(nmax)-3.2, zmax - 63, ['Le motif est donc noyé dans le ' ...
    'bruit à t0 = ' num2str(t2(nmax) - T) ' s'], 'Color', 'red');

%% Pratique sur des signaux inconnus

% 1. sig3-1

% Lecture des signaux enregistrés (fonction load).
load("sig3-1.mat");

% Sortie du filtre (avec filter)
z = filter(h, 1, y1);
t2 = t + tmin;

% Maximum du signal
[zmax,nmax] = max(z);

% Affichage
figure;
subplot(4,1,1);
plot(t,x);
title('Signal (template)');
xlabel('t (s)');
subplot(4,1,2);
plot(t,h);
title('Réponse impulsionnelle du filtre adapté (causal)');
xlabel('t (s)');
subplot(4,1,3);
plot(t,y1);
xlabel('t (s)');
title('Signal observé bruité ');
subplot(4,1,4);
plot(t2,z,'b',t2(nmax),zmax,'r*');
title(['Sortie du filtre adapté : maximale à t = ' num2str(t2(nmax))]);
xlabel('t (s)');
text(t2(nmax)-3.2, zmax - 55, ['Le motif est donc noyé dans le ' ...
    'bruit à t0 = ' num2str(t2(nmax) - T) ' s'], 'Color', 'red');

% 1. sig3-2

% Lecture des signaux enregistrés (fonction load).
load("sig3-2.mat");

% Sortie du filtre (avec filter)
z = filter(h, 1, y2);
t2 = t + tmin;

% Maximum du signal
[zmax,nmax] = max(z);

% Affichage
figure;
subplot(4,1,1);
plot(t,x);
title('Signal (template)');
xlabel('t (s)');
subplot(4,1,2);
plot(t,h);
title('Réponse impulsionnelle du filtre adapté (causal)');
xlabel('t (s)');
subplot(4,1,3);
plot(t,y2);
xlabel('t (s)');
title('Signal observé bruité ');
subplot(4,1,4);
plot(t2,z,'b',t2(nmax),zmax,'r*');
title(['Sortie du filtre adapté : maximale à t = ' num2str(t2(nmax))]);
xlabel('t (s)');
text(t2(nmax)-3.2, zmax - 86, ['Le motif est donc noyé dans le ' ...
    'bruit à t0 = ' num2str(t2(nmax) - T) ' s'], 'Color', 'red');

% 1. sig3-3

% Lecture des signaux enregistrés (fonction load).
load("sig3-3.mat");

% Sortie du filtre (avec filter)
z = filter(h, 1, y3);
t2 = t + tmin;

% Maximum du signal
[zmax,nmax] = max(z);

% Affichage
figure;
subplot(4,1,1);
plot(t,x);
title('Signal (template)');
xlabel('t (s)');
subplot(4,1,2);
plot(t,h);
title('Réponse impulsionnelle du filtre adapté (causal)');
xlabel('t (s)');
subplot(4,1,3);
plot(t,y3);
xlabel('t (s)');
title('Signal observé bruité ');
subplot(4,1,4);
plot(t2,z,'b',t2(nmax),zmax,'r*');
title(['Sortie du filtre adapté : maximale à t = ' num2str(t2(nmax))]);
xlabel('t (s)');