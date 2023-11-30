%% TP2 TSA: détection de signaux noyés dans du bruit
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 1 - Détection d'un signal périodique de période connue pas une 
% intercorrélation avec un signal auxiliaire

% Définition des constantes
a = 1;
f0 = 10;
Te = 1e-3;
phi= pi;

% Discrétisation du temps
t = 0:Te:1; % 1s échantillonnée avec un pas de Te secondes
size(t);
x = a * sin(2*pi*f0 .* t + phi);

% Génération du bruit
rsb = 0; % A faire varier
sig = sqrt(a^2/2 * power(10, -rsb/10));  % écart-type du bruit
b = sig * randn(size(x));  % vecteur de bruit de même taille que x

% 2. Génération du signal bruité
y = x + b;

figure;
subplot(6,1,1);
plot(t,y,'b');
title(['Signal de fréquence (f0 = ' num2str(f0) ' Hz, RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)','x(t)');

% 3. Détection d'un signal dans le bruit
f1 = f0;
z = a * sin(2*pi*f1 .* t); % signal de même fréquence que le signal bruité

subplot(6,1,2);
plot(t,z,'b',t,x,'r');
title(['Signal auxiliaire z(t) de fréquence f1=f0= ' num2str(f0) ' Hz ']);
xlabel('t (s)');
ylabel('z(t)');

% Intercorrélation Rbz: signal absent
[c, lags] = xcorr(b, z, "biased"); % Calcul de l'intercorrélation entre b et z
lags = lags * Te; % Conversion des décalages en secondes

subplot(6, 1, 3);
plot(lags, c, 'b-');
title(['Intercorrélation Rbz(\tau) : bruit seul (signal absent) - signal aux']);
xlabel('\tau (s)');
ylabel('Rbz');

% Intercorrélation Rxz: signal présent sans bruit
[c, lags] = xcorr(x, z, "biased"); % Calcul de l'intercorrélation entre x et z
lags = lags * Te; % Conversion des décalages en secondes

subplot(6, 1, 4);
plot(lags, c, 'b-');
title(['Intercorrélation Rxz(\tau) : signal sans bruit - signal aux']);
xlabel('\tau (s)');
ylabel('Rxz');

% Intercorrélation Ryz: signal présent dans le bruit
[c, lags] = xcorr(y, z, "biased"); % Calcul de l'intercorrélation entre y et z
lags = lags * Te; % Conversion des décalages en secondes
[cmax,imax] = max(c);

subplot(6,1,5);
plot( lags,c,'b-',lags(imax),cmax,'r*');
title(['Intercorrélation Ryz(tau) : signal bruité-signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Ryz']);


%% Détermination du décalage taumax entre y(t) et z(t)
taumax = lags(imax);
% z(t-taumax)
zdecal = a * sin(2*pi*f0 .* (t-taumax));
% affichage y et z(t-taumax)
subplot(6,1,6);      
plot(t,y,'b',t,zdecal,'r');
title(['Signal y(t) de fréquence connue (en bleu) et z(t-taumax)' ...
    '(en rouge) avec taumax=' num2str(taumax*1e3) ' ms']);

