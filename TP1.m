%% TP1 TSA: signaux aléatoires sinusoïdaux et bruits
% Loïs Gallaud 2A géné
clear; clc;
%% 1 - Simulation de réalisations de signaux aléatoires

% Définition des constantes
Fe = 1e3;
Te = 1 / Fe;
F0 = 4;
a = 1;
phi = 0;
N = 1e3; % Nombre d'échantillons

% Discrétisation du temps
t = (0:(N-1))*Te;

% 1. Sinusoïde d'amplitude aléatoire
A = 1 + rand * (4-1); % proba uniforme entre [1, 4]
X_amp_alea = A * cos(2*pi*F0 .* t + phi);
% hold on;
% plot(t, X_amp_alea);

% 2. Sinusoïde de fréquence aléatoire
F =  1 + rand * (10-1);% proba uniforme entre [1, 10]
X_freq_alea = a * cos(2*pi*F .* t + phi);
% hold on;
% plot(t, X_freq_alea);

% 3. Sinusoïde à phase aléatoire
PHI = rand * 2*pi; % proba uniforme entre [0, 2*pi]
X_phase_alea = a * cos(2*pi*F0 .* t + PHI);
% hold on;
% plot(t, X_phase_alea);

%% 2 - Etude de la sinusoïde à phase aléatoire
% Un signal de 1000 échantillons sur l'intervalle de temps [0, 1]s a une
% période d'échantillonnage Te = 1/(N-1) (ou Fe = N-1)

% 1. 1e4 réalisations du signal à phase aléatoire
n = 1e4; % Nombre de réalisations
PHI_matrix = rand(n, 1) * 2*pi; % Matrice avec des phases aléatoires
X_phase_alea_matrix = a * cos(2*pi*F0 .* t + PHI_matrix);
% plot(t, X_phase_alea_matrix);
size(X_phase_alea_matrix); % Taille n x N

% Construction de l'histogramme à un instant t revient à prendre les
% valeurs à une colonne donnée du tableau
bins = 50;
column_index = 800;
% histogram(X_phase_alea_matrix(:, column_index), bins, ...
%     'Normalization', 'pdf');
% hold on;

% Calcul de la densité théorique pour chaque valeur
x_values = linspace(-a, a, N); % Valeurs de x pour la densité théorique
theoretical_density = (1/pi) * (1 ./ sqrt(a^2 - x_values.^2));
% plot(x_values, theoretical_density, 'r');
% xlabel('Valeurs de X');
% ylabel('Densité de probabilité');
% legend('Histogramme', "Densité théorique");

% 2. 3. Fonction d'autocorrelation
% Sélection d'une réalisation du signal (La 1ère, par exemple)
signal_realisation = X_phase_alea_matrix(1, :);

% Estimation de la fonction d'autocorrélation temporelle
[autocorrelation_estimation, lags] = xcorr(signal_realisation, ...
    'unbiased');

% Création du vecteur de temps correspondant à l'autocorrélation estimée
time_lags = (0:length(autocorrelation_estimation)-1) * Te;

% Calcul de l'autocorrélation théorique pour un signal sinusoïdal
theoretical_autocorrelation = a^2/2 * cos(2*pi*F0*time_lags);

% Tracé de l'autocorrélation estimée et théorique
% plot(time_lags, autocorrelation_estimation, 'b');
% hold on;
% plot(time_lags, theoretical_autocorrelation, 'r');
% xlabel('Décalage temporel (s)');
% ylabel('Autocorrélation');
% legend('Estimation', 'Théorie');
% title('Autocorrélation estimée vs théorique');

%% 3 - Etude du bruit blanc

% Définitions des constantes
N = 1e3;
n = 1e4;
variance = 4;

% 0. Génération du bruit blanc haussien centré discret
bruit_blanc = sqrt(variance) * randn(n, N);
size(bruit_blanc);

% 1. Histogramme des valeurs du bruit au point d'échantillonnage 3
column_index = 3;
bins = 50;
% histogram(X_phase_alea_matrix(:, column_index), bins, ...
%     'Normalization', 'pdf');
% hold on;

% Calcul de la densité théorique pour chaque valeur
x_values = linspace(-a, a, N); % Valeurs de x pour la densité théorique
theoretical_density = (1/pi) * (1 ./ sqrt(a^2 - x_values.^2));
% plot(x_values, theoretical_density, 'r');
% xlabel('Valeurs de X');
% ylabel('Densité de probabilité');
% legend('Histogramme', "Densité théorique");

% 2. Estimation des moyennes statistique et temporelle du bruit blanc
moyenne_statistique_theorique = 0;
moyenne_temporelle_theorique = mean(bruit_blanc(:));

% 3. Expression théorique de l'autocorrélation statistique et
% temporelle du bruit
autocorrelation_statistique_theorique = zeros(1, 2*N-1);
autocorrelation_temporelle_theorique = variance * ones(1, 2*N-1);

% Estimation de l'autocorrélation empirique du bruit
autocorrelation_biaisee = xcorr(bruit_blanc(1, :), 'biased');
autocorrelation_non_biaisee = xcorr(bruit_blanc(1, :), 'unbiased');
% La version biaisée inclut tous les échantillons disponibles,
% tandis que la version non biaisée normalise l'autocorrélation par le
% nombre d'échantillons moins la valeur absolue du décalage temporel.
% L'hypothèse d'ergodicité est cruciale pour l'interprétation
% des résultats.

% Tracé de l'autocorrélation estimée et théorique
% figure;
% subplot(2, 1, 1);
% plot(autocorrelation_biaisee);
% hold on;
% plot(autocorrelation_statistique_theorique, 'r--');
% title('Autocorrélation biaisée du bruit blanc');
% legend('Estimation', 'Théorie');
%
% subplot(2, 1, 2);
% plot(autocorrelation_non_biaisee);
% hold on;
% plot(autocorrelation_temporelle_theorique, 'r--');
% title('Autocorrélation non biaisée du bruit blanc');
% legend('Estimation', 'Théorie');