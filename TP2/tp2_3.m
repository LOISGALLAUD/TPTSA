%% TP2 TSA: détection de signaux noyés dans du bruit
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 3- Pratique: signaux bruités inconnus donnés
% Déterminer la fréquence du signal original

% Fréquences à tester
frequencies = 1:0.1:30;
numFrequencies = length(frequencies);

% Charger et analyser chaque fichier de signal
fileNames = {'sig2-1.mat', 'sig2-2.mat', 'sig2-3.mat'};

for fileIdx = 1:length(fileNames)
    % Charger le fichier
    load(fileNames{fileIdx}, 'y', 'Te', 'T_final');

    % Temps
    t = 0:Te:T_final;

    % Préparer les données pour les graphiques
    Ryz = zeros(numFrequencies, 1);

    % Calculer les intercorrelations pour chaque fréquence
    for i = 1:numFrequencies
        z = sin(2*pi*frequencies(i)*t);
        [c, ~] = xcorr(y, z, 'biased');
        Ryz(i) = max(c);
    end

    % Trouver la fréquence dominante
    [~, imax] = max(Ryz);
    dominantFrequency = frequencies(imax);

    % Afficher les résultats dans une seule figure avec deux subplots
    figure;

    % Subplot 1 : Signal temporel
    subplot(2, 1, 1);
    plot(t, y, 'b');
    title(['Signal ' fileNames{fileIdx}]);
    xlabel('t (s)');

    % Subplot 2 : Recherche de fréquence
    subplot(2, 1, 2);
    plot(frequencies, Ryz, 'b-');
    hold on;
    plot(dominantFrequency, Ryz(imax), 'ro');
    title(['Fréquence dominante : f0 = ' num2str(dominantFrequency) ' Hz']);
    xlabel('f (Hz)');
    ylabel('Intercorrélations max');
    legend('Intercorrélations', 'Fréquence dominante', 'Location', 'northwest');

    hold off;
end