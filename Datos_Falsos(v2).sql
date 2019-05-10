USE OMNIKNOW;
/* ================================= */
/*1*/ CALL REGISTRAR('CARLA'       ,'RAMIREZ'  ,'ROSAS'    ,1,'EST 23'			  	  ,'carla@gmail.com'		  ,'carla'		,'1');
/*2*/ CALL REGISTRAR('JULIO'       ,'CARIÑO'   ,'FUENTES'  ,1,'COLEGIO MEXICO'	  	  ,'julio@gmail.com'		  ,'julio'		,'1');
/*3*/ CALL REGISTRAR('PAULA'       ,'IBAÑEZ'   ,'PEREZ'    ,1,'ANEXA'			  	  ,'paula@gmail.com'		  ,'paula'	    ,'1');
/*4*/ CALL REGISTRAR('MICHELLE'    ,'CASTAÑEDO','LIRA'     ,2,'LEONA VICARIO'	  	  ,'michelle@gmail.com'		  ,'michelle'   ,'2');
/*5*/ CALL REGISTRAR('LUIS ALBERTO','FERNANDEZ','CABALLERO',2,'EST 23'				  ,'luisalberto@gmail.com'	  ,'luisalberto','2');
/*6*/ CALL REGISTRAR('MARIA JOSE'  ,'JIMENEZ'  ,'ACOSTA'   ,2,'COLEGIO MEXICO'	  	  ,'mariajose@gmail.com'	  ,'mariajose'	,'2');
/*7*/ CALL REGISTRAR('VIOLETA'     ,'MENDEZ'   ,'DIAZ'     ,3,'ANEXA'			  	  ,'violeta@gmail.com'		  ,'violeta'	,'3');
/*8*/ CALL REGISTRAR('JUAN'        ,'MARTINEZ' ,'CAMPOS'   ,3,'LEONA VICARIO'	      ,'juan@gmail.com'			  ,'juan'		,'3');
/*9*/ CALL REGISTRAR('MIRIAM'      ,'ALVAREZ'  ,'ESCAMILLA',3,'JOSE MARIA MORELOS'    ,'miriam@gmail.com'		  ,'miriam'		,'3');
/*10*/CALL REGISTRAR('FERNANDA'    ,'BERNAL'   ,'HERNANDEZ',4,'FERNANDO MONTES DE OCA','fernanda@gmail.com'		  ,'fernanda'	,'4');
/*11*/CALL REGISTRAR('ANTONIO'     ,'AGUILAR'  ,'FLORES'   ,4,'COLEGIO SUIZO'		  ,'antonio@gmail.com'		  ,'antonio'	,'4');
/*12*/CALL REGISTRAR('RODRIGO'     ,'CRUZ'     ,'MONTES'   ,4,'JEAN PIAGET'			  ,'rodrigo@gmail.com'		  ,'rodrigo'	,'4');
/*13*/CALL REGISTRAR('DIEGO'       ,'ROQUE'    ,'GILES'    ,5,'COLEGIO SUIZO'		  ,'diego@gmail.com'		  ,'diego'		,'5');
/*14*/CALL REGISTRAR('JUAN CARLOS' ,'CURIEL'   ,'HURTADO'  ,5,'JOSE MARIA MORELOS'	  ,'juancarlos@gmail.com'	  ,'juancarlos'	,'5');
/*15*/CALL REGISTRAR('MARCELA'     ,'TORRES'   ,'ESCOBAR'  ,5,'FERNANDO MONTES DE OCA','marcela@gmail.com'		  ,'marcela'	,'5');
/*16*/CALL REGISTRAR('KAREN'       ,'ISLAS'    ,'BUENDIA'  ,6,'JEAN PIAGET'			  ,'karen@gmail.com'		  ,'karen'		,'6');
/*17*/CALL REGISTRAR('PAULINA'     ,'ZARAGOZA' ,'ALARCON'  ,6,'MAS'					  ,'paulina@gmail.com'		  ,'paulina'	,'6');
/*18*/CALL REGISTRAR('PEDRO'       ,'HUERTA'   ,'LARREGUI' ,6,'MAS'					  ,'pedro@gmail.com'		  ,'pedro'		,'6');
/*19*/CALL REGISTRAR('NURIA'       ,'SYDYKOVA' ,'MENDEZ'   ,3,'EST 23'   			  ,'nuyita.sydykova@gmail.com','nuria'		,'3');

