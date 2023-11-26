%% Calcul d'autocorrélation d'un signal

% Paramètres du signal sinusoïdal
f0 = 1/2; % Fréquence en Hz
t = 0:0.01:10; % Temps de 0 à 10 secondes avec un pas de 0.01

% Construction du signal sinusoïdal
x = sin(2 * pi * f0 * t);

% Affichage du signal sinusoïdal
subplot(2, 1, 1);
plot(t, x);
title('Signal Sinusoïdal');
xlabel('Temps');
ylabel('Amplitude');

% Calcul de l'autocorrélation du signal
autocorr_x = xcorr(x);

% Temps pour l'autocorrélation
lags = -length(t)+1:length(t)-1;

% Affichage de l'autocorrélation
subplot(2, 1, 2);
plot(lags, autocorr_x);
title('Autocorrélation du Signal');
xlabel('Décalage temporel');
ylabel('Valeur d''autocorrélation');

