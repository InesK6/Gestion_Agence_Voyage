// ----------La description textuelle des requêtes de mise à jour

//2 requêtes impliquant 1 table :
//1)	Modifier le prénom du client s’appelant « Carron » en le remplaçant par « Lulu » :
UPDATE client
SET prenomClient = « Lulu »
WHERE nomClient= « Carron »
//2)	Modifier le nom de l’hotel qui a comme id « 2 » en le remplacant par « Paradise » :
UPDATE proCircuit
SET nomHotel = « Paradise »
WHERE id_proCircuit= 2
//2 requêtes impliquant 2 tables :
//1)	Modifier la rue de l’adresse du client s’appelant « Lucie CARRON » en remplaçant par la rue du client « 26 rue de la milady »
UPDATE passager a
SET a.rue = “26 rue de la milady »
WHERE c.nomClient=”CARRON” 
FROM client c

//2)	Modifier la rue de l’adresse du client s’appelant « Lucie CARRON » en remplaçant par la rue du client « Ines KERGALE »
UPDATE passager a
SET a.rue = (select a.rue
 where c.nomClient=”KERGALE” FROM client c)


//2 requêtes impliquant plus de 2 tables :
1)	UPDATE 

//---------------	La description textuelle des requêtes de suppression 
//2 requêtes impliquant 1 table :
//1)	Supprimer la ligne où l’id_reservation de la table réservation vaut 1
DELATE FROM ‘reservation’
WHERE ‘id_reservation’=1
//2)	Supprimer toutes les lignes de reservation où la date de fin est inférieure à l’année 2020
DELATE FROM ‘reservation’
WHERE ‘date_fin’ < ‘2020-01-01’
//2 requêtes impliquant 2 tables :
//1)	Supprimer le(s) client(s) qui ont réservé pour 2 passagers
DELETE *
FROM CLIENT
WHERE nbPassager IN (SELECT nbPassager FROM reservation WHERE nbPassager = 2) ;

//2)	Supprimer le nom de l’hotel du client ayant l’email « l.bollenbach@net.estia.fr »)
DELETE nomHotel
FROM RESERVATION
WHERE emailClient IN (SELECT emailClient FROM client WHERE emailClient= « l.bollenbach@net.estia.fr ») ;
//2 requêtes impliquant plus de 2 tables :












//--------La description textuelle des requêtes de consultation
//5 requêtes impliquant 1 table donc 1 group by et 1 order by :
//1)	Sélectionner les noms des clients
SELECT nomClient FROM Client ;
//2)	Sélectionner toutes les infos des passagers organisées par ordre alphabétique des noms de famille
SELECT * FROM passager
Order by nompassager
//3)	Sélectionner la somme des prix des réservations groupés par le nombre de passager
SELECT nbPassager, SUM (prix) 
FROM reservation
GROUP BY nbPassager
//4)	Sélectionner tous les prénoms des passagers ayant leur id >= à 7
SELECT prenomPassager
FROM passager 
WHERE id_passager >=7 ;
//5)	Sélectionner le nom des circuits dans lequel il y a plus de 15places
SELECT nom_circuit 
FROM proCircuit
WHERE nbPlacesTotales > 15 ;

//5 requêtes impliquant 2 tables dont 1 externe, 1 group by et 1 order by :
//1)	Sélectionner les noms des hotels et les noms des passagers
SELECT nomHotel FROM reservation
UNION
SELECT nomPassager FROM passager ;
//2)	Sélectionner le telClient qui a réservé pour le passager avec le nom BOURGEOIS
SELECT telClient FROM client
WHERE nomPassager (SELECT nomPassager FROM passager WHERE nomPassager = « BOURGEOIS ») ;
//3)	Sélectionner les prix des réservations faites par les clients « BOLLENBACH », organisée par prix
SELECT prix FROM reservation
WHERE nomClient IN (SELECT nomClient FROM client WHERE nomClient= « BOLLENBACH »)
GROUP BY prix ;
//4)	Sélectionner le nom de l’hotel des passagers qui s’appellent Lucie, organisé par ordre alphabétique
SELECT nomHotel FROM reservation
WHERE prenomPassager IN (SELECT prenomPassager FROM passager WHER prenomPassager= « Lucie »)
ORDER BY nomHotel ;
//5)	
