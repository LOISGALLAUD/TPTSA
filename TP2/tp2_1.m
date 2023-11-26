% TP 2. Traitement des signaux aléatoires
% Détection d'un signal périodique bruité par intercorrélation
% avec un signal auxiliaire de même période
% Vincent.Mazet@unistra.fr, 2011, modifié F. Heitz 2015, modifié C.Meillier
% 2018

clear all;
close all;


%% Signal de fréquence connue

a = ###;
f0 = ###;
Te = ###;
t = ###;
phi=###;
x = ###;

% Bruit
rsb = ###;
sig = ###;
b = ###;

% Signal bruité
y = ###;
figure;
plot(t,y,'b',t,x,'r');
title(['Signal de fréquence supposée connue (f0 = ' num2str(f0) ' Hz, RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)','x(t)');

pause(5);



%% Intercorrélation avec une sinusoïde de fréquence f1=f0

f1 = f0;

figure;

% Signal bruité y(t)

subplot(6,1,1);
plot(t,y);
title(['Signal bruité y(t), RSB = ' num2str(rsb) ' dB']);
axis([-inf inf -inf inf]);
xlabel('t (s)');
ylabel('y(t)');

% Sinusoïde z de fréquence f1
z = ###;

subplot(6,1,2);
plot(t,z,'r');
title(['Signal auxiliaire z(t) de fréquence f1=f0= ' num2str(f0) ' Hz ']);
xlabel('t (s)');
ylabel('z(t)');

%Intercorrélation Rbz
% Compléter les lignes suivantes
[c,lags] = ###
lags = ### % Retard en secondes ! 

subplot(6,1,3);
plot( lags,c,'b-');
title(['Intercorrélation Rbz(tau) : bruit seul (signal absent) - signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Rbz']);

%Intercorrélation Rxz
% Compléter les lignes suivantes
[c,lags] = ###
lags = ### % Retard en secondes ! 

subplot(6,1,4);
plot( lags,c,'b-');
title(['Intercorrélation Rxz(tau) : signal sans bruit-signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Rxz']);

% Intercorrélation Ryz
% Compléter les lignes suivantes
[c,lags] = ###
lags = ### % Retard en secondes ! 
[cmax,imax] = max(c);

subplot(6,1,5);
plot( lags,c,'b-',lags(imax),cmax,'r*');
title(['Intercorrélation Ryz(tau) : signal bruité-signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Ryz']);


%% Détermination du décalage taumax entre y(t) et z(t)
% Compléter la ligne suivante
taumax=###
% z(t-taumax)
zdecal=###;
% affichage y et z(t-taumax)
subplot(6,1,6);      
plot(t,y,'b',t,zdecal,'r');
title(['Signal y(t) de fréquence connue (en bleu) et z(t-taumax)(en rouge) avec taumax=' num2str(taumax*1e3) ' ms']);
axis([-inf inf -inf inf]);
xlabel('t (s)');
legend('y(t)','z(t-taumax)');
