-- MySQL dump 10.13  Distrib 5.5.36, for Linux (x86_64)
--
-- Host: localhost    Database: robdba5
-- ------------------------------------------------------
-- Server version	5.5.36-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `frys_1000`
--

DROP TABLE IF EXISTS `frys_1000`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frys_1000` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(500) NOT NULL,
  `pillar` varchar(1) NOT NULL,
  `wordlist` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frys_1000`
--

LOCK TABLES `frys_1000` WRITE;
/*!40000 ALTER TABLE `frys_1000` DISABLE KEYS */;
INSERT INTO `frys_1000` (`id`, `word`, `pillar`, `wordlist`) VALUES (1,'The','A',1),(2,'Of','A',1),(3,'And','A',1),(4,'A','A',1),(5,'To','A',1),(6,'In','A',1),(7,'Is','A',1),(8,'You','A',1),(9,'That','A',1),(10,'It','A',1),(11,'He','A',1),(12,'Was','A',1),(13,'For','A',1),(14,'On','A',1),(15,'Are','A',1),(16,'As','A',1),(17,'With','A',1),(18,'His','A',1),(19,'They','A',1),(20,'I','A',1),(21,'At','A',1),(22,'Be','A',1),(23,'This','A',1),(24,'Have','A',1),(25,'From','A',1),(26,'Or','B',1),(27,'One','B',1),(28,'Had','B',1),(29,'By','B',1),(30,'Words','B',1),(31,'But','B',1),(32,'Not','B',1),(33,'What','B',1),(34,'All','B',1),(35,'Were','B',1),(36,'We','B',1),(37,'When','B',1),(38,'Your','B',1),(39,'can','B',1),(40,'Said','B',1),(41,'There','B',1),(42,'Use','B',1),(43,'An','B',1),(44,'Each','B',1),(45,'Which','B',1),(46,'She','B',1),(47,'Do','B',1),(48,'How','B',1),(49,'Their','B',1),(50,'If','B',1),(51,'Will','C',1),(52,'Up','C',1),(53,'Other','C',1),(54,'About','C',1),(55,'Out','C',1),(56,'Many','C',1),(57,'Then','C',1),(58,'Them','C',1),(59,'These','C',1),(60,'So','C',1),(61,'Some','C',1),(62,'Her','C',1),(63,'Would','C',1),(64,'Make','C',1),(65,'Like','C',1),(66,'Him','C',1),(67,'Into','C',1),(68,'Time','C',1),(69,'Has','C',1),(70,'Look','C',1),(71,'Two','C',1),(72,'More','C',1),(73,'Write','C',1),(74,'Go','C',1),(75,'See','C',1),(76,'Number','D',1),(77,'No','D',1),(78,'Way','D',1),(79,'Could','D',1),(80,'People','D',1),(81,'My','D',1),(82,'Than','D',1),(83,'First','D',1),(84,'Water','D',1),(85,'Been','D',1),(86,'Called','D',1),(87,'Who','D',1),(88,'Am','D',1),(89,'Its','D',1),(90,'Now','D',1),(91,'Find','D',1),(92,'Long','D',1),(93,'Down','D',1),(94,'Day','D',1),(95,'Did','D',1),(96,'Get','D',1),(97,'Come','D',1),(98,'Made','D',1),(99,'May','D',1),(100,'Part','D',1),(101,'Over','A',2),(102,'New','A',2),(103,'Sound','A',2),(104,'Take','A',2),(105,'Only','A',2),(106,'Little','A',2),(107,'Work','A',2),(108,'Know','A',2),(109,'Place','A',2),(110,'Years','A',2),(111,'Live','A',2),(112,'Me','A',2),(113,'Back','A',2),(114,'Give','A',2),(115,'Most','A',2),(116,'Very','A',2),(117,'After','A',2),(118,'Thing','A',2),(119,'Our','A',2),(120,'Just','A',2),(121,'Name','A',2),(122,'Good','A',2),(123,'Sentence','A',2),(124,'Man','A',2),(125,'Think','A',2),(126,'Say','B',2),(127,'Great','B',2),(128,'Where','B',2),(129,'Help','B',2),(130,'Through','B',2),(131,'Much','B',2),(132,'Before','B',2),(133,'Line','B',2),(134,'Right','B',2),(135,'Too','B',2),(136,'Means','B',2),(137,'Old','B',2),(138,'Any','B',2),(139,'Same','B',2),(140,'Tell','B',2),(141,'Boy','B',2),(142,'Following','B',2),(143,'Came','B',2),(144,'Want','B',2),(145,'Show','B',2),(146,'Also','B',2),(147,'Around','B',2),(148,'Farm','B',2),(149,'Three','B',2),(150,'Small','B',2),(151,'Set','C',2),(152,'Put','C',2),(153,'End','C',2),(154,'Does','C',2),(155,'Another','C',2),(156,'Well','C',2),(157,'Large','C',2),(158,'Must','C',2),(159,'Big','C',2),(160,'Even','C',2),(161,'Such','C',2),(162,'Because','C',2),(163,'Turn','C',2),(164,'Here','C',2),(165,'Why','C',2),(166,'Asked','C',2),(167,'Went','C',2),(168,'Men','C',2),(169,'Read','C',2),(170,'Need','C',2),(171,'Land','C',2),(172,'Different','C',2),(173,'Home','C',2),(174,'Us','C',2),(175,'Move','C',2),(176,'Try','D',2),(177,'Kind','D',2),(178,'Hand','D',2),(179,'Picture','D',2),(180,'Again','D',2),(181,'Change','D',2),(182,'Off','D',2),(183,'Play','D',2),(184,'Spell','D',2),(185,'Air','D',2),(186,'Away','D',2),(187,'Animals','D',2),(188,'House','D',2),(189,'POint','D',2),(190,'Page','D',2),(191,'Letters','D',2),(192,'Mother','D',2),(193,'Answer','D',2),(194,'Found','D',2),(195,'Study','D',2),(196,'Still','D',2),(197,'Learn','D',2),(198,'Should','D',2),(199,'America','D',2),(200,'World','D',2),(201,'High','A',3),(202,'Every','A',3),(203,'Near','A',3),(204,'Add','A',3),(205,'Food','A',3),(206,'Between','A',3),(207,'Own','A',3),(208,'Below','A',3),(209,'Country','A',3),(210,'Plants','A',3),(211,'Last','A',3),(212,'School','A',3),(213,'Father','A',3),(214,'Keep','A',3),(215,'Trees','A',3),(216,'Never','A',3),(217,'Started','A',3),(218,'City','A',3),(219,'Earth','A',3),(220,'Eyes','A',3),(221,'Light','A',3),(222,'Thought','A',3),(223,'Head','A',3),(224,'Under','A',3),(225,'Story','A',3),(226,'Saw','B',3),(227,'Left','B',3),(228,'Dont','B',3),(229,'Few','B',3),(230,'While','B',3),(231,'Along','B',3),(232,'Might','B',3),(233,'Close','B',3),(234,'Something','B',3),(235,'Seemed','B',3),(236,'Next','B',3),(237,'Hard','B',3),(238,'Open','B',3),(239,'Example','B',3),(240,'Beginning','B',3),(241,'Life','B',3),(242,'Always','B',3),(243,'Those','B',3),(244,'Both','B',3),(245,'Paper','B',3),(246,'Together','B',3),(247,'Got','B',3),(248,'Group','B',3),(249,'Often','B',3),(250,'Run','B',3),(251,'Important','C',3),(252,'Until','C',3),(253,'Children','C',3),(254,'Side','C',3),(255,'Feet','C',3),(256,'Car','C',3),(257,'Miles','C',3),(258,'Night','C',3),(259,'Walked','C',3),(260,'White','C',3),(261,'Sea','C',3),(262,'Began','C',3),(263,'Grow','C',3),(264,'Took','C',3),(265,'River','C',3),(266,'Four','C',3),(267,'Carry','C',3),(268,'State','C',3),(269,'Once','C',3),(270,'Book','C',3),(271,'Hear','C',3),(272,'Stop','C',3),(273,'Without','C',3),(274,'Second','C',3),(275,'Later','C',3),(276,'Miss','D',3),(277,'Idea','D',3),(278,'Enough','D',3),(279,'Eat','D',3),(280,'Face','D',3),(281,'Watch','D',3),(282,'Far','D',3),(283,'Indians','D',3),(284,'Really','D',3),(285,'almost','D',3),(286,'Let','D',3),(287,'Above','D',3),(288,'Girl','D',3),(289,'Sometimes','D',3),(290,'Mountains','D',3),(291,'Cut','D',3),(292,'Young','D',3),(293,'Talk','D',3),(294,'Soon','D',3),(295,'List','D',3),(296,'Song','D',3),(297,'Being','D',3),(298,'Leave','D',3),(299,'Family','D',3),(300,'It\'s','D',3),(301,'Body','A',4),(302,'Music','A',4),(303,'Color','A',4),(304,'Stand','A',4),(305,'Sun','A',4),(306,'Questions','A',4),(307,'Fish','A',4),(308,'Area','A',4),(309,'Mark','A',4),(310,'Dog','A',4),(311,'Horse','A',4),(312,'Birds','A',4),(313,'Problem','A',4),(314,'Complete','A',4),(315,'Room','A',4),(316,'Knew','A',4),(317,'Since','A',4),(318,'Ever','A',4),(319,'Piece','A',4),(320,'Told','A',4),(321,'Usually','A',4),(322,'Didn\'t','A',4),(323,'Friends','A',4),(324,'Easy','A',4),(325,'Heard','A',4),(326,'Order','B',4),(327,'red','B',4),(328,'Door','B',4),(329,'Sure','B',4),(330,'Become','B',4),(331,'Top','B',4),(332,'Ship','B',4),(333,'Across','B',4),(334,'today','B',4),(335,'During','B',4),(336,'Short','B',4),(337,'Better','B',4),(338,'Best','B',4),(339,'Hower','B',4),(340,'Low','B',4),(341,'Hours','B',4),(342,'Black','B',4),(343,'Products','B',4),(344,'Happened','B',4),(345,'Whole','B',4),(346,'Measure','B',4),(347,'Remember','B',4),(348,'Early','B',4),(349,'Waves','B',4),(350,'Reached','B',4),(351,'Listen','C',4),(352,'Wind','C',4),(353,'Rock','C',4),(354,'Space','C',4),(355,'Covered','C',4),(356,'Fast','C',4),(357,'Several','C',4),(358,'Hold','C',4),(359,'Himself','C',4),(360,'Toward','C',4),(361,'Five','C',4),(362,'Step','C',4),(363,'Morning','C',4),(364,'Passed','C',4),(365,'Vowel','C',4),(366,'True','C',4),(367,'Hundred','C',4),(368,'Against','C',4),(369,'Pattern','C',4),(370,'Numeral','C',4),(371,'Table','C',4),(372,'North','C',4),(373,'Slowly','C',4),(374,'Money','C',4),(375,'Map','C',4),(376,'Busy','D',4),(377,'Pulled','D',4),(378,'Draw','D',4),(379,'Voice','D',4),(380,'Seen','D',4),(381,'Cold','D',4),(382,'Cried','D',4),(383,'Plan','D',4),(384,'Notice','D',4),(385,'South','D',4),(386,'Sing','D',4),(387,'War','D',4),(388,'Ground','D',4),(389,'Fall','D',4),(390,'King','D',4),(391,'Town','D',4),(392,'I\'ll','D',4),(393,'Unit','D',4),(394,'Figure','D',4),(395,'Certain','D',4),(396,'Field','D',4),(397,'Travel','D',4),(398,'Wood','D',4),(399,'Fire','D',4),(400,'Upon','D',4),(401,'Done','A',5),(402,'English','A',5),(403,'Road','A',5),(404,'Halt','A',5),(405,'Ten','A',5),(406,'Fly','A',5),(407,'Gave','A',5),(408,'Box','A',5),(409,'Finally','A',5),(410,'Wait','A',5),(411,'Correct','A',5),(412,'Oh','A',5),(413,'Quickly','A',5),(414,'Person','A',5),(415,'Became','A',5),(416,'Shown','A',5),(417,'Minutes','A',5),(418,'Strong','A',5),(419,'Verb','A',5),(420,'Stars','A',5),(421,'Front','A',5),(422,'Feel','A',5),(423,'Fact','A',5),(424,'Inches','A',5),(425,'Street','A',5),(426,'decided','B',5),(427,'Contain','B',5),(428,'Course','B',5),(429,'Surface','B',5),(430,'Produce','B',5),(431,'Building','B',5),(432,'Ocean','B',5),(433,'Class','B',5),(434,'Note','B',5),(435,'Nothing','B',5),(436,'rest','B',5),(437,'Carefully','B',5),(438,'Scientist','B',5),(439,'Inside','B',5),(440,'Wheels','B',5),(441,'Stay','B',5),(442,'Green','B',5),(443,'Known','B',5),(444,'Island','B',5),(445,'Week','B',5),(446,'Less','B',5),(447,'Machine','B',5),(448,'Base','B',5),(449,'Ago','B',5),(450,'Stood','B',5),(451,'Plane','C',5),(452,'System','C',5),(453,'Behind','C',5),(454,'Ran','C',5),(455,'Round','C',5),(456,'Boat','C',5),(457,'Game','C',5),(458,'Force','C',5),(459,'Brought','C',5),(460,'Understand','C',5),(461,'Warm','C',5),(462,'Common','C',5),(463,'Bring','C',5),(464,'Explain','C',5),(465,'Dry','C',5),(466,'Though','C',5),(467,'Language','C',5),(468,'Shape','C',5),(469,'Deep','C',5),(470,'Thousands','C',5),(471,'Yes','C',5),(472,'Clear','C',5),(473,'Equation','C',5),(474,'Yet','C',5),(475,'Government','C',5),(476,'Filled','D',5),(477,'Heat','D',5),(478,'Full','D',5),(479,'Hot','D',5),(480,'Check','D',5),(481,'Object','D',5),(482,'Bread','D',5),(483,'Rule','D',5),(484,'Among','D',5),(485,'Noun','D',5),(486,'Power','D',5),(487,'Cannot','D',5),(488,'Able','D',5),(489,'Six','D',5),(490,'Size','D',5),(491,'dark','D',5),(492,'Ball','D',5),(493,'Material','D',5),(494,'Special','D',5),(495,'Heavy','D',5),(496,'Fine','D',5),(497,'Pair','D',5),(498,'Circle','D',5),(499,'Include','D',5),(500,'Built','D',5),(501,'Can\'t','A',6),(502,'Matter','A',6),(503,'Square','A',6),(504,'Syllables','A',6),(505,'Perhaps','A',6),(506,'Bill','A',6),(507,'Felt','A',6),(508,'Suddenly','A',6),(509,'test','A',6),(510,'Direction','A',6),(511,'Center','A',6),(512,'Farmers','A',6),(513,'Ready','A',6),(514,'Anything','A',6),(515,'Divided','A',6),(516,'General','A',6),(517,'Energy','A',6),(518,'Subject','A',6),(519,'Europe','A',6),(520,'Moon','A',6),(521,'Region','A',6),(522,'Return','A',6),(523,'Believe','A',6),(524,'Dance','A',6),(525,'Members','A',6),(526,'Picked','B',6),(527,'Simple','B',6),(528,'Cells','B',6),(529,'Paint','B',6),(530,'Mind','B',6),(531,'Love','B',6),(532,'Cause','B',6),(533,'Rain','B',6),(534,'Exercise','B',6),(535,'Eggs','B',6),(536,'Train','B',6),(537,'Blue','B',6),(538,'Wish','B',6),(539,'Drop','B',6),(540,'Developed','B',6),(541,'Window','B',6),(542,'Difference','B',6),(543,'Distant','B',6),(544,'Heart','B',6),(545,'Sit','B',6),(546,'Sum','B',6),(547,'Summer','B',6),(548,'Wall','B',6),(549,'Forest','B',6),(550,'Probably','B',6),(551,'Legs','C',6),(552,'Sat','C',6),(553,'Main','C',6),(554,'Winter','C',6),(555,'Wide','C',6),(556,'Written','C',6),(557,'Length','C',6),(558,'Reason','C',6),(559,'kept','C',6),(560,'Interest','C',6),(561,'Arms','C',6),(562,'Brother','C',6),(563,'Race','C',6),(564,'Present','C',6),(565,'Beautiful','C',6),(566,'Store','C',6),(567,'Job','C',6),(568,'Edge','C',6),(569,'Past','C',6),(570,'Sign','C',6),(571,'Record','C',6),(572,'Finished','C',6),(573,'Discovered','C',6),(574,'Wild','C',6),(575,'Happy','C',6),(576,'Beside','D',6),(577,'Gone','D',6),(578,'Sky','D',6),(579,'Glass','D',6),(580,'Million','D',6),(581,'West','D',6),(582,'Lay','D',6),(583,'Weather','D',6),(584,'Root','D',6),(585,'Instruments','D',6),(586,'Meet','D',6),(587,'Third','D',6),(588,'Months','D',6),(589,'Paragraph','D',6),(590,'Raised','D',6),(591,'Represent','D',6),(592,'Soft','D',6),(593,'Whether','D',6),(594,'Clothers','D',6),(595,'Flowers','D',6),(596,'Shall','D',6),(597,'Teacher','D',6),(598,'Held','D',6),(599,'Describe','D',6),(600,'Drive','D',6),(601,'Cross','A',7),(602,'Speak','A',7),(603,'Solve','A',7),(604,'Appear','A',7),(605,'Metal','A',7),(606,'Son','A',7),(607,'Either','A',7),(608,'Ice','A',7),(609,'Sleep','A',7),(610,'Village','A',7),(611,'Factors','A',7),(612,'Result','A',7),(613,'Jumped','A',7),(614,'Snow','A',7),(615,'Ride','A',7),(616,'Care','A',7),(617,'Floor','A',7),(618,'Hill','A',7),(619,'Pushed','A',7),(620,'Baby','A',7),(621,'Buy','A',7),(622,'Century','A',7),(623,'Outside','A',7),(624,'Everything','A',7),(625,'Tall','A',7),(626,'Already','B',7),(627,'Instead','B',7),(628,'Phrase','B',7),(629,'Soil','B',7),(630,'Bed','B',7),(631,'Copy','B',7),(632,'Free','B',7),(633,'Hope','B',7),(634,'Spring','B',7),(635,'Case','B',7),(636,'Laughed','B',7),(637,'Nation','B',7),(638,'Quite','B',7),(639,'Type','B',7),(640,'Themselves','B',7),(641,'Temperature','B',7),(642,'Bright','B',7),(643,'Lead','B',7),(644,'Everyone','B',7),(645,'Method','B',7),(646,'Section','B',7),(647,'Lake','B',7),(648,'Consonant','B',7),(649,'Within','B',7),(650,'Dictionary','B',7),(651,'Hair','C',7),(652,'Age','C',7),(653,'Amount','C',7),(654,'Scale','C',7),(655,'Pounds','C',7),(656,'Although','C',7),(657,'Per','C',7),(658,'Broken','C',7),(659,'Moment','C',7),(660,'Tiny','C',7),(661,'Possible','C',7),(662,'Gold','C',7),(663,'Milk','C',7),(664,'Quiet','C',7),(665,'Natural','C',7),(666,'Lot','C',7),(667,'Stone','C',7),(668,'Act','C',7),(669,'Build','C',7),(670,'Middle','C',7),(671,'Speed','C',7),(672,'Count','C',7),(673,'Cat','C',7),(674,'Someone','C',7),(675,'Sail','C',7),(676,'Rolled','D',7),(677,'Bear','D',7),(678,'Wonder','D',7),(679,'Smiled','D',7),(680,'Angle','D',7),(681,'Fraction','D',7),(682,'Africa','D',7),(683,'Killed','D',7),(684,'Melody','D',7),(685,'Bottom','D',7),(686,'Trip','D',7),(687,'Hole','D',7),(688,'Poor','D',7),(689,'Let\'s','D',7),(690,'Fight','D',7),(691,'Surprise','D',7),(692,'French','D',7),(693,'Died','D',7),(694,'Beat','D',7),(695,'Exactly','D',7),(696,'Remain','D',7),(697,'Dress','D',7),(698,'Iron','D',7),(699,'Couldn\'t','D',7),(700,'Fingers','D',7),(701,'Row','A',8),(702,'Least','A',8),(703,'Catch','A',8),(704,'Climbed','A',8),(705,'Wrote','A',8),(706,'Shouted','A',8),(707,'Continued','A',8),(708,'Itself','A',8),(709,'Else','A',8),(710,'Plains','A',8),(711,'Gas','A',8),(712,'England','A',8),(713,'Burning','A',8),(714,'Design','A',8),(715,'Joined','A',8),(716,'Foot','A',8),(717,'Law','A',8),(718,'Ears','A',8),(719,'Grass','A',8),(720,'You\'re','A',8),(721,'Grew','A',8),(722,'Skin','A',8),(723,'Valley','A',8),(724,'Cents','A',8),(725,'Key','A',8),(726,'President','B',8),(727,'Brown','B',8),(728,'Trouble','B',8),(729,'Cool','B',8),(730,'Cloud','B',8),(731,'Lost','B',8),(732,'Sent','B',8),(733,'Symbols','B',8),(734,'Wear','B',8),(735,'Bad','B',8),(736,'Save','B',8),(737,'Experiment','B',8),(738,'Engine','B',8),(739,'Alone','B',8),(740,'Drawing','B',8),(741,'East','B',8),(742,'Pay','B',8),(743,'Single','B',8),(744,'Touch','B',8),(745,'Information','B',8),(746,'Express','B',8),(747,'Mouth','B',8),(748,'Yard','B',8),(749,'Equal','B',8),(750,'Decimal','B',8),(751,'Yourself','C',8),(752,'Control','C',8),(753,'Practice','C',8),(754,'Report','C',8),(755,'Straight','C',8),(756,'Rise','C',8),(757,'Statement','C',8),(758,'Stick','C',8),(759,'Party','C',8),(760,'Seeds','C',8),(761,'Suppose','C',8),(762,'Woman','C',8),(763,'Coast','C',8),(764,'Bank','C',8),(765,'Period','C',8),(766,'Wire','C',8),(767,'Choose','C',8),(768,'Clean','C',8),(769,'Visit','C',8),(770,'Bit','C',8),(771,'Whose','C',8),(772,'Received','C',8),(773,'Garden','C',8),(774,'Please','C',8),(775,'Strange','C',8),(776,'Caught','D',8),(777,'fell','D',8),(778,'team','D',8),(779,'God','D',8),(780,'Captain','D',8),(781,'Direct','D',8),(782,'Ring','D',8),(783,'Serve','D',8),(784,'Child','D',8),(785,'Desert','D',8),(786,'Increase','D',8),(787,'History','D',8),(788,'cost','D',8),(789,'Maybe','D',8),(790,'Business','D',8),(791,'Separate','D',8),(792,'Break','D',8),(793,'Uncle','D',8),(794,'Hunting','D',8),(795,'Flow','D',8),(796,'Lady','D',8),(797,'Students','D',8),(798,'Human','D',8),(799,'Art','D',8),(800,'Feeling','D',8),(801,'Supply','A',9),(802,'Corner','A',9),(803,'Electric','A',9),(804,'Insects','A',9),(805,'Crops','A',9),(806,'Tone','A',9),(807,'Hit','A',9),(808,'Sand','A',9),(809,'Doctor','A',9),(810,'Provide','A',9),(811,'Thus','A',9),(812,'Won\'t','A',9),(813,'Cook','A',9),(814,'Bones','A',9),(815,'Tail','A',9),(816,'Board','A',9),(817,'Modern','A',9),(818,'Compound','A',9),(819,'Mine','A',9),(820,'Wasn\'t','A',9),(821,'Fit','A',9),(822,'Addition','A',9),(823,'Belong','A',9),(824,'Safe','A',9),(825,'Soldiers','A',9),(826,'Guess','B',9),(827,'Silent','B',9),(828,'Trade','B',9),(829,'Rather','B',9),(830,'Compare','B',9),(831,'Crowd','B',9),(832,'Poem','B',9),(833,'Enjoy','B',9),(834,'Elements','B',9),(835,'Indicate','B',9),(836,'Except','B',9),(837,'Expect','B',9),(838,'Flat','B',9),(839,'Seven','B',9),(840,'Interesting','B',9),(841,'Sense','B',9),(842,'String','B',9),(843,'Blow','B',9),(844,'Famous','B',9),(845,'Value','B',9),(846,'Wings','B',9),(847,'Movement','B',9),(848,'Pole','B',9),(849,'Exciting','B',9),(850,'Branches','B',9),(851,'Thick','C',9),(852,'Blood','C',9),(853,'Lie','C',9),(854,'Spot','C',9),(855,'Bell','C',9),(856,'Fun','C',9),(857,'Loud','C',9),(858,'consider','C',9),(859,'Suggested','C',9),(860,'Thin','C',9),(861,'Position','C',9),(862,'Entered','C',9),(863,'Fruit','C',9),(864,'Tied','C',9),(865,'Rich','C',9),(866,'Dollars','C',9),(867,'Send','C',9),(868,'Sight','C',9),(869,'Chief','C',9),(870,'Japanese','C',9),(871,'Stream','C',9),(872,'Planets','C',9),(873,'Rhythm','C',9),(874,'Eight','C',9),(875,'Science','C',9),(876,'Major','D',9),(877,'Observe','D',9),(878,'Tube','D',9),(879,'Necessary','D',9),(880,'Weight','D',9),(881,'Meat','D',9),(882,'Lifted','D',9),(883,'Process','D',9),(884,'Army','D',9),(885,'Hat','D',9),(886,'Property','D',9),(887,'Particular','D',9),(888,'Swim','D',9),(889,'Terms','D',9),(890,'Current','D',9),(891,'Park','D',9),(892,'Sell','D',9),(893,'Shoulder','D',9),(894,'Industry','D',9),(895,'Wash','D',9),(896,'Block','D',9),(897,'Spread','D',9),(898,'Cattle','D',9),(899,'Wife','D',9),(900,'Sharp','D',9),(901,'Company','A',10),(902,'Radio','A',10),(903,'We\'ll','A',10),(904,'Action','A',10),(905,'Capital','A',10),(906,'Factories','A',10),(907,'Settled','A',10),(908,'Yellow','A',10),(909,'Isn\'t','A',10),(910,'Southern','A',10),(911,'Truck','A',10),(912,'Fair','A',10),(913,'Printed','A',10),(914,'Wouldn\'t','A',10),(915,'Ahead','A',10),(916,'Chance','A',10),(917,'Born','A',10),(918,'Level','A',10),(919,'Triangle','A',10),(920,'Molecules','A',10),(921,'France','A',10),(922,'Repeated','A',10),(923,'Column','A',10),(924,'Western','A',10),(925,'Church','A',10),(926,'Sister','B',10),(927,'Oxygen','B',10),(928,'Plural','B',10),(929,'Various','B',10),(930,'Agreed','B',10),(931,'Opposite','B',10),(932,'Wrong','B',10),(933,'Chart','B',10),(934,'Prepared','B',10),(935,'Pretty','B',10),(936,'Solution','B',10),(937,'Fresh','B',10),(938,'Shop','B',10),(939,'Suffix','B',10),(940,'Especially','B',10),(941,'Shoes','B',10),(942,'Actually','B',10),(943,'Nose','B',10),(944,'Afraid','B',10),(945,'Dead','B',10),(946,'Sugar','B',10),(947,'Adjective','B',10),(948,'Fig','B',10),(949,'Office','B',10),(950,'Huge','B',10),(951,'Gun','C',10),(952,'Similar','C',10),(953,'Death','C',10),(954,'Score','C',10),(955,'Forward','C',10),(956,'Stretched','C',10),(957,'Experience','C',10),(958,'Rose','C',10),(959,'Allow','C',10),(960,'Fear','C',10),(961,'Workers','C',10),(962,'Washington','C',10),(963,'Greek','C',10),(964,'Women','C',10),(965,'Bought','C',10),(966,'Led','C',10),(967,'March','C',10),(968,'Northern','C',10),(969,'Create','C',10),(970,'British','C',10),(971,'Difficult','C',10),(972,'Match','C',10),(973,'Win','C',10),(974,'Doesn\'t','C',10),(975,'Steel','C',10),(976,'Total','D',10),(977,'Deal','D',10),(978,'Determine','D',10),(979,'Evening','D',10),(980,'Nor','D',10),(981,'Rope','D',10),(982,'Cotton','D',10),(983,'Apple','D',10),(984,'Details','D',10),(985,'Entire','D',10),(986,'Corn','D',10),(987,'Substances','D',10),(988,'Smell','D',10),(989,'Tools','D',10),(990,'Conditions','D',10),(991,'Cows','D',10),(992,'Track','D',10),(993,'Arrived','D',10),(994,'Located','D',10),(995,'Sir','D',10),(996,'Seat','D',10),(997,'Division','D',10),(998,'Effect','D',10),(999,'Underline','D',10),(1000,'View','D',10);
/*!40000 ALTER TABLE `frys_1000` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-10 21:50:29