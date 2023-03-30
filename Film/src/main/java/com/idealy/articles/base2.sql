/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  26132
 * Created: 28 févr. 2023
 */
ALTER TABLE Scene_Personnage DROP CONSTRAINT FKScene_Pers759603;
ALTER TABLE Scene_Personnage DROP CONSTRAINT FKScene_Pers197363;
ALTER TABLE Scene_Personnage DROP CONSTRAINT FKScene_Pers353766;
ALTER TABLE Film_Scene DROP CONSTRAINT FKFilm_Scene681672;
ALTER TABLE Film_Scene DROP CONSTRAINT FKFilm_Scene768786;
DROP TABLE IF EXISTS Film CASCADE;
DROP TABLE IF EXISTS Film_Scene CASCADE;
DROP TABLE IF EXISTS Personnage CASCADE;
DROP TABLE IF EXISTS Plateau CASCADE;
DROP TABLE IF EXISTS Scene CASCADE;
DROP TABLE IF EXISTS Scene_Personnage CASCADE;

CREATE TABLE Film (
  idFilm  SERIAL NOT NULL, 
  nomFilm varchar(255), 
  resumefilm text, 
  PRIMARY KEY (idFilm));


CREATE TABLE Film_Scene (
  FilmidFilm   int4 NOT NULL, 
  Sceneidscene int4 NOT NULL, 
  idFilm_Scene int4 NOT NULL, 
  PRIMARY KEY (FilmidFilm, 
  Sceneidscene, 
  idFilm_Scene));



CREATE TABLE Personnage (
  idPersonnage  SERIAL NOT NULL, 
  nomPersonnage varchar(255), 
  PRIMARY KEY (idPersonnage));


CREATE TABLE Plateau (
  idPlateau  SERIAL NOT NULL, 
  nomPlateau varchar(255), 
  longitude double precision,
  latitude double precision,
  PRIMARY KEY (idPlateau));


CREATE TABLE Scene (
   idFilm int,
  idscene  SERIAL NOT NULL, 
  nomScene varchar(255), 
  numero   int4, 
  resume text,
  photo VARCHAR,
  status int default 0,
  PRIMARY KEY (idscene));



CREATE TABLE Scene_Personnage (
  idScene_Personnage     SERIAL NOT NULL, 
  Sceneidscene           int4 NOT NULL, 
  PersonnageidPersonnage int4 NOT NULL, 
  text                   varchar(255), 
  humeur                 varchar(255), 
  durree                 time(7), 
  status int default 0,
  
  idPlateau              int4 NOT NULL, 
  PRIMARY KEY (Sceneidscene, 
  PersonnageidPersonnage, 
  idScene_Personnage));


CREATE INDEX Scene_idscene 
  ON Scene (idscene);
ALTER TABLE Scene_Personnage ADD CONSTRAINT FKScene_Pers759603 FOREIGN KEY (Sceneidscene) REFERENCES Scene (idscene);
ALTER TABLE Scene_Personnage ADD CONSTRAINT FKScene_Pers197363 FOREIGN KEY (PersonnageidPersonnage) REFERENCES Personnage (idPersonnage);
ALTER TABLE Scene_Personnage ADD CONSTRAINT FKScene_Pers353766 FOREIGN KEY (idPlateau) REFERENCES Plateau (idPlateau);
ALTER TABLE Film_Scene ADD CONSTRAINT FKFilm_Scene681672 FOREIGN KEY (FilmidFilm) REFERENCES Film (idFilm);
ALTER TABLE Film_Scene ADD CONSTRAINT FKFilm_Scene768786 FOREIGN KEY (Sceneidscene) REFERENCES Scene (idscene);



CREATE OR REPLACE view SceneDetail as
SELECT personnage.nompersonnage,scene_personnage."text" , scene_personnage.humeur,scene_personnage.durree +interval '20 minutes'as durree,
	plateau.nomplateau,scene.nomscene,personnage.idpersonnage, plateau.idplateau,scene_personnage.sceneidscene,
	film.idfilm filmidfilm,scene_personnage.idscene_personnage as id,scene.resume,scene.photo,scene.status,plateau.latitude,plateau.longitude
FROM scene_personnage 
JOIN personnage personnage ON personnage.idpersonnage = scene_personnage.personnageidpersonnage
JOIN plateau plateau ON plateau.idplateau = scene_personnage.idplateau
JOIN scene scene ON scene.idscene = scene_personnage.sceneidscene
JOIN film ON film.idfilm = scene.idfilm
where scene_personnage.status <=0
order by plateau.latitude,plateau.longitude;

