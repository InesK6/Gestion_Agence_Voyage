//Incrémenter id_client et initialisé à 1
CREATE SEQUENCE SEQ_CLIENT START WITH 1;
CREATE OR REPLACE TRIGGER CLIENT_ON_INSERT
   BEFORE INSERT ON CLIENT
   FOR EACH ROW
BEGIN
  SELECT SEQ_CLIENT.NEXTVAL
  INTO   :new.id_client
  FROM   dual;
END;

//Incrémenter id_progCircuit et initialisé à 1
CREATE SEQUENCE SEQ_progCircuit START WITH 1;
CREATE OR REPLACE TRIGGER progCircuit_ON_INSERT
   BEFORE INSERT ON proCircuit
   FOR EACH ROW
BEGIN
  SELECT SEQ_progCircuit.NEXTVAL
  INTO   :new.id_progCircuit
  FROM   dual;
END;

//Incrémenter id_reservation et initialisé à 1
CREATE SEQUENCE SEQ_reservation START WITH 1;
CREATE OR REPLACE TRIGGER reservation_ON_INSERT
   BEFORE INSERT ON reservation
   FOR EACH ROW
BEGIN
  SELECT SEQ_reservation.NEXTVAL
  INTO   :new.id_reservation
  FROM   dual;
END;

//Incrémenter id_employe et initialisé à 1
CREATE SEQUENCE SEQ_employe START WITH 1;
CREATE OR REPLACE TRIGGER employe_ON_INSERT
   BEFORE INSERT ON employes
   FOR EACH ROW
BEGIN
  SELECT SEQ_employe.NEXTVAL
  INTO   :new.id_employe
  FROM   dual;
END;

//Incrémenter id_passager et initialisé à 1
CREATE SEQUENCE SEQ_passager START WITH 1;
CREATE OR REPLACE TRIGGER passager_ON_INSERT
   BEFORE INSERT ON passager
   FOR EACH ROW
BEGIN
  SELECT SEQ_passager.NEXTVAL
  INTO   :new.id_passager
  FROM   dual;
END;

/* trigger pour ajouter aux places réservées les places de chaque passager*/
CREATE SEQUENCE nbplacesreservees.total START WITH 1;

CREATE TRIGGER tr_ajout_places
AFTER UPDATE OR INSERT OF NBPASSAGER ON RESERVATION FOR EACH ROW 
DECLARE
 
BEGIN
IF UPDATING OR INSERTING THEN
UPDATE progCircuit SET nbplacesreservees.total = nbplacesreservees.total + :NEW.nbpassager;
END IF;
END;

//trigger pour empêcher la réservation si le nombres de places est insuffisant

CREATE TRIGGER TR_VERIFPLACE_INSERT
ON RESERVATION
INSTEAD OF INSERT
AS
DECLARE @nb_place INT, @nb_place_totale INT, @nb_place_reservees INT
SET @ nb_place = (SELECT nbPassager FROM inserted)
SET @nb_place_totale=(SELECT nbPlacesTotales FROM ProgCircuit
                                        WHERE id_ProgCircuit = (SELECT id_progCircuit FROM inserted))
SET @nb_place_reservee=(SELECT nbPlacesReservees FROM ProgCircuit
                                        WHERE id_ProgCircuit = (SELECT id_progCircuit FROM inserted))
IF (@nb_place_reservee - @nb_place)<= @nb_place_totale)
BEGIN 
INSERT INTO RESERVATION
SELECT * FROM inserted
END
ELSE
BEGIN
PRINT ‘La quantité de place restantes est inférieur à celle demandée’
END
