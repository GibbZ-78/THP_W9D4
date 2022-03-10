## THP W9D4 - GibbZmail, an humble clone of Gmail based on Rails & Ajax

### :one: Context
Just to make sure you're prepared to handle what's next, 1 or 2 important topics, I'd like to cover:
- What will be used in this project: [About Ajax](https://www.dailymotion.com/video/x6l0ipy)
- What can also be done with it (or any challenger brand): [About Solcarlus](https://www.dailymotion.com/video/x173o5v)

### :two: Content :scroll:
#### Introduction
Le projet consiste à réaliser un _Email Viewer_ qui n'est ni plus ni moins qu'une version ultra basique (ne soyons pas si désagréables avec nous-mêmes...) de Gmail. Globalement l'appli affichera une seule et unique page avec 2 colonnes :
- Une colonne contenant la liste des emails en base ;
- Une colonne affichant le contenu de l'email sur lequel l'utilisateur vient de cliquer.

#### Le projet
##### Un "back" Rails minmaliste
- Un _model_ "EMail" ayant pour attributs object (string) et body (text) ;
- Un petit _seed_ pour mettre en base quelques emails.
- Un petit routage sur la racine "email#index", avec le _controller_ et la _view_ qui correspondent

##### La view index de base
On va se créer un grand tableau sur 2 colonnes :
- Une colonne "Liste des emails" qui affichera l'objet de chaque email présent en base ;
- Une colonne "Email sélectionné" qui sera vide au chargement de la page mais affichera, à terme, le contenu de l'email sélectionné.

N'hésitons pas à utiliser Bootstrap ou assimilé pour avoir un visuel pas trop moche sur toute l'app' !

##### AJAX level 1 : l'ajout d'un email
On commence par une fonction AJAX que tu connais bien : la création d'un nouvel email. Ici on fait ultra simple :
- Tu vas créer un bouton "recevoir un email" juste au dessus de ton tableau ;
- Lorsqu'il sera cliqué, ce bouton fera un appel en POST vers une méthode create du controller emails qui va créer un nouvel email en base via Faker (comme ça, pas besoin de saisir toi-même le contenu) ;

Tout cela doit avoir lieu en AJAX pour que le nouvel email s'affiche, à la suite des autres... Sans rechargement évidemment !

##### AJAX level 2 : afficher un email
Maintenant, tu vas changer chaque objet d'email (le texte) en un lien HTML : ce lien doit rediriger vers une page show basique de l'email (affichant l'objet en haut, contenu en dessous).

Une fois cela fait, tu vas passer ce lien en AJAX : au lieu d'ouvrir la page show via une redirection d'URL, je veux que cela exécute un fichier JS qui va afficher le contenu de l'email dans la colonne de droite. Le rendu visuel sera simple :
- L'objet de l'email sera en gros, en haut de la colonne de droite ;
- Le corps de l'email sera en taille normale, juste en dessous ;
- Sous le corps d'email, il y aura 2 boutons (inactifs pour le moment) : "Supprimer" et "Marquer comme non-lu"

##### AJAX level 3 : la suppression d'un email
Pas besoin de plus d'info, si ? 
Il faut tout simplement que le bouton "Supprimer" fonctionne bien en AJAX. L'email doit disparaître des 2 colonnes.

##### AJAX level 4 : email lu/non-lu
On va à présent gérer la notion de lu/non-lu. Fais une migration qui rajoute l'attribut read à la table emails : c'est un booléen qui vaut false initialement et doit passer à true si l'email est lu. Met à jour ton seed si besoin pour prendre en compte cet attribut.

Voici comment cet attribut doit fonctionner pour l'utilisateur de ton Gmail-like :
- Lorsqu'il clique sur l'objet d'un email et que le contenu de celui-ci s'affiche, l'email doit passer en lu à la fois en BDD et visuellement sur le front de la colonne de gauche (par exemple la couleur de fond de l'objet change ou son nom passe de gras à normal).
- L'utilisateur peut remettre l'email en "non-lu" grâce au bouton "Marquer comme non-lu". Cela modifie son statut en BDD ainsi que son affichage visuel sur la colonne de gauche (par exemple la couleur de fond de l'objet revient à la normale).
- Une fois que tu as fait marcher cela, essaye d'implémenter une fonctionnalité sympa : si on clique sur le bouton "marquer comme non-lu", le bouton devient alors "marquer comme lu" et permet de repasser le statut de l'email à "lu".

##### AJAX level 5 "Ultimate Premium+" : l'appel en JQuery/JS
Ton Email-Viewer est ultra-cool, si tu as réussi à lui implémenter tout ça. Mais on peut aller encore un niveau au dessus ! 
En effet, pour afficher un email, tu dois pour le moment cliquer sur un lien qui est le texte de l'objet. 
Gmail fait mieux : il t'affiche le contenu de ton email si tu cliques n'importe où dans la case qui encadre l'objet de l'email.

Pour faire cela, il faut être capable de mettre un détecteur JS de clic sur la case puis de déclencher, via JavaScript, une requête AJAX. C'est un peu le niveau du dessus de la checkbox qu'on a vu précédemment !

#### Rendu attendu
Un repo GitHub avec une app Rails complète, fonctionnelle et déployée en production sur Heroku.
  
### :three: How to :bulb:
1. Create an empty directory on your :computer:
2. Clone the current :octocat: repository to the latter
3. Type ```bundle install {Return}``` to load and initiate the needed Ruby libraries (aka "gems")
4. Make sur you have the latest version of PostGreSQL installed (v14.2 as of when I'm writing this)
5. Then launch the related DB server via something like a ```sudo service postgresql start {Return}```
6. Create the needed DB scheme(s) and instance via a straight ```rails db:create``` then a convincing ```rails db:migrate```
7. Populate the newly created table(s) using the transcending ```rails db:seed``` maybe just check "/db/seeds.rb" is present and not empty first... You never know :wink:
8. Finally launch the Puma web server invoking the magic by a ```rails s(erver) {Return}```
9. You're all set (1 hour just went by, lost for ever :smile:) to connect to [http://localhost:3000](http://localhost:3000) via your preferred web browser.
10. Now enjoy and have (supra) fun :satisfied: with my proposed approach of today's THP project
  
### :three: Credits :closed_lock_with_key:
&copy; 2022 - Jean-Baptiste VIDAL ([Github repo](https://github.com/GibbZ-78))
  
Enjoy, _wanderer_ :wink: !  
  