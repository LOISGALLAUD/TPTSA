% TP 2. Traitement des signaux al�atoires
% D�tection d'un signal p�riodique bruit� par intercorr�lation
% avec un signal auxiliaire de m�me p�riode
% Vincent.Mazet@unistra.fr, 2011, modifi� F. Heitz 2015, modifi� C.Meillier
% 2018

clear all;
close all;


%% Signal de fr�quence connue

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

% Signal bruit�
y = ###;
figure;
plot(t,y,'b',t,x,'r');
title(['Signal de fr�quence suppos�e connue (f0 = ' num2str(f0) ' Hz, RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)','x(t)');

pause(5);



%% Intercorr�lation avec une sinuso�de de fr�quence f1=f0

f1 = f0;

figure;

% Signal bruit� y(t)

subplot(6,1,1);
plot(t,y);
title(['Signal bruit� y(t), RSB = ' num2str(rsb) ' dB']);
axis([-inf inf -inf inf]);
xlabel('t (s)');
ylabel('y(t)');

% Sinuso�de z de fr�quence f1
z = ###;

subplot(6,1,2);
plot(t,z,'r');
title(['Signal auxiliaire z(t) de fr�quence f1=f0= ' num2str(f0) ' Hz ']);
xlabel('t (s)');
ylabel('z(t)');

%Intercorr�lation Rbz
% Compl�ter les lignes suivantes
[c,lags] = ###
lags = ### % Retard en secondes ! 

subplot(6,1,3);
plot( lags,c,'b-');
title(['Intercorr�lation Rbz(tau) : bruit seul (signal absent) - signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Rbz']);

%Intercorr�lation Rxz
% Compl�ter les lignes suivantes
[c,lags] = ###
lags = ### % Retard en secondes ! 

subplot(6,1,4);
plot( lags,c,'b-');
title(['Intercorr�lation Rxz(tau) : signal sans bruit-signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Rxz']);

% Intercorr�lation Ryz
% Compl�ter les lignes suivantes
[c,lags] = ###
lags = ### % Retard en secondes ! 
[cmax,imax] = max(c);

subplot(6,1,5);
plot( lags,c,'b-',lags(imax),cmax,'r*');
title(['Intercorr�lation Ryz(tau) : signal bruit�-signal aux']);
axis([lags(1) lags(end) -0.7 0.7]);
xlabel('tau (s)');
ylabel(['Ryz']);


%% D�termination du d�calage taumax entre y(t) et z(t)
% Compl�ter la ligne suivante
taumax=###
% z(t-taumax)
zdecal=###;
% affichage y et z(t-taumax)
subplot(6,1,6);      
plot(t,y,'b',t,zdecal,'r');
title(['Signal y(t) de fr�quence connue (en bleu) et z(t-taumax)(en rouge) avec taumax=' num2str(taumax*1e3) ' ms']);
axis([-inf inf -inf inf]);
xlabel('t (s)');
legend('y(t)','z(t-taumax)');
