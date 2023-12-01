# **TP Traitement des Signaux Aléatoires**

<!-- markdownlint-disable MD033 -->
<img src="image/readme/1700847690924.png" alt="1700847690924" width=150 align="right">

Ce répertoire contient les codes sources MATLAB des TPs de Traitement des Signaux Aléatoires au programme des 2ème année de Télécom Physique Strasbourg.
Consiste en l'analyse des signaux aléatoires sinusoïdaux et bruits.

<img src="image/readme/1700847794823.png" alt="1700847810842" width=70 align="right">

## **TP1: Signaux aléatoires sinusoïdaux et bruits**

|<img src="image/readme/1700764171543.png" alt="1700764171543" width=250>|<img src="image/readme/1700764229621.png" alt="1700764229621" width=250>|
|:---:|:---:|
|<img src="image/readme/1700764392931.png" alt="1700764392931" width=250>|<img src="image/readme/1700764427366.png" alt="1700764427366" width=250>|

Prise en main de la génération de signaux aléatoires sinusoïdaux.

|<img src="image/readme/1700764645138.png" alt="1700764645138" width=250>|<img src="image/readme/1700766897322.png" alt="1700766897322" width=250>|
|:---:|:---:|

<img src="image/readme/1700765245540.png" alt="1700765245540" width=500>
<img src="image/readme/1700768152722.png" alt="1700768152722" width=500>

## **TP2: Détection de signaux noyés dans du bruit**

### ***Bruitage d'un signal sinusoïdal***

![1700859736098](image/readme/1700859736098.png)

Signal sinusoïdal de fréquence bruité par un bruit blanc.

![1700860403085](image/readme/1700860403085.png)

Pour différente valeurs de Rapport Signal Bruit (signal plus ou moins bruité).

### ***Méthode de détection d'un signal dans du bruit***

![1701340790327](image/readme/1701340790327.png)

Methode de détection d'un signal plongé dans du bruit grâce à l'intercorrélation avec un signal de référence de même fréquence.

![1701343076333](image/readme/1701343076333.png)

Méthode de balayage de fréquence pour trouver la fréquence du signal plongé dans le bruit.

### ***Sur des signaux inconnus***

Pratique sur des bruits générés inconnus: on retrouve leur fréquence grâce à la méthode de balayage de fréquence.
Pour des sinusoïdes complexes, on retrouve la fréquence de chaque harmonique.

![1701353073155](image/readme/1701353073155.png)
![1701353088590](image/readme/1701353088590.png)
![1701353115776](image/readme/1701353115776.png)

## **TP3: Filtrage adapté**

### **Détection d'un signal déterministe connu**

![1701450966378](image/readme/1701450966378.png)

![1701457121668](image/readme/1701457121668.png)

![1701456926896](image/readme/1701456926896.png)

Le dernier signal est un signal dans lequel on cherche à détecter trois signaux déterministes connus. On remarque que la sortie du filtre adapté donne trois maximums locaux, correspondant aux trois temps d'apparition des signaux déterministes.

### **Application à la détection de la raie d’émission Lyα de l’hydrogène dans le spectre d’une galaxie lointaine**

La détection de galaxies lointaines est l’une des tâches pour lequel l’instrument MUSE (Multi Unit Spectroscopic Explorer) a été conçu. Il produit des images hyperspectrales, c’est à dire des images en trois dimensions : deux dimensions spatiales correspondant à la portion de ciel observée et une dimension spectrale : à chaque pixel de l’image 2D, un spectre est associé. Les galaxies lointaines sont difficiles à observer, elles sont spatialement peu étendues du fait de leur distance et leur spectre est composé d’une seule raie d’émission, la raie Lyα de l’hydrogène, dont la position est inconnue et dépend de la distance (elle aussi inconnue) de la galaxie. Les spectres de ces galaxies présentent un rapport signal à bruit très faible. Les données MUSE ont une résolution spatiale de 0,25 arcsecondes et une résolution spectrale de 0,125 nm. Le spectre s’étend entre 475 nm et 930 nm.

![1701463423660](image/readme/1701463423660.png)

Peut-on assimiler ces spectres à des bruits blancs ? Voici l'intercorrélation de deux spectres de deux pixels différents:

![1701469150824](image/readme/1701469150824.png)

On remarque que l'intercorrélation est quasi-nulle (dû au fait que l'on calcule sur des plages finies), donc les spectres sont non corrélés. On peut donc assimiler ces spectres à des bruits blancs.

### **Détection de la raie Lyα**

Le centre de la galaxie a été détecté dans le pixel de coordonnées (9, 8). Nous allons essayer de détecter automatiquement la position de la raie Lyα dans le spectre de la galaxie afin de déterminer l’âge de la galaxie. Pour cela nous utiliserons le gabarit de la raie Lyα et la méthode du filtrage adapté.
