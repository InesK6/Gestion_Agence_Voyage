/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 10gR2                          */
/* Date de création :  15/09/2020 14:14:56                      */
/*==============================================================*/


alter table GERE
   drop constraint FK_GERE_GERE_EMPLOYES;

alter table GERE
   drop constraint FK_GERE_GERE2_CLIENT;

alter table MODIFIE
   drop constraint FK_MODIFIE_MODIFIE_EMPLOYES;

alter table MODIFIE
   drop constraint FK_MODIFIE_MODIFIE2_RESERVAT;

alter table PASSAGER
   drop constraint FK_PASSAGER_VOYAGE_CLIENT;

alter table RESERVATION
   drop constraint FK_RESERVAT_CORRESPON_PROCIRCU;

alter table RESERVATION
   drop constraint FK_RESERVAT_RESERVE_CLIENT;

drop table CLIENT cascade constraints;

drop table EMPLOYES cascade constraints;

drop index GERE2_FK;

drop index GERE_FK;

drop table GERE cascade constraints;

drop index MODIFIE2_FK;

drop index MODIFIE_FK;

drop table MODIFIE cascade constraints;

drop index VOYAGE_FK;

drop table PASSAGER cascade constraints;

drop table PROCIRCUIT cascade constraints;

drop index CORRESPOND_FK;

drop index RESERVE_FK;

