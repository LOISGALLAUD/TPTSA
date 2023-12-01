%% TP3 TSA: Filtrage adapté
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 2. Application à la détection de la raie d émission Lyα de l hydrogène
% dans le spectre d’une galaxie lointaine

% Importation des données
load('HDFS_MUSE.mat', 'cube');
load('raie_lya.mat', 'raie_lya');

% Définition des paramètres
lambda_min = 475e-9;
lambda_max = 930e-9;
lambda_step = (lambda_max - lambda_min) / 3640;
lambda = linspace(lambda_min, lambda_max, 3641);

% Extraction des spectres des pixels (2, 2) et (10, 10)
spectre_2_2 = squeeze(cube(2, 2, :));
spectre_10_10 = squeeze(cube(10, 10, :));

lags = -(length(spectre_2_2)-1):(length(spectre_2_2)-1);

% Affichage des spectres
% figure;
% plot(lambda, spectre_2_2);
% hold on;
% plot(lambda, spectre_10_10);
% xlabel('Longueur d onde');
% ylabel('Flux');
% legend('Pixel (2, 2)', 'Pixel (10, 10)');
% title('Spectre des pixels (2, 2) et (10, 10)');

% Calcul de l'autocorrélation des spectres
autocorr_2_2 = xcorr(spectre_2_2);
autocorr_10_10 = xcorr(spectre_10_10);

% Tracé de l'autocorrélation
% figure;
% subplot(2, 1, 1);
% plot(lags, autocorr_2_2);
% title('Autocorrélation - Pixel (2, 2)');
% xlabel('Décalage');
% ylabel('Corrélation');
%
% subplot(2, 1, 2);
% plot(lags, autocorr_10_10);
% title('Autocorrélation - Pixel (10, 10)');
% xlabel('Décalage');
% ylabel('Corrélation');

%% 3. Détection de la raie Lya
% Spectre du centre de la galaxie
spectre_centre = squeeze(cube(9, 8, :));
lags = -(length(spectre_centre)-1):(length(spectre_centre)-1);

% Tracé du spectre du centre de la galaxie
figure;
plot(lambda, spectre_centre);
xlabel('Longueur d onde');
ylabel('Flux');
title('Spectre du pixel (9, 8)');

autocorr_centre = xcorr(spectre_centre);
figure;
plot(lags, autocorr_centre);
title('Autocorrélation centre de la galaxie');
xlabel('Décalage');
ylabel('Corrélation');