/* ================================= */
/*1*/CALL CREAR_TAREA(1,'tarea 1' , 'Solución 1' , 'tarea (1).pdf' , 'solucion (1).pdf' , 'a','a','a','a','a','2018-05-11');
/*1*/CALL CREAR_TAREA(1,'tarea 2' , 'Solución 2' , 'tarea (2).pdf' , 'solucion (2).pdf' , 'b','b','b','b','b','2018-05-18');
/*1*/CALL CREAR_TAREA(1,'tarea 3' , 'Solución 3' , 'tarea (3).pdf' , 'solucion (3).pdf' , 'c','c','c','c','c','2018-05-25');
/*2*/CALL CREAR_TAREA(2,'tarea 4' , 'Solución 4' , 'tarea (4).pdf' , 'solucion (4).pdf' , 'd','d','d','d','d','2018-05-11');
/*2*/CALL CREAR_TAREA(2,'tarea 5' , 'Solución 5' , 'tarea (5).pdf' , 'solucion (5).pdf' , 'e','e','e','e','e','2018-05-18');
/*2*/CALL CREAR_TAREA(2,'tarea 6' , 'Solución 6' , 'tarea (6).pdf' , 'solucion (6).pdf' , 'f','f','f','f','f','2018-05-25');

/*3*/CALL CREAR_TAREA(3,'tarea 7' , 'Solución 7' , 'tarea (7).pdf' , 'solucion (7).pdf' , 'g','g','g','g','g','2018-05-11');
/*3*/CALL CREAR_TAREA(3,'tarea 8' , 'Solución 8' , 'tarea (8).pdf' , 'solucion (8).pdf' , 'h','h','h','h','h','2018-05-18');
/*3*/CALL CREAR_TAREA(3,'tarea 9' , 'Solución 9' , 'tarea (9).pdf' , 'solucion (9).pdf' , 'i','i','i','i','i','2018-05-25');
/*4*/CALL CREAR_TAREA(4,'tarea 10', 'Solución 10', 'tarea (10).pdf', 'solucion (10).pdf', 'j','j','j','j','j','2018-05-11');
/*4*/CALL CREAR_TAREA(4,'tarea 11', 'Solución 11', 'tarea (11).pdf', 'solucion (11).pdf', 'k','k','k','k','k','2018-05-18');
/*4*/CALL CREAR_TAREA(4,'tarea 12', 'Solución 12', 'tarea (12).pdf', 'solucion (12).pdf', 'l','l','l','l','l','2018-05-25');

/*5*/CALL CREAR_TAREA(5,'tarea 13', 'Solución 13', 'tarea (13).pdf', 'solucion (13).pdf', 'm','m','m','m','m','2018-05-11');
/*5*/CALL CREAR_TAREA(5,'tarea 14', 'Solución 14', 'tarea (14).pdf', 'solucion (14).pdf', 'n','n','n','n','n','2018-05-18');
/*5*/CALL CREAR_TAREA(5,'tarea 15', 'Solución 15', 'tarea (15).pdf', 'solucion (15).pdf', 'i','o','o','o','o','2018-05-25');
/*6*/CALL CREAR_TAREA(6,'tarea 16', 'Solución 16', 'tarea (16).pdf', 'solucion (16).pdf', 'p','p','p','p','p','2018-05-11');
/*6*/CALL CREAR_TAREA(6,'tarea 17', 'Solución 17', 'tarea (17).pdf', 'solucion (17).pdf', 'j','q','q','q','q','2018-05-18');
/*6*/CALL CREAR_TAREA(6,'tarea 18', 'Solución 18', 'tarea (18).pdf', 'solucion (18).pdf', 'r','r','r','r','r','2018-05-25');

/* ================================= */
/*1*/CALL ENVIAR_RESPUESTAS(1,1,'a','1','a','a','a');
/*2*/CALL ENVIAR_RESPUESTAS(1,2,'b','b','1','b','b');
/*3*/CALL ENVIAR_RESPUESTAS(1,3,'c','c','c','1','c');
/*4*/CALL ENVIAR_RESPUESTAS(2,1,'1','1','a','a','a');
/*5*/CALL ENVIAR_RESPUESTAS(2,2,'b','1','1','b','b');
/*6*/CALL ENVIAR_RESPUESTAS(2,3,'c','c','1','1','c');
/*7*/CALL ENVIAR_RESPUESTAS(3,1,'1','1','1','a','a');
/*8*/CALL ENVIAR_RESPUESTAS(3,2,'b','1','1','1','b');
/*9*/CALL ENVIAR_RESPUESTAS(3,3,'c','c','1','1','1');

