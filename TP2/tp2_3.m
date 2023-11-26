% TP 2. Traitement des signaux al�atoires
% D�tection d'un signal p�riodique bruit� (de p�riode inconnue) par intercorr�lation
% avec un signal auxiliaire de m�me p�riode
% Vincent.Mazet@unistra.fr, 2011, modifi� F. Heitz 2015

clear all;
close all;

%% Tests sur les signaux donn�s

a = 1;
f0 = 18;
Te = 10e-3;

f1 = 1:0.1:30;
t = 0:Te:1;
I = length(f1);
Ryz = zeros(I,1);

% Fr�quence du signal sig2-1.mat
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
ylabel('Intercorr�lations max');

% Fr�quence du signal sig2-2.mat
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
ylabel('Intercorr�lations max');

% Fr�quence du signal sig2-3.mat
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
ylabel('Intercorr�lations max');