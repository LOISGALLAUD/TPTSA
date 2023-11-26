% Génération de deux signaux aléatoires
signal1 = randn(1, 100); % Génère un signal aléatoire de taille 1x100
signal2 = randn(1, 100); % Génère un autre signal aléatoire de même taille

% Calcul de la corrélation entre les deux signaux
correlation = corrcoef(signal1, signal2);
disp(['Coefficient de corrélation : ', num2str(correlation(1,2))]);
% Les deux signaux sont indépendants, le coefficient de corrélation est
% proche de 0
