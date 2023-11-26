% TP 2. Traitement des signaux al�atoires
% D�tection d'un signal p�riodique bruit� par intercorr�lation
% avec un signal auxiliaire de m�me p�riode
% Vincent.Mazet@unistra.fr, 2011, modifi� F. Heitz 2015, modifie C.
% Meillier 2018

clear all;
close all;


%% Signal de p�riode inconnue

a = ###;
f0 = ###;
Te = ###;
t = ###;
phi= ###;
x = ###;

% G�n�ration du bruit
rsb = ###; % A faire varier
sig = ###  % �cart-type du bruit
b = ###  % vecteur de bruit de m�me taille que x

% G�n�ration du signal bruit�
y = ###;
figure;
plot(t,y,'b',t,x,'r');
title(['Signal de fr�quence (f0 = ' num2str(f0) ' Hz, RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)','x(t)');

