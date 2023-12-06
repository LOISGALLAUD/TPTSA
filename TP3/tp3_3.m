%% TP3 TSA: Filtrage adapté
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 4. Débruitage du spectre de la galaxie

% Définition des paramètres
lambda_min = 475;
lambda_max = 930;
lambda_step = 0.125;
lambda = lambda_min:lambda_step:lambda_max;

% Importation des données
load('HDFS_MUSE.mat', 'cube');
load('raie_lya.mat', 'raie_lya');

galaxie = squeeze(cube(7:10, 7:9, :));
spectre = mean(galaxie, [1 2]);
spectre_moyen = squeeze(spectre(1, 1, :));
figure;
plot(lambda, spectre_moyen);
title('Spectre moyen de la galaxie');
xlabel('lambda (nm)');


% Tracé du spectre du centre de la galaxie
filtre_adapte = raie_lya(end:-1:1);

% Sortie du filtre (avec la fonction filter)
z = filter(filtre_adapte, 1, spectre_moyen);

% Maximum du signal
[zmax,nmax] = max(z);

% Affichage
figure;
subplot(4,1,1);
plot(raie_lya);
title('Signal de la raie Lya');
xlabel('lambda (nm)');
subplot(4,1,2);
plot(filtre_adapte);
title('Réponse impulsionnelle h(t) du filtre adapté (causal)');
xlabel('lambda (nm)');
subplot(4,1,3);
plot(lambda, spectre_moyen);
xlabel('lambda (nm)');
title('Spectre moyen de la galaxie');
subplot(4,1,4);
plot(lambda, z, 'b',lambda(nmax), zmax,'r*');
title(['Sortie du filtre adapté : maximale à lambda = ' ...
    num2str(lambda(nmax)) ' nm']);
xlabel('lambda (nm)');
text(lambda(nmax), zmax-10, ['lambda0 = ' num2str(lambda(nmax)) ...
    ' nm'], 'Color', 'red');

% Calcul du RSB