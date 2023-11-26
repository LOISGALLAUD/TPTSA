% TP 2. Traitement des signaux aléatoires
% Détection d'un signal périodique bruité (de période inconnue) par intercorrélation
% avec un signal auxiliaire de même période
% Vincent.Mazet@unistra.fr, 2011, modifié F. Heitz 2015

clear all;
close all;

%% Tests sur les signaux donnés

a = 1;
f0 = 18;
Te = 10e-3;

f1 = 1:0.1:30;
t = 0:Te:1;
I = length(f1);
Ryz = zeros(I,1);

% Fréquence du signal sig2-1.mat
load('sig2-1.mat');
figure;
plot(t,y,'b');
title(['Signal sig2-1.mat']);
xlabel('t (s)');
for i = 1:I,
    z = sin(2*pi*f1(i)*t);
    [c,lags] = xcorr(y,z);
    cmax = max(c);
    Ryz(i) = cmax;
end;
figure;
plot(f1,Ryz,'b-');
[~,imax] = max(Ryz);
title(['sig2-1.mat : f0 = ' num2str(f1(imax)) ' Hz']);
xlabel('f (Hz)');
ylabel('Intercorrélations max');

% Fréquence du signal sig2-2.mat
load('sig2-2.mat');
figure;
plot(t,y,'b');
title(['Signal sig2-2.mat']);
xlabel('t (s)');
for i = 1:I,
    z = sin(2*pi*f1(i)*t);
    [c,lags] = xcorr(y,z);
    cmax = max(c);
    Ryz(i) = cmax;
end;
figure;
plot(f1,Ryz,'b-');
[~,imax] = max(Ryz);
title(['sig2-2.mat : f0 = ' num2str(f1(imax)) ' Hz']);
xlabel('f (Hz)');
ylabel('Intercorrélations max');

% Fréquence du signal sig2-3.mat
load('sig2-3.mat');
figure;
plot(t,y,'b');
title(['Signal sig2-3.mat']);
xlabel('t (s)');
for i = 1:I,
    z = sin(2*pi*f1(i)*t);
    [c,lags] = xcorr(y,z);
    cmax = max(c);
    Ryz(i) = cmax;
end;
figure;
plot(f1,Ryz,'b-');
[~,imax] = max(Ryz);
title(['sig2-3.mat : f0 = ' num2str(f1(imax)) ' Hz']);
xlabel('f (Hz)');
ylabel('Intercorrélations max');