/*10*/CALL ENVIAR_RESPUESTAS(4,4,'1','1','d','d','d');
/*11*/CALL ENVIAR_RESPUESTAS(4,5,'e','1','e','e','e');
/*12*/CALL ENVIAR_RESPUESTAS(4,6,'f','f','1','f','1');
/*13*/CALL ENVIAR_RESPUESTAS(5,4,'d','2','d','2','d');
/*14*/CALL ENVIAR_RESPUESTAS(5,5,'2','e','3','2','e');
/*15*/CALL ENVIAR_RESPUESTAS(5,6,'f','2','f','2','f');
/*16*/CALL ENVIAR_RESPUESTAS(6,4,'d','d','d','d','d');
/*17*/CALL ENVIAR_RESPUESTAS(6,5,'2','3','3','e','e');
/*18*/CALL ENVIAR_RESPUESTAS(6,6,'f','f','2','2','f');

/*19*/CALL ENVIAR_RESPUESTAS(7,7,'1','g','g','g','g');
/*20*/CALL ENVIAR_RESPUESTAS(7,8,'h','1','h','h','h');
/*21*/CALL ENVIAR_RESPUESTAS(7,9,'i','i','1','i','i');
/*22*/CALL ENVIAR_RESPUESTAS(8,7,'2','g','g','g','g');
/*23*/CALL ENVIAR_RESPUESTAS(8,8,'h','2','2','h','h');
/*24*/CALL ENVIAR_RESPUESTAS(8,9,'i','i','i','3','i');
/*25*/CALL ENVIAR_RESPUESTAS(9,7,'1','1','1','1','g');
/*26*/CALL ENVIAR_RESPUESTAS(9,8,'h','h','h','2','h');
/*27*/CALL ENVIAR_RESPUESTAS(9,9,'i','3','3','i','3');

/*28*/CALL ENVIAR_RESPUESTAS(10,10,'j','j','j','j','j');
/*29*/CALL ENVIAR_RESPUESTAS(10,11,'k','k','k','k','k');
/*30*/CALL ENVIAR_RESPUESTAS(10,12,'l','l','l','l','l');
/*31*/CALL ENVIAR_RESPUESTAS(11,10,'j','j','j','j','j');
/*32*/CALL ENVIAR_RESPUESTAS(11,11,'k','k','k','k','k');
/*33*/CALL ENVIAR_RESPUESTAS(11,12,'l','l','l','l','l');
/*34*/CALL ENVIAR_RESPUESTAS(12,10,'j','j','j','j','j');
/*35*/CALL ENVIAR_RESPUESTAS(12,11,'k','k','k','k','k');
/*36*/CALL ENVIAR_RESPUESTAS(12,12,'l','l','l','l','l');

/*37*/CALL ENVIAR_RESPUESTAS(13,13,'m','m','m','m','m');
/*38*/CALL ENVIAR_RESPUESTAS(13,14,'n','n','n','n','n');
/*39*/CALL ENVIAR_RESPUESTAS(13,15,'o','o','o','o','o');
/*40*/CALL ENVIAR_RESPUESTAS(14,13,'m','m','m','m','m');
/*41*/CALL ENVIAR_RESPUESTAS(14,14,'n','n','n','n','n');
/*42*/CALL ENVIAR_RESPUESTAS(14,15,'o','o','o','o','o');
/*43*/CALL ENVIAR_RESPUESTAS(15,13,'m','m','m','m','m');
/*44*/CALL ENVIAR_RESPUESTAS(15,14,'n','n','n','n','n');
/*45*/CALL ENVIAR_RESPUESTAS(15,15,'o','o','o','o','o');

/*46*/CALL ENVIAR_RESPUESTAS(16,16,'p','p','p','p','p');
/*47*/CALL ENVIAR_RESPUESTAS(16,17,'q','q','q','q','q');
/*48*/CALL ENVIAR_RESPUESTAS(16,18,'r','r','r','r','r');
/*49*/CALL ENVIAR_RESPUESTAS(17,16,'p','p','p','p','p');
/*50*/CALL ENVIAR_RESPUESTAS(17,17,'q','q','q','q','q');
/*51*/CALL ENVIAR_RESPUESTAS(17,18,'r','r','r','r','r');
/*52*/CALL ENVIAR_RESPUESTAS(18,16,'p','p','p','p','p');
/*53*/CALL ENVIAR_RESPUESTAS(18,17,'q','q','q','q','q');
/*54*/CALL ENVIAR_RESPUESTAS(18,18,'r','r','r','r','r');

SELECT * FROM RESPUESTAS_REVISADAS;
select * from INFOS_PARTICIPANTES ORDER BY ID_PARTICIPANTE;
select * from INFOS_TAREAS;