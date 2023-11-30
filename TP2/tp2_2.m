%% TP2 TSA: détection de signaux noyés dans du bruit
% Loïs Gallaud 2A géné
clear; clc;
close all;
%% 2- Cas d'un signal périodique bruité de fréquence inconnue
%% Signal de période inconnue

% Paramètres du signal
a = 1;
f0 = 10; % supposée inconnue
Te = 1e-3;
t = 0:Te:1;
phi = pi;
x = a * sin(2*pi*f0.*t + phi);

% Bruit
rsb = 0; % A faire varier
sig = sqrt(a^2/2 * power(10, -rsb/10)); % écart-type du bruit
b = sig * randn(size(x)); % vecteur de bruit de même taille que x

% Signal bruité
y = x + b;
figure;
plot(t, y, 'b', t, x, 'r');
title(['Signal de fréquence supposée inconnue (f0 = ' num2str(f0) ' Hz,' ...
    ' RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)', 'x(t)');

% Analyse de l'intercorrélation pour estimer la fréquence du signal
frequencies = 1:0.1:30;
maxCorrelations = zeros(length(frequencies), 1);
figure;
plot(t,y,'b',t,x,'r');
title(['Signal de fr?quence suppos?e inconnue (f0 = ' num2str(f0) ' Hz,' ...
    ' RSB = ' num2str(rsb) ' dB)']);
xlabel('t (s)');
legend('y(t)','x(t)');



%% Intercorrélation avec une sinusoïde avec f1 variant de 1 é 30 Hz
% Code écrit par Vincent Mazet TPS

% Figure
h = figure;
ss = get(0,'ScreenSize');
fp = get(h,'Position');
set(h,'Position',[fp(1) 50 fp(3) ss(4)-150]);
twait = annotation('textbox',[0 0 1 1],...
    'String',['Pour lancer le balayage en fréquence :' ...
    ' appuyez sur une touche'],...
    'FontSize',14,...
    'HorizontalAlignment','center',...
    'VerticalAlignment','middle',...
    'LineStyle','none');
pause;
delete(twait)


% Parcours des fréquences de 1 é 30 Hz  par pas de 0.1 Hz
f1 = 1:0.1:30;
I = length(f1);
Ryz = zeros(I,1);
for i = 1:I,
    z = sin(2*pi*f1(i)*t);
    [c,lags] = xcorr(y,z,'biased');
    [cmax,imax] = max(c);
    Ryz(i) = cmax;
   
    figure(h);
    % z
    subplot(4,1,1);
    plot(t,z,'r');
    title(['Signal auxiliaire z(t) de fréquence f1 = ' ...
        num2str(f1(i)) ' Hz ']);
    xlabel('t (s)');
    ylabel('z(t)');
     % y et z(t-taumax)
    taumax=lags(imax)*Te;
    zdecal=sin(2*pi*f1(i)*(t-taumax));
   
    subplot(4,1,2);      
        plot(t,y,'b',t,zdecal,'r');
        title(['Signal y(t) de fréquence inconnue (en bleu)' ...
            ' et z(t-taumax)(en rouge) avec taumax=' ...
            num2str(taumax*1e3) ' ms']);
        xlabel('t (s)');
        legend('y(t)','z(t-taumax)');
    % Intercorrélation Ryz(tau)
    lags = lags*Te ; 
    subplot(4,1,3);
    plot( lags,c,'b-' , lags(imax),cmax,'r*' );
    title(['Intercorrélation Ryz(tau)']);
    axis([lags(1) lags(end) -0.7 0.7]);
    xlabel('tau (s)');
    ylabel(['Ryz (f1 = ' num2str(f1(i)) ' Hz)']);
    % Valeurs maximales de l'intercorrélation en fonction de f1
    subplot(4,1,4);
    plot( f1(1:i),Ryz(1:i),'b-' , f1(i),Ryz(i),'r*' );
    title(['Intercorrélation Ryz max en fonction de f1']);
    axis([f1(1) f1(end) 0 1.0]);
    xlabel('f1 (Hz)');
    ylabel('Ryz max.');
   
    pause(0.02 + 1.5*exp(-i/20));
end;



%% Recherche du max des max de l'intercorrélation 
% pour les fréquences de 1 é 30 Hz
% Affichage de la solution 

[~,imax] = max(Ryz);

% Représentation de l'intercorrélation maximale

% Sinuso?de z de fréquence f1(imax)
    z = sin(2*pi*f1(imax)*t);
    
    % Intercorrélation Ryz
    [c,lags] = xcorr(y,z,'biased');
    
    % Recherche de la valeur max de l'intercorrélation Ryz   
    [cmax,jmax] = max(c);
    
    figure(3);
    % z
    subplot(4,1,1);
    plot(t,z,'r');
    title(['Signal auxiliaire z(t) de fr?quence f1 = ' num2str(f1(imax)) ' Hz ']);
    xlabel('t (s)');
    ylabel('z(t)');
    % y et z(t-taumax)
    taumax=lags(jmax)*Te;
    zdecal=sin(2*pi*f1(imax)*(t-taumax));
    subplot(4,1,2);      
        plot(t,y,'b',t,zdecal,'r');
        title(['Signal y(t) de fr?quence inconnue (en bleu) et z(t-taumax)(en rouge) avec taumax=' num2str(taumax*1e3) ' ms']);
        xlabel('t (s)');
        legend('y(t)','z(t-taumax)');
    % Intercorrélation Ryz(tau)
    subplot(4,1,3);
    lags = lags*Te ; 
    plot( lags,c,'b-' , lags(jmax),cmax,'r*' );
    title(['Intercorr?lation maximale Ryz(tau) (pour f1=f0) ']);
    axis([lags(1) lags(end) -0.7 0.7]);
    xlabel('t (s)');
    ylabel(['Ryz (f1 = ' num2str(f1(imax)) ' Hz)']);
    % Valeurs maximales de l'intercorrélation en fonction de f1
    subplot(4,1,4);
    plot( f1(1:i),Ryz(1:i),'b-' , f1(imax),Ryz(imax),'r*' );
    title(['Intercorr?lation Ryz max en fonction de f1']);
    axis([f1(1) f1(end) 0 0.7]);
    xlabel('f1 (Hz)');
    ylabel('Ryz max.');
    twait = annotation('textbox',[0 0 1 .1],...
    'String',['fr?quence f0 estim?e pour le signal inconnu = ' num2str(f1(imax)) ' Hz'],...
    'FontSize',16,...
    'HorizontalAlignment','center',...
    'VerticalAlignment','middle',...
    'LineStyle','none');

