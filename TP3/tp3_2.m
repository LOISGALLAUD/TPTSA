%% TP3 TSA: Filtrage adapté
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 2. Application à la détection de la raie d émission Lyα de l hydrogène
% dans le spectre d’une galaxie lointaine

% Importation des données
load('HDFS_MUSE.mat', 'cube');

% Définition des paramètres
lambda_min = 475;
lambda_max = 930;
lambda_step = 0.125;
lambda = lambda_min:lambda_step:lambda_max;

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
inter = xcorr(spectre_10_10, spectre_2_2, 'biased');

% Tracé de l'autocorrélation
% figure;
% subplot(3, 1, 1);
% plot(lags, autocorr_2_2);
% title('Autocorrélation - Pixel (2, 2)');
% xlabel('Décalage');
% ylabel('Corrélation');
%
% subplot(3, 1, 2);
% plot(lags, autocorr_10_10);
% title('Autocorrélation - Pixel (10, 10)');
% xlabel('Décalage');
% ylabel('Corrélation');
%
% subplot(3, 1, 3);
% plot(lags, inter);
% title('Intercorrélation - Pixel (10, 10) et Pixel (2, 2)');
% xlabel('Décalage');
% ylabel('Corrélation');

%% 3. Détection de la raie Lya
% Spectre du centre de la galaxie
load('raie_lya.mat', 'raie_lya');
spectre_centre = squeeze(cube(9, 8, :));
x = zeros(size(spectre_centre));
figure;
plot(x);

% Tracé du spectre du centre de la galaxie
filtre_adapte = raie_lya(end:-1:1);

% Sortie du filtre (avec la fonction filter)
z = filter(filtre_adapte, 1, spectre_centre);

% Maximum du signal
[zmax,nmax] = max(z);

% Affichage
figure;
subplot(4,1,1);
raye_cool = [zeros(1, nmax) raie_lya zeros(1, 3641-length(raie_lya)-nmax)]
plot(raye_cool);
title('Signal de la raie Lya');
xlabel('lambda (nm)');
subplot(4,1,2);
plot(filtre_adapte);
title('Réponse impulsionnelle h(t) du filtre adapté (causal)');
xlabel('lambda (nm)');
subplot(4,1,3);
plot(lambda, spectre_centre);
xlabel('lambda (nm)');
title('Spectre centre de la galaxie');
subplot(4,1,4);
plot(lambda, z, 'b',lambda(nmax), zmax,'r*');
title(['Sortie du filtre adapté : maximale à lambda = ' ...
    num2str(lambda(nmax)) ' nm']);
xlabel('lambda (nm)');
text(lambda(nmax), zmax-30, ['lambda0 = ' num2str(lambda(nmax)) ...
    ' nm'], 'Color', 'red');
