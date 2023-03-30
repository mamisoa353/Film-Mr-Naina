INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(1,'dada');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(2,'neny');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(3,'ankizy');
--
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(4,'Rakoto');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(5,'Rabary');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(6,'Ravao');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(7,'Lalasoa');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(8,'Lalaina');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(9,'Mamitiana');
INSERT INTO personnage (idpersonnage,nompersonnage)VALUES(10,'Francoise');

INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('fisakafoanana',1,'Kamboty velon-dray ka i neny irery no nitaiza, olona sahirana hatrizay, tsy mba nanana aniza hianteherana fa honjohonjonizy mianaka irery ny fiainany. Rehefa tsy mianatra dia manampy ny reniny masasa lamba fa izany no fidiram-bolanizy mianaka , mba nahavita kilasy fahatelo ihany fa saingy tsy ampy ny teo am-pela-tanana dia tsy maintsy nijanona nitady vola. Tsy dia manana endrika izy raha mihoatra ny tovovavy mitovy taona aminy fa olona miasa be ary tena miasa fa tsy kamo na manao alasafay. Trano bozaka izay no tranony ary efa tapitra mitete daholo ny tafo fa asiana selofanina atao solon-tafo dia mandeha eny ihany ny fiainana. Radio-carte kely atapy andro izay no mba fanananizy mianaka miampy ireo fitaovana tsy ilaina omenireo olona mampiasa azy. Rehefa mahita ny sakafo androany dia matory, rampitso indray mitady.Ialàna tsiny dieny mialoha fa somary mivantambantana ny fitantaràna.','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('salon',3,'mikapoka ny ankizy iNeny','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('Andeha miasa',2,'GADRA Tantara iray niseho nandritra ny iraka ny tantara ary tovolahy iray taizan iny nandritra ny fotoana lavalava no hozaraina eto sy ny nahatonga ahy latsa-pitiavana taminy','Scene2.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('salon',4,'Mamo be Dada miditra ny trano','Scene1.png',1);

INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('lalankely',1,'voahendaka iMamitiana','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('ampiasana nahita finday',2,'Nahita finday tao ampiasana iRakoto ary hitan iRavao','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('ampiasana very finday',3,'Very ny finday tao ampiasana iLalaina','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('ampiasana fitoriana',4,'Notorihin iLalaina iMamitiana','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('fight',5,'miady iRakoto sy iRavao','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('any ampiangonana',6,'mitomany iMamitiana fa very asa','Scene1.png',1);

INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('chambre',1,'mampirafy ani Lalasoa amini Francoise iRabary','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('traingo',2,'tratra iRabary','Scene1.png',1);
INSERT INTO scene (nomscene,numero,resume,photo,idfilm)VALUES('mamosavy',3,'namosavian Lalasoa Francoise','Scene1.png',1);



INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(1,'efitrano fisakafoanana',-18.954,47.477);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(3,'Chambre 1',-18.954,47.476);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(4,'Chambre 2',-18.954,47.475);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(2,'Garage',-18.960,47.581);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(5,'Antsena',-18.960,47.581);
INSERT INTO plateau(idplateau,nomplateau,longitude,latitude)VALUES(6,'fiangonana',-18.960,47.581);

INSERT INTO film(idfilm,nomfilm,resumefilm)VALUES(1,'film Mr Naina','MAMADOU Mbola mpianatra teny aminny oniverisiten i Toliara tamin izany no niara-nonina tamin i Mamadou. Lehilahy komorianina iray mpifanila trano taminay, samy mpanofa izahay. Fotoana naharitra no niarahanay niaina ka nahitanay ny zava-bitany tsy takatry ny saina..'); 

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,1,'','Reraka','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,2,'Misakafo oh','Faly','02:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,3,'Ho avy','Varina telephone','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,1,'Miantso ny akizy','Mamoaka fiara','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,3,'hoavy','normal','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','05:00:25',4);

insert into indispoPlateau(idplateau,date)values(2,'2023-03-15');
insert into indispoPlateau(idplateau,date)values(2,'2023-03-18');
insert into indispoPlateau(idplateau,date)values(4,'2023-03-17');




INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,1,'','Reraka','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,2,'Misakafo oh','Faly','02:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(1,3,'Ho avy','Varina telephone','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,1,'Miantso ny akizy','Mamoaka fiara','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,3,'hoavy','normal','02:00:25',2);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','02:00:25',4);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(2,2,'zzz','Matory','05:00:25',4);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(3,2,'tezitra fa nanimba vase','tezitra','02:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(3,3,'mitaomany','mitomany','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(4,1,'mamo iDada oh','mamo','00:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(4,2,'mitaomany i neny','malahelo','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(5,9,'voahendaka','misefosefo','02:00:10',1);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(6,4,'faly','mijerijery sao misy mahita','00:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(6,6,'sendra nandalo','taitra','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(7,8,'mikarokaroka','mitaintaina','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(8,8,'Manendrikendrika','tezitra','00:00:10',3);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(8,9,'taitra','taitra','00:00:10',1);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(9,4,'mampatahotra','tezitra','00:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(9,6,'matahotra','matahotra','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(10,9,'mitomanany mifona','mivavaka','00:00:10',1);


INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(11,7,'humm','faly','02:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(11,5,'humm','faly','02:00:10',1);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(12,5,'miditra ny trano mamomamo','reraka','00:00:10',1);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(12,10,'nahita message','taitra','00:00:10',3);

INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(13,7,'nidiran Devoly','mijaly','00:00:10',3);
INSERT INTO scene_personnage(sceneidscene,personnageidpersonnage,text,humeur,durree,idplateau) VALUES(13,10,'faly mitsinjaka','faly','00:00:10',3);




UPDATE scene_personnage set text='tena valaka zah zany' WHERE idScene_Personnage='1';
UPDATE scene_personnage set text='mila maka aina',humeur='vizaka be' WHERE idScene_Personnage='9';
UPDATE scene_personnage set text='milay be le jeux',humeur='variana' WHERE idScene_Personnage='3';