drop table RESERVATION cascade constraints;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT  (
   ID_CLIENT            NUMBER(10)                      not null
      constraint CKC_ID_CLIENT_CLIENT check (ID_CLIENT between 1 and 1000000000),
   NOMCLIENT            VARCHAR2(25)                    not null
      constraint CKC_NOMCLIENT_CLIENT check (NOMCLIENT = upper(NOMCLIENT)),
   PRENOMCLIENT         VARCHAR2(25)                    not null
      constraint CKC_PRENOMCLIENT_CLIENT check (PRENOMCLIENT = upper(PRENOMCLIENT)),
   EMAILCLIENT          VARCHAR2(50)                    not null
      constraint CKC_EMAILCLIENT_CLIENT check (EMAILCLIENT = lower(EMAILCLIENT)),
   TELCLIENT            NUMBER(10)                      not null,
   constraint PK_CLIENT primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : EMPLOYES                                             */
/*==============================================================*/
create table EMPLOYES  (
   ID_EMPLOYE           NUMBER(2)                       not null,
   NOMEMPLOYE           VARCHAR2(25)                    not null,
   PRENOMEMPLOYE        VARCHAR2(25)                    not null,
   TELEMPLOYE           NUMBER(10)                      not null,
   EMAILEMPLOYE         VARCHAR2(50)                    not null,
   SALAIRE              NUMBER(10)                      not null,
   MDP                  VARCHAR2(25),
   constraint PK_EMPLOYES primary key (ID_EMPLOYE)
);

/*==============================================================*/
/* Table : GERE                                                 */
/*==============================================================*/
create table GERE  (
   ID_EMPLOYE           NUMBER(2)                       not null,
   ID_CLIENT            NUMBER(10)                      not null
      constraint CKC_ID_CLIENT_GERE check (ID_CLIENT between 1 and 1000000000),
   constraint PK_GERE primary key (ID_EMPLOYE, ID_CLIENT)
);

/*==============================================================*/
/* Index : GERE_FK                                              */
/*==============================================================*/
create index GERE_FK on GERE (
   ID_EMPLOYE ASC
);

/*==============================================================*/
/* Index : GERE2_FK                                             */
/*==============================================================*/
create index GERE2_FK on GERE (
   ID_CLIENT ASC
);

/*==============================================================*/
/* Table : MODIFIE                                              */
/*==============================================================*/
create table MODIFIE  (
   ID_EMPLOYE           NUMBER(2)                       not null,
   ID_RESA              NUMBER(10)                      not null
      constraint CKC_ID_RESA_MODIFIE check (ID_RESA between 1 and 1000000000),
   constraint PK_MODIFIE primary key (ID_EMPLOYE, ID_RESA)
);

/*==============================================================*/
/* Index : MODIFIE_FK                                           */
/*==============================================================*/
create index MODIFIE_FK on MODIFIE (
   ID_EMPLOYE ASC
);

/*==============================================================*/
/* Index : MODIFIE2_FK                                          */
/*==============================================================*/
create index MODIFIE2_FK on MODIFIE (
   ID_RESA ASC
);

/*==============================================================*/
/* Table : PASSAGER                                             */
/*==============================================================*/
create table PASSAGER  (
   ID_PASSAGER          NUMBER(10)                      not null
      constraint CKC_ID_PASSAGER_PASSAGER check (ID_PASSAGER between 1 and 1000000000),
   ID_CLIENT            NUMBER(10)                      not null
      constraint CKC_ID_CLIENT_PASSAGER check (ID_CLIENT between 1 and 1000000000),
   NOMPASSAGER          VARCHAR2(25)                    not null
      constraint CKC_NOMPASSAGER_PASSAGER check (NOMPASSAGER = upper(NOMPASSAGER)),
   PRENOMPASSAGER       VARCHAR2(25)                    not null
      constraint CKC_PRENOMPASSAGER_PASSAGER check (PRENOMPASSAGER = upper(PRENOMPASSAGER)),
   EMAILPASSAGER        VARCHAR2(50)                    not null
      constraint CKC_EMAILPASSAGER_PASSAGER check (EMAILPASSAGER = lower(EMAILPASSAGER)),
   TELPASSAGER          NUMBER(10)                      not null,
   PAYS                 VARCHAR2(25)                    not null
      constraint CKC_PAYS_PASSAGER check (PAYS = upper(PAYS)),
   VILLE                VARCHAR2(25)                    not null
      constraint CKC_VILLE_PASSAGER check (VILLE = upper(VILLE)),
   RUE                  VARCHAR2(50)                    not null
      constraint CKC_RUE_PASSAGER check (RUE = upper(RUE)),
   constraint PK_PASSAGER primary key (ID_PASSAGER)
);

/*==============================================================*/
/* Index : VOYAGE_FK                                            */
/*==============================================================*/
create index VOYAGE_FK on PASSAGER (
   ID_CLIENT ASC
);

/*==============================================================*/
/* Table : PROCIRCUIT                                           */
/*==============================================================*/
create table PROCIRCUIT  (
   ID_PROGCIRCUIT       NUMBER(10)                      not null
      constraint CKC_ID_PROGCIRCUIT_PROCIRCU check (ID_PROGCIRCUIT between 1 and 1000000000),
   NBPLACESRESERVEES    NUMBER(3)                       not null
      constraint CKC_NBPLACESRESERVEES_PROCIRCU check (NBPLACESRESERVEES between 1 and 500),
   NBPLACESTOTALES      NUMBER(3)                       not null
      constraint CKC_NBPLACESTOTALES_PROCIRCU check (NBPLACESTOTALES between 1 and 500),
   NOM_CIRCUIT          VARCHAR2(25)                    not null,
   NOMHOTEL             VARCHAR2(25)                    not null
      constraint CKC_NOMHOTEL_PROCIRCU check (NOMHOTEL = upper(NOMHOTEL)),
   VILLE                VARCHAR2(25)                    not null
      constraint CKC_VILLE_PROCIRCU check (VILLE = upper(VILLE)),
   PAYS                 VARCHAR2(25)                    not null
      constraint CKC_PAYS_PROCIRCU check (PAYS = upper(PAYS)),
   constraint PK_PROCIRCUIT primary key (ID_PROGCIRCUIT)
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION  (
   ID_RESA              NUMBER(10)                      not null
      constraint CKC_ID_RESA_RESERVAT check (ID_RESA between 1 and 1000000000),
   ID_CLIENT            NUMBER(10)                      not null
      constraint CKC_ID_CLIENT_RESERVAT check (ID_CLIENT between 1 and 1000000000),
   ID_PROGCIRCUIT       NUMBER(10)                      not null
      constraint CKC_ID_PROGCIRCUIT_RESERVAT check (ID_PROGCIRCUIT between 1 and 1000000000),
   ACOMPTE              SMALLINT,
   SOLDE                SMALLINT                        not null,
   NBPASSAGER           NUMBER(2)                       not null
      constraint CKC_NBPASSAGER_RESERVAT check (NBPASSAGER between 1 and 99),
   DATE_DEBUT           DATE                            not null,
   DATE_FIN             DATE                            not null,
   PRIX                 NUMBER(10)                      not null,
   PENSION              VARCHAR2(25)                    not null,
   constraint PK_RESERVATION primary key (ID_RESA)
);

/*==============================================================*/
/* Index : RESERVE_FK                                           */
/*==============================================================*/
create index RESERVE_FK on RESERVATION (
   ID_CLIENT ASC
);

/*==============================================================*/
/* Index : CORRESPOND_FK                                        */
/*==============================================================*/
create index CORRESPOND_FK on RESERVATION (
   ID_PROGCIRCUIT ASC
);

alter table GERE
   add constraint FK_GERE_GERE_EMPLOYES foreign key (ID_EMPLOYE)
      references EMPLOYES (ID_EMPLOYE);

alter table GERE
   add constraint FK_GERE_GERE2_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT);

alter table MODIFIE
   add constraint FK_MODIFIE_MODIFIE_EMPLOYES foreign key (ID_EMPLOYE)
      references EMPLOYES (ID_EMPLOYE);

alter table MODIFIE
   add constraint FK_MODIFIE_MODIFIE2_RESERVAT foreign key (ID_RESA)
      references RESERVATION (ID_RESA);

alter table PASSAGER
   add constraint FK_PASSAGER_VOYAGE_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT);

alter table RESERVATION
   add constraint FK_RESERVAT_CORRESPON_PROCIRCU foreign key (ID_PROGCIRCUIT)
      references PROCIRCUIT (ID_PROGCIRCUIT);

alter table RESERVATION
   add constraint FK_RESERVAT_RESERVE_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT);

