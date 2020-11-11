# Gestion_Agence_Voyage
Gestion d'une Agence de Voyage (Base de données - Oracle &amp; Développement web - PHP/HTML)

Description du projet :

2. Spécification, Analyse et conception :

• Une page de garde : avec le titre du projet et les noms des membres 
• La description du sujet : ce que doit faire cette application, décrire textuellement ces structures et ses services 
• La description textuelles des requêtes de mise à jour (2 requêtes impliquant 1 table, 2 requêtes impliquant 2 tables, 2 requêtes impliquant plus de 2 tables) 
• La description textuelles des requêtes de suppression (2 requêtes impliquant 1 table, 2 requêtes impliquant 2 tables, 2 requêtes impliquant plus de 2 tables) 
• La description textuelles des requêtes de consultation (5 requêtes impliquant 1 table dont 1 avec un group By et une avec un Order By, 5 requêtes impliquant 2 tables avec jointures internes dont 1 externe + 1 group by + 1 tri, 5 requêtes impliquant plus de 2 tables avec jointures internes dont 1 externe + 1 group by + 1 tri) 
• Le dictionnaire de données MERISE. Pour chaque entité décrire chacune des propriétés : Titre / description / format des données / type / Indentifiant / contraintes 
• La description textuelles des associations : Décrire textuellement les associations entre entités 
• La définition du Modèle Entité-Association MERISE (en utilisant le logiciel Poweramc de SYBASE/SAP ou manuellement). Vous devez vous limiter à 10 entités maximum et 5 minimum. Vous devez ici prendre en compte les contraintes identifiées lors de la description du dictionnaire de données. Exemple de liens d’association pour deux entités A et B ayant une liaisons 1 : N ou N-M (exemple UN PILOTE ASSURE 0, 1 ou plusieurs VOL, un VOL est assuré par 1 et 1 PILOTE au plus) 
•  La définition du modèle logique de Données  ou schéma rélationnel (en utilisant le logiciel Poweramc de SYBASE/SAP ou manuellement) un schéma de données logique en respectant les contraintes d’intégrités  d’entité (PRIMARY KEY), de domaine (CHECK, NOT NULL, …) et de référence(REFERENCES / foreign key). Générable automatiquement avec POWERAMC si vous avez décrites au niveau MCD • Spécification des traitement avec des packages PLSQL (Modèle de traitements)  . Choisir parmi vos tables deux d’entres (A et B) elles sur lesquelles les fonctions suivantes vont être spécifiées puis implémentées : Sur la table A, définir un package plsql ayant le nom de la dite table:  - ajouter une nouvelle occurence à A : fonction Ainserer; - supprimer une occurrence à  A  (Attention : les enregistrements liés dans B doivent aussi être supprimés) : fonction Asupprimer; - modifier des informations sur de A : fonction AmodifierF1, AmodifierF2 (texte requêtes correspondantes plus haut);  -  lister toutes les occurrences de A: fonction Alister;  - fournir le nombre total des occurrences de A : fonction Atotal ;  - Proposer aussi 3 fonctions avec des requêtes de consultation impliquant 2 ou 3 tables au moins (jointure, groupe, tri) : fonction Af1, Af2, Af3. f1, f2, f3 sont des noms à définir AmodifierF2 (texte requêtes correspondantes plus haut); 
 
Sur la table B,  définir un package plsql ayant le nom de la dite table : 

 - ajouter une nouvelle occurence à B : fonction Binserer - supprimer une occurrence à  B  : fonction Bsupprimer; 
 - modifier des informations sur de B : fonction BmodifierF1, BmodifierF2 (texte requêtes correspondantes plus haut);  -  lister toutes les occurrences de B pour une occurrence de A donnée: fonction Blister Nota : Seule la partie spécification de chaque package est nécessaire ici. bien choisir les paramètres des méthodes. Bien nommer les méthodes. Remplacer F1 à Fn par des noms appropriés. 
 
 
• Spécification des trigers  
 
Vous devez définir textuellement aux moins deux triggers. Ces triggers vous permettrant devront vous permettre de gérer aux moins deux règles de gestions qui ne peuvent être prises en compte à travers le schéma de données. 
 
* Faire des maquettes d’écran 
- Un écran de connexion 
- Un écran avec moteur de recherche (gérer la liste des données d’une table)
- Un ou plusieurs écrans détails pour faire du CRUD (sur les données d’une ligne) 
- Un écran surprise Utilisez pour cela ADOBE XD 


3. Génération du schéma physique de données :

Définir le schéma physique qui consiste à produire les ordres SQL de création des tables, indexes etc.. Vous pouvez générer ces tables en convertissant le schéma logique vers des ordres SQL  avec POWERAMC ou manuellement. Toutefois, il faut privilégier POWERAMC. Si vous avez une base de données Oracle locale, il faut créer un utilisateur Oracle si ce n’est déjà fait ou utilser le compte Oracle qui vous a été fourni sur une base distante. Cet utilisateur sera le propriétaire de tous les objets de votre application (des tables, indexes, packages, ...). Connectez vous avec le compte Oracle choisi (local ou distant). 

4. Insertion des lignes dans des tables :

Il s’agit d’effectuer manuellement des insertions de lignes dans chacunes de vos tables. Insérer 10 à 20 lignes par tables. Bien gérer les contraintes d’intégrités (primary key, foreign, et check). Connectez vous avec le compte Oracle choisi dans la section 3 (local ou distant)

5. Mise à jour et consultation des données :

Les requêtes de mise à jour (modification, suppression) et de consulatation à écrire sont celles définies dans la section 2. Connectez vous avec le compte Oracle choisi dans la section 3 (local ou distant).

6. Définition et implémentation des packages PLSQL :

Il s’agit définir les packages spécifications et d’implémenter le code des packages bodies introduits au chapitre 2.  
 
Vous devez aussi proposer le code de test de chacun de ces packages. 
 Vous devez dans ce même fichier programmer les spécifications des deux triggers décrits dans le chapitre 2. 
 
Connectez vous avec le compte Oracle choisi dans la section 3 (local ou distant).   

7. Développement WEB :

Intégrer les maquettes d’écrans créés avec ADOBE XD pour construire des pages WEB vous permettant de manipuler et accéder aux données d’une Bases Oracle. 
 
Pour cela vous devez utiliser un client PHP/HTML avec une base de données Oracle et non MYSQL. Vous pouvez installer une architecture WAMP mais la base à utiliser sera Oracle. Vous avez tous des comptes Oracle déjà créés. 