CREATE OR REPLACE view SceneDescription as 
SELECT sum(durree)::TIME  Total,nomplateau,count(*) nbrScene, scenedetail.idpersonnage ,sceneidscene, filmidfilm ,idplateau,longitude,latitude ,sum(status) as status,id FROM scenedetail
GROUP By idplateau,nomplateau,filmidfilm,id,longitude,latitude,idpersonnage,sceneidscene
order by longitude,latitude ;

CREATE OR REPLACE VIEW v_planification as 
SELECT *,
(generate_series(
	((select current_date::varchar || ' 08:00:00') ::timestamp) ,
	((select current_date::varchar)||' '||(total + interval '8 hour'))  ::timestamp,
	interval '8 hours') 
)as dateprepa
FROM SceneDescription ;


create or replace view v_plan as
SELECT *,row_number() over() as idplan  FROM v_planification;


DROP TABLE IF EXISTS tournage cascade;
CREATE TABLE Tournage(
    id serial,
    Total time,
    nomplateau VARCHAR(50),
    nbrScene int,
    nbPerso int,
    filmidfilm int,
    idplateau int,
    dateprepa timestamp
);

drop table if exists indispoPlateau cascade;
CREATE TABLE indispoPlateau(
    id serial,
    idplateau int,
    date date
);

drop table if exists indispoActeur cascade;
CREATE TABLE indispoActeur(
    id serial,
    idActeur int,
    date date
);



insert into indispoActeur(idActeur,date)values(2,'2023-03-15');


INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(1,'dada');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(2,'neny');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(3,'ankizy');

INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('fisakafoanana',1,'Kamboty velon-dray ka i neny irery no nitaiza, olona sahirana hatrizay, tsy mba nanana aniza hianteherana fa honjohonjonizy mianaka irery ny fiainany. Rehefa tsy mianatra dia manampy ny reniny masasa lamba fa izany no fidiram-bolanizy mianaka , mba nahavita kilasy fahatelo ihany fa saingy tsy ampy ny teo am-pela-tanana dia tsy maintsy nijanona nitady vola. Tsy dia manana endrika izy raha mihoatra ny tovovavy mitovy taona aminy fa olona miasa be ary tena miasa fa tsy kamo na manao alasafay. Trano bozaka izay no tranony ary efa tapitra mitete daholo ny tafo fa asiana selofanina atao solon-tafo dia mandeha eny ihany ny fiainana. Radio-carte kely atapy andro izay no mba fanananizy mianaka miampy ireo fitaovana tsy ilaina omenireo olona mampiasa azy. Rehefa mahita ny sakafo androany dia matory, rampitso indray mitady.
Ialàna tsiny dieny mialoha fa somary mivantambantana ny fitantaràna.','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('Andeha miasa',2,'GADRA
Tantara iray niseho nandritra ny iraka fahadimy natrehako teo amin’ny sehatry ny psikolojia izay nisy ahy. Toeram-pitsaboana iray alavitry ny renivohitra no nisehoan’ny tantara ary tovolahy iray taizan’aretin-tsaina sy voasokajy ho olona adala no niandraiketako ka nanaovako asa fikarohana. Ny zava-niseho niarahako taminy nandritra ny fotoana lavalava no hozaraina eto sy ny nahatonga ahy latsa-pitiavana taminy.','Scene2.png',1);


INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(1,'efitrano fisakafoanana',-18.954,47.477);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(3,'Chambre 1',-18.954,47.476);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(4,'Chambre 2',-18.954,47.475);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(2,'Garage',-18.960,47.581);

INSERT INTO film(idfilm,nomfilm,resumefilm)VALUES(1,'film Mr Naina','MAMADOU
Mbola mpianatra teny aminny oniverisiten’i Toliara tamin’izany no niara-nonina tamin’i Mamadou. Lehilahy komorianina iray mpifanila trano taminay, samy mpanofa izahay. Fotoana naharitra no niarahanay niaina ka nahitanay ny zava-bitany tsy takatry ny saina..'); 



INSERT INTO film_scene(idfilm_scene,filmidfilm,sceneidscene)VALUES(1,1,1);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,1,'','Reraka','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,2,'Misakafo oh','Faly','02:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,3,'Ho avy','Varina telephone','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,1,'Miantso ny akizy','Mamoaka fiara','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,3,'hoavy','normal','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','05:00:25',4);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','2:00:25',4);

insert into indispoPlateau(idplateau,date)values(2,'2023-03-15');
insert into indispoPlateau(idplateau,date)values(4,'2023-03-17');





