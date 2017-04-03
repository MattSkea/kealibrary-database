/************************************/
/********DROPPING DATABASES**********/
/***/
DROP DATABASE IF EXISTS kealibrary;
CREATE DATABASE IF NOT EXISTS kealibrary;
/***/


DROP TABLE IF EXISTS kealibrary.members;
DROP TABLE IF EXISTS kealibrary.employees;
DROP TABLE IF EXISTS kealibrary.cities;
DROP TABLE IF EXISTS kealibrary.salaries;
DROP TABLE IF EXISTS kealibrary.hours;
DROP TABLE IF EXISTS kealibrary.books;
DROP TABLE IF EXISTS kealibrary.authors;
DROP TABLE IF EXISTS kealibrary.categories;
DROP TABLE IF EXISTS kealibrafdpiipry.genres;
DROP TABLE IF EXISTS kealibrary.lents;
/***/

/************************************/
/**********CREATOMG TABLES***********/
CREATE TABLE kealibrary.members(
	cpr INT(10) NOT NULL,
 city_zip INT NOT NULL,
 fname VARCHAR(30) NOT NULL,
 lname VARCHAR(30) NOT NULL,
 email VARCHAR(20) NOT NULL,
 gender CHAR(1),
 bdate DATE,
 address VARCHAR(30) NOT NULL,
 status BOOL NOT NULL DEFAULT 1,
 image LONGTEXT,
 PRIMARY KEY (cpr)
);

CREATE TABLE kealibrary.employees(
 cpr INT(10) NOT NULL,
 city_zip INT NOT NULL,
 er_id INT NOT NULL,
 fname VARCHAR(30) NOT NULL,
 lname VARCHAR(30) NOT NULL,
 email VARCHAR(20) NOT NULL,
 gender CHAR(1),
 bdate DATE,
 address VARCHAR(30) NOT NULL,
 image LONGTEXT,
 PRIMARY KEY (cpr)
);

CREATE TABLE kealibrary.e_roles(
id INT(2) NOT NULL,
role VARCHAR (20),
 PRIMARY KEY(id)
);

CREATE TABLE kealibrary.cities(
	zip int(4) NOT NULL,
	city VARCHAR(15) NOT NULL,
	PRIMARY KEY (zip)
);

CREATE TABLE kealibrary.salaries(
	id int(6) NOT NULL AUTO_INCREMENT,
 employee_cpr INT NOT NULL,
 amount DECIMAL(10, 2),
 from_d DATE,
 PRIMARY KEY(id)
);

CREATE TABLE kealibrary.hours(
	id int(10) NOT NULL AUTO_INCREMENT,
 employee_cpr INT NOT NULL,
 from_dt DATETIME,
 to_dt DATETIME,
 PRIMARY KEY(id)
);


CREATE TABLE kealibrary.book(
	id INT(10) NOT NULL AUTO_INCREMENT,
    b_isbn INT NOT NULL,
    status BOOL NOT NULL DEFAULT 0,
    PRIMARY KEY(id)
);

CREATE TABLE kealibrary.books(
	isbn INT(13) NOT NULL,
 author_id INT NOT NULL,
 category_id INT NOT NULL,
 genre_id INT NOT NULL,
 title VARCHAR(50) NOT NULL,
 edition INT(4),
 publish_d DATE,
 archived_d DATE,
 total_pages INT(4),
 copies INT (3),
 image LONGTEXT,
 PRIMARY KEY(isbn)
);

CREATE TABLE kealibrary.authors(
	id INT(6) NOT NULL AUTO_INCREMENT,
 fname VARCHAR(30) NOT NULL,
 lname VARCHAR(30) NOT NULL,
 b_date DATE,
 d_date DATE,
 excerpt VARCHAR(800),
 image LONGTEXT,
 PRIMARY KEY(id)
);

CREATE TABLE kealibrary.categories(
	id INT(1) NOT NULL AUTO_INCREMENT,
 category VARCHAR(10),
 PRIMARY KEY(id)
);

CREATE TABLE kealibrary.genres(
	id int(3) NOT NULL AUTO_INCREMENT,
 genre VARCHAR(50),
 PRIMARY KEY(id)
);

CREATE TABLE kealibrary.lents(
	id int(6) NOT NULL AUTO_INCREMENT,
 member_cpr INT NOT NULL,
 book_id INT NOT NULL,
 lent_d DATETIME,
 return_d DATETIME,
 status BOOL NOT NULL DEFAULT 1,
 PRIMARY KEY(id)
);


/************************************/
/**********ALTERING TABLES***********/
ALTER TABLE kealibrary.members
ADD FOREIGN KEY (city_zip) REFERENCES kealibrary.cities(zip)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kealibrary.employees
ADD FOREIGN KEY (city_zip) REFERENCES kealibrary.cities(zip)
ON DELETE CASCADE
ON UPDATE CASCADE,
ADD FOREIGN KEY (er_id) REFERENCES kealibrary.e_roles(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kealibrary.hours
ADD FOREIGN KEY (employee_cpr) REFERENCES kealibrary.employees(cpr)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kealibrary.salaries 
ADD FOREIGN KEY(employee_cpr) REFERENCES kealibrary.employees(cpr) 
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kealibrary.book
ADD FOREIGN KEY (b_isbn) REFERENCES kealibrary.books(isbn) 
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kealibrary.books
ADD FOREIGN KEY (author_id) REFERENCES kealibrary.authors(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
ADD FOREIGN KEY (category_id) REFERENCES kealibrary.categories(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
ADD FOREIGN KEY (genre_id) REFERENCES kealibrary.genres(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kealibrary.lents
ADD FOREIGN KEY (member_cpr) REFERENCES kealibrary.members(cpr)
ON DELETE CASCADE
ON UPDATE CASCADE,
ADD FOREIGN KEY (book_id) REFERENCES kealibrary.book(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

/************************************/
/***********INSERTING DATA***********/
SET FOREIGN_KEY_CHECKS=0;

INSERT INTO kealibrary.cities VALUES (800,"Høje Taastrup");
INSERT INTO kealibrary.cities VALUES (877,"Valby");
INSERT INTO kealibrary.cities VALUES (900,"København C");
INSERT INTO kealibrary.cities VALUES (910,"København C");
INSERT INTO kealibrary.cities VALUES (929,"København C");
INSERT INTO kealibrary.cities VALUES (1000,"København K");
INSERT INTO kealibrary.cities VALUES (1001,"København K");
INSERT INTO kealibrary.cities VALUES (1002,"København K");
INSERT INTO kealibrary.cities VALUES (1003,"København K");
INSERT INTO kealibrary.cities VALUES (1004,"København K");
INSERT INTO kealibrary.cities VALUES (1005,"København K");
INSERT INTO kealibrary.cities VALUES (1006,"København K");
INSERT INTO kealibrary.cities VALUES (1007,"København K");
INSERT INTO kealibrary.cities VALUES (1008,"København K");
INSERT INTO kealibrary.cities VALUES (1009,"København K");
INSERT INTO kealibrary.cities VALUES (1010,"København K");
INSERT INTO kealibrary.cities VALUES (1011,"København K");
INSERT INTO kealibrary.cities VALUES (1012,"København K");
INSERT INTO kealibrary.cities VALUES (1013,"København K");
INSERT INTO kealibrary.cities VALUES (1014,"København K");
INSERT INTO kealibrary.cities VALUES (1015,"København K");
INSERT INTO kealibrary.cities VALUES (1016,"København K");
INSERT INTO kealibrary.cities VALUES (1017,"København K");
INSERT INTO kealibrary.cities VALUES (1018,"København K");
INSERT INTO kealibrary.cities VALUES (1019,"København K");
INSERT INTO kealibrary.cities VALUES (1020,"København K");
INSERT INTO kealibrary.cities VALUES (1021,"København K");
INSERT INTO kealibrary.cities VALUES (1022,"København K");
INSERT INTO kealibrary.cities VALUES (1023,"København K");
INSERT INTO kealibrary.cities VALUES (1024,"København K");
INSERT INTO kealibrary.cities VALUES (1025,"København K");
INSERT INTO kealibrary.cities VALUES (1026,"København K");
INSERT INTO kealibrary.cities VALUES (1045,"København K");
INSERT INTO kealibrary.cities VALUES (1050,"København K");
INSERT INTO kealibrary.cities VALUES (1051,"København K");
INSERT INTO kealibrary.cities VALUES (1052,"København K");
INSERT INTO kealibrary.cities VALUES (1053,"København K");
INSERT INTO kealibrary.cities VALUES (1054,"København K");
INSERT INTO kealibrary.cities VALUES (1055,"København K");
INSERT INTO kealibrary.cities VALUES (1056,"København K");
INSERT INTO kealibrary.cities VALUES (1057,"København K");
INSERT INTO kealibrary.cities VALUES (1058,"København K");
INSERT INTO kealibrary.cities VALUES (1059,"København K");
INSERT INTO kealibrary.cities VALUES (1060,"København K");
INSERT INTO kealibrary.cities VALUES (1061,"København K");
INSERT INTO kealibrary.cities VALUES (1062,"København K");
INSERT INTO kealibrary.cities VALUES (1063,"København K");
INSERT INTO kealibrary.cities VALUES (1064,"København K");
INSERT INTO kealibrary.cities VALUES (1065,"København K");
INSERT INTO kealibrary.cities VALUES (1066,"København K");
INSERT INTO kealibrary.cities VALUES (1067,"København K");
INSERT INTO kealibrary.cities VALUES (1068,"København K");
INSERT INTO kealibrary.cities VALUES (1069,"København K");
INSERT INTO kealibrary.cities VALUES (1070,"København K");
INSERT INTO kealibrary.cities VALUES (1071,"København K");
INSERT INTO kealibrary.cities VALUES (1072,"København K");
INSERT INTO kealibrary.cities VALUES (1073,"København K");
INSERT INTO kealibrary.cities VALUES (1074,"København K");
INSERT INTO kealibrary.cities VALUES (1092,"København K");
INSERT INTO kealibrary.cities VALUES (1093,"København K");
INSERT INTO kealibrary.cities VALUES (1095,"København K");
INSERT INTO kealibrary.cities VALUES (1098,"København K");
INSERT INTO kealibrary.cities VALUES (1100,"København K");
INSERT INTO kealibrary.cities VALUES (1101,"København K");
INSERT INTO kealibrary.cities VALUES (1102,"København K");
INSERT INTO kealibrary.cities VALUES (1103,"København K");
INSERT INTO kealibrary.cities VALUES (1104,"København K");
INSERT INTO kealibrary.cities VALUES (1105,"København K");
INSERT INTO kealibrary.cities VALUES (1106,"København K");
INSERT INTO kealibrary.cities VALUES (1107,"København K");
INSERT INTO kealibrary.cities VALUES (1110,"København K");
INSERT INTO kealibrary.cities VALUES (1111,"København K");
INSERT INTO kealibrary.cities VALUES (1112,"København K");
INSERT INTO kealibrary.cities VALUES (1113,"København K");
INSERT INTO kealibrary.cities VALUES (1114,"København K");
INSERT INTO kealibrary.cities VALUES (1115,"København K");
INSERT INTO kealibrary.cities VALUES (1116,"København K");
INSERT INTO kealibrary.cities VALUES (1117,"København K");
INSERT INTO kealibrary.cities VALUES (1118,"København K");
INSERT INTO kealibrary.cities VALUES (1119,"København K");
INSERT INTO kealibrary.cities VALUES (1120,"København K");
INSERT INTO kealibrary.cities VALUES (1121,"København K");
INSERT INTO kealibrary.cities VALUES (1122,"København K");
INSERT INTO kealibrary.cities VALUES (1123,"København K");
INSERT INTO kealibrary.cities VALUES (1124,"København K");
INSERT INTO kealibrary.cities VALUES (1125,"København K");
INSERT INTO kealibrary.cities VALUES (1126,"København K");
INSERT INTO kealibrary.cities VALUES (1127,"København K");
INSERT INTO kealibrary.cities VALUES (1128,"København K");
INSERT INTO kealibrary.cities VALUES (1129,"København K");
INSERT INTO kealibrary.cities VALUES (1130,"København K");
INSERT INTO kealibrary.cities VALUES (1131,"København K");
INSERT INTO kealibrary.cities VALUES (1140,"København K");
INSERT INTO kealibrary.cities VALUES (1147,"København K");
INSERT INTO kealibrary.cities VALUES (1148,"København K");
INSERT INTO kealibrary.cities VALUES (1150,"København K");
INSERT INTO kealibrary.cities VALUES (1151,"København K");
INSERT INTO kealibrary.cities VALUES (1152,"København K");
INSERT INTO kealibrary.cities VALUES (1153,"København K");
INSERT INTO kealibrary.cities VALUES (1154,"København K");
INSERT INTO kealibrary.cities VALUES (1155,"København K");
INSERT INTO kealibrary.cities VALUES (1156,"København K");
INSERT INTO kealibrary.cities VALUES (1157,"København K");
INSERT INTO kealibrary.cities VALUES (1158,"København K");
INSERT INTO kealibrary.cities VALUES (1159,"København K");
INSERT INTO kealibrary.cities VALUES (1160,"København K");
INSERT INTO kealibrary.cities VALUES (1161,"København K");
INSERT INTO kealibrary.cities VALUES (1162,"København K");
INSERT INTO kealibrary.cities VALUES (1163,"København K");
INSERT INTO kealibrary.cities VALUES (1164,"København K");
INSERT INTO kealibrary.cities VALUES (1165,"København K");
INSERT INTO kealibrary.cities VALUES (1166,"København K");
INSERT INTO kealibrary.cities VALUES (1167,"København K");
INSERT INTO kealibrary.cities VALUES (1168,"København K");
INSERT INTO kealibrary.cities VALUES (1169,"København K");
INSERT INTO kealibrary.cities VALUES (1170,"København K");
INSERT INTO kealibrary.cities VALUES (1171,"København K");
INSERT INTO kealibrary.cities VALUES (1172,"København K");
INSERT INTO kealibrary.cities VALUES (1173,"København K");
INSERT INTO kealibrary.cities VALUES (1174,"København K");
INSERT INTO kealibrary.cities VALUES (1175,"København K");
INSERT INTO kealibrary.cities VALUES (1200,"København K");
INSERT INTO kealibrary.cities VALUES (1201,"København K");
INSERT INTO kealibrary.cities VALUES (1202,"København K");
INSERT INTO kealibrary.cities VALUES (1203,"København K");
INSERT INTO kealibrary.cities VALUES (1204,"København K");
INSERT INTO kealibrary.cities VALUES (1205,"København K");
INSERT INTO kealibrary.cities VALUES (1206,"København K");
INSERT INTO kealibrary.cities VALUES (1207,"København K");
INSERT INTO kealibrary.cities VALUES (1208,"København K");
INSERT INTO kealibrary.cities VALUES (1209,"København K");
INSERT INTO kealibrary.cities VALUES (1210,"København K");
INSERT INTO kealibrary.cities VALUES (1211,"København K");
INSERT INTO kealibrary.cities VALUES (1212,"København K");
INSERT INTO kealibrary.cities VALUES (1213,"København K");
INSERT INTO kealibrary.cities VALUES (1214,"København K");
INSERT INTO kealibrary.cities VALUES (1215,"København K");
INSERT INTO kealibrary.cities VALUES (1216,"København K");
INSERT INTO kealibrary.cities VALUES (1217,"København K");
INSERT INTO kealibrary.cities VALUES (1218,"København K");
INSERT INTO kealibrary.cities VALUES (1219,"København K");
INSERT INTO kealibrary.cities VALUES (1220,"København K");
INSERT INTO kealibrary.cities VALUES (1240,"København K");
INSERT INTO kealibrary.cities VALUES (1250,"København K");
INSERT INTO kealibrary.cities VALUES (1251,"København K");
INSERT INTO kealibrary.cities VALUES (1252,"København K");
INSERT INTO kealibrary.cities VALUES (1253,"København K");
INSERT INTO kealibrary.cities VALUES (1254,"København K");
INSERT INTO kealibrary.cities VALUES (1255,"København K");
INSERT INTO kealibrary.cities VALUES (1256,"København K");
INSERT INTO kealibrary.cities VALUES (1257,"København K");
INSERT INTO kealibrary.cities VALUES (1258,"København K");
INSERT INTO kealibrary.cities VALUES (1259,"København K");
INSERT INTO kealibrary.cities VALUES (1260,"København K");
INSERT INTO kealibrary.cities VALUES (1261,"København K");
INSERT INTO kealibrary.cities VALUES (1263,"København K");
INSERT INTO kealibrary.cities VALUES (1264,"København K");
INSERT INTO kealibrary.cities VALUES (1265,"København K");
INSERT INTO kealibrary.cities VALUES (1266,"København K");
INSERT INTO kealibrary.cities VALUES (1267,"København K");
INSERT INTO kealibrary.cities VALUES (1268,"København K");
INSERT INTO kealibrary.cities VALUES (1270,"København K");
INSERT INTO kealibrary.cities VALUES (1271,"København K");
INSERT INTO kealibrary.cities VALUES (1291,"København K");
INSERT INTO kealibrary.cities VALUES (1300,"København K");
INSERT INTO kealibrary.cities VALUES (1301,"København K");
INSERT INTO kealibrary.cities VALUES (1302,"København K");
INSERT INTO kealibrary.cities VALUES (1303,"København K");
INSERT INTO kealibrary.cities VALUES (1304,"København K");
INSERT INTO kealibrary.cities VALUES (1306,"København K");
INSERT INTO kealibrary.cities VALUES (1307,"København K");
INSERT INTO kealibrary.cities VALUES (1308,"København K");
INSERT INTO kealibrary.cities VALUES (1309,"København K");
INSERT INTO kealibrary.cities VALUES (1310,"København K");
INSERT INTO kealibrary.cities VALUES (1311,"København K");
INSERT INTO kealibrary.cities VALUES (1312,"København K");
INSERT INTO kealibrary.cities VALUES (1313,"København K");
INSERT INTO kealibrary.cities VALUES (1314,"København K");
INSERT INTO kealibrary.cities VALUES (1315,"København K");
INSERT INTO kealibrary.cities VALUES (1316,"København K");
INSERT INTO kealibrary.cities VALUES (1317,"København K");
INSERT INTO kealibrary.cities VALUES (1318,"København K");
INSERT INTO kealibrary.cities VALUES (1319,"København K");
INSERT INTO kealibrary.cities VALUES (1320,"København K");
INSERT INTO kealibrary.cities VALUES (1321,"København K");
INSERT INTO kealibrary.cities VALUES (1322,"København K");
INSERT INTO kealibrary.cities VALUES (1323,"København K");
INSERT INTO kealibrary.cities VALUES (1324,"København K");
INSERT INTO kealibrary.cities VALUES (1325,"København K");
INSERT INTO kealibrary.cities VALUES (1326,"København K");
INSERT INTO kealibrary.cities VALUES (1327,"København K");
INSERT INTO kealibrary.cities VALUES (1328,"København K");
INSERT INTO kealibrary.cities VALUES (1329,"København K");
INSERT INTO kealibrary.cities VALUES (1349,"København K");
INSERT INTO kealibrary.cities VALUES (1350,"København K");
INSERT INTO kealibrary.cities VALUES (1352,"København K");
INSERT INTO kealibrary.cities VALUES (1353,"København K");
INSERT INTO kealibrary.cities VALUES (1354,"København K");
INSERT INTO kealibrary.cities VALUES (1355,"København K");
INSERT INTO kealibrary.cities VALUES (1356,"København K");
INSERT INTO kealibrary.cities VALUES (1357,"København K");
INSERT INTO kealibrary.cities VALUES (1358,"København K");
INSERT INTO kealibrary.cities VALUES (1359,"København K");
INSERT INTO kealibrary.cities VALUES (1360,"København K");
INSERT INTO kealibrary.cities VALUES (1361,"København K");
INSERT INTO kealibrary.cities VALUES (1362,"København K");
INSERT INTO kealibrary.cities VALUES (1363,"København K");
INSERT INTO kealibrary.cities VALUES (1364,"København K");
INSERT INTO kealibrary.cities VALUES (1365,"København K");
INSERT INTO kealibrary.cities VALUES (1366,"København K");
INSERT INTO kealibrary.cities VALUES (1367,"København K");
INSERT INTO kealibrary.cities VALUES (1368,"København K");
INSERT INTO kealibrary.cities VALUES (1369,"København K");
INSERT INTO kealibrary.cities VALUES (1370,"København K");
INSERT INTO kealibrary.cities VALUES (1371,"København K");
INSERT INTO kealibrary.cities VALUES (1390,"København K");
INSERT INTO kealibrary.cities VALUES (1399,"København K");
INSERT INTO kealibrary.cities VALUES (1400,"København K");
INSERT INTO kealibrary.cities VALUES (1401,"København K");
INSERT INTO kealibrary.cities VALUES (1402,"København K");
INSERT INTO kealibrary.cities VALUES (1403,"København K");
INSERT INTO kealibrary.cities VALUES (1404,"København K");
INSERT INTO kealibrary.cities VALUES (1405,"København K");
INSERT INTO kealibrary.cities VALUES (1406,"København K");
INSERT INTO kealibrary.cities VALUES (1407,"København K");
INSERT INTO kealibrary.cities VALUES (1408,"København K");
INSERT INTO kealibrary.cities VALUES (1409,"København K");
INSERT INTO kealibrary.cities VALUES (1410,"København K");
INSERT INTO kealibrary.cities VALUES (1411,"København K");
INSERT INTO kealibrary.cities VALUES (1412,"København K");
INSERT INTO kealibrary.cities VALUES (1413,"København K");
INSERT INTO kealibrary.cities VALUES (1414,"København K");
INSERT INTO kealibrary.cities VALUES (1415,"København K");
INSERT INTO kealibrary.cities VALUES (1416,"København K");
INSERT INTO kealibrary.cities VALUES (1417,"København K");
INSERT INTO kealibrary.cities VALUES (1418,"København K");
INSERT INTO kealibrary.cities VALUES (1419,"København K");
INSERT INTO kealibrary.cities VALUES (1420,"København K");
INSERT INTO kealibrary.cities VALUES (1421,"København K");
INSERT INTO kealibrary.cities VALUES (1422,"København K");
INSERT INTO kealibrary.cities VALUES (1423,"København K");
INSERT INTO kealibrary.cities VALUES (1424,"København K");
INSERT INTO kealibrary.cities VALUES (1425,"København K");
INSERT INTO kealibrary.cities VALUES (1426,"København K");
INSERT INTO kealibrary.cities VALUES (1427,"København K");
INSERT INTO kealibrary.cities VALUES (1428,"København K");
INSERT INTO kealibrary.cities VALUES (1429,"København K");
INSERT INTO kealibrary.cities VALUES (1430,"København K");
INSERT INTO kealibrary.cities VALUES (1431,"København K");
INSERT INTO kealibrary.cities VALUES (1432,"København K");
INSERT INTO kealibrary.cities VALUES (1433,"København K");
INSERT INTO kealibrary.cities VALUES (1434,"København K");
INSERT INTO kealibrary.cities VALUES (1435,"København K");
INSERT INTO kealibrary.cities VALUES (1436,"København K");
INSERT INTO kealibrary.cities VALUES (1437,"København K");
INSERT INTO kealibrary.cities VALUES (1438,"København K");
INSERT INTO kealibrary.cities VALUES (1439,"København K");
INSERT INTO kealibrary.cities VALUES (1440,"København K");
INSERT INTO kealibrary.cities VALUES (1441,"København K");
INSERT INTO kealibrary.cities VALUES (1448,"København K");
INSERT INTO kealibrary.cities VALUES (1450,"København K");
INSERT INTO kealibrary.cities VALUES (1451,"København K");
INSERT INTO kealibrary.cities VALUES (1452,"København K");
INSERT INTO kealibrary.cities VALUES (1453,"København K");
INSERT INTO kealibrary.cities VALUES (1454,"København K");
INSERT INTO kealibrary.cities VALUES (1455,"København K");
INSERT INTO kealibrary.cities VALUES (1456,"København K");
INSERT INTO kealibrary.cities VALUES (1457,"København K");
INSERT INTO kealibrary.cities VALUES (1458,"København K");
INSERT INTO kealibrary.cities VALUES (1459,"København K");
INSERT INTO kealibrary.cities VALUES (1460,"København K");
INSERT INTO kealibrary.cities VALUES (1461,"København K");
INSERT INTO kealibrary.cities VALUES (1462,"København K");
INSERT INTO kealibrary.cities VALUES (1463,"København K");
INSERT INTO kealibrary.cities VALUES (1464,"København K");
INSERT INTO kealibrary.cities VALUES (1465,"København K");
INSERT INTO kealibrary.cities VALUES (1466,"København K");
INSERT INTO kealibrary.cities VALUES (1467,"København K");
INSERT INTO kealibrary.cities VALUES (1468,"København K");
INSERT INTO kealibrary.cities VALUES (1470,"København K");
INSERT INTO kealibrary.cities VALUES (1471,"København K");
INSERT INTO kealibrary.cities VALUES (1472,"København K");
INSERT INTO kealibrary.cities VALUES (1473,"København K");
INSERT INTO kealibrary.cities VALUES (1500,"København V");
INSERT INTO kealibrary.cities VALUES (1501,"København V");
INSERT INTO kealibrary.cities VALUES (1502,"København V");
INSERT INTO kealibrary.cities VALUES (1503,"København V");
INSERT INTO kealibrary.cities VALUES (1504,"København V");
INSERT INTO kealibrary.cities VALUES (1505,"København V");
INSERT INTO kealibrary.cities VALUES (1506,"København V");
INSERT INTO kealibrary.cities VALUES (1507,"København V");
INSERT INTO kealibrary.cities VALUES (1508,"København V");
INSERT INTO kealibrary.cities VALUES (1509,"København V");
INSERT INTO kealibrary.cities VALUES (1510,"København V");
INSERT INTO kealibrary.cities VALUES (1532,"København V");
INSERT INTO kealibrary.cities VALUES (1533,"København V");
INSERT INTO kealibrary.cities VALUES (1550,"København V");
INSERT INTO kealibrary.cities VALUES (1551,"København V");
INSERT INTO kealibrary.cities VALUES (1552,"København V");
INSERT INTO kealibrary.cities VALUES (1553,"København V");
INSERT INTO kealibrary.cities VALUES (1554,"København V");
INSERT INTO kealibrary.cities VALUES (1555,"København V");
INSERT INTO kealibrary.cities VALUES (1556,"København V");
INSERT INTO kealibrary.cities VALUES (1557,"København V");
INSERT INTO kealibrary.cities VALUES (1558,"København V");
INSERT INTO kealibrary.cities VALUES (1559,"København V");
INSERT INTO kealibrary.cities VALUES (1560,"København V");
INSERT INTO kealibrary.cities VALUES (1561,"København V");
INSERT INTO kealibrary.cities VALUES (1562,"København V");
INSERT INTO kealibrary.cities VALUES (1563,"København V");
INSERT INTO kealibrary.cities VALUES (1564,"København V");
INSERT INTO kealibrary.cities VALUES (1566,"København V");
INSERT INTO kealibrary.cities VALUES (1567,"København V");
INSERT INTO kealibrary.cities VALUES (1568,"København V");
INSERT INTO kealibrary.cities VALUES (1569,"København V");
INSERT INTO kealibrary.cities VALUES (1570,"København V");
INSERT INTO kealibrary.cities VALUES (1571,"København V");
INSERT INTO kealibrary.cities VALUES (1572,"København V");
INSERT INTO kealibrary.cities VALUES (1573,"København V");
INSERT INTO kealibrary.cities VALUES (1574,"København V");
INSERT INTO kealibrary.cities VALUES (1575,"København V");
INSERT INTO kealibrary.cities VALUES (1576,"København V");
INSERT INTO kealibrary.cities VALUES (1577,"København V");
INSERT INTO kealibrary.cities VALUES (1590,"København V");
INSERT INTO kealibrary.cities VALUES (1592,"København V");
INSERT INTO kealibrary.cities VALUES (1595,"København V");
INSERT INTO kealibrary.cities VALUES (1599,"København V");
INSERT INTO kealibrary.cities VALUES (1600,"København V");
INSERT INTO kealibrary.cities VALUES (1601,"København V");
INSERT INTO kealibrary.cities VALUES (1602,"København V");
INSERT INTO kealibrary.cities VALUES (1603,"København V");
INSERT INTO kealibrary.cities VALUES (1604,"København V");
INSERT INTO kealibrary.cities VALUES (1605,"København V");
INSERT INTO kealibrary.cities VALUES (1606,"København V");
INSERT INTO kealibrary.cities VALUES (1607,"København V");
INSERT INTO kealibrary.cities VALUES (1608,"København V");
INSERT INTO kealibrary.cities VALUES (1609,"København V");
INSERT INTO kealibrary.cities VALUES (1610,"København V");
INSERT INTO kealibrary.cities VALUES (1611,"København V");
INSERT INTO kealibrary.cities VALUES (1612,"København V");
INSERT INTO kealibrary.cities VALUES (1613,"København V");
INSERT INTO kealibrary.cities VALUES (1614,"København V");
INSERT INTO kealibrary.cities VALUES (1615,"København V");
INSERT INTO kealibrary.cities VALUES (1616,"København V");
INSERT INTO kealibrary.cities VALUES (1617,"København V");
INSERT INTO kealibrary.cities VALUES (1618,"København V");
INSERT INTO kealibrary.cities VALUES (1619,"København V");
INSERT INTO kealibrary.cities VALUES (1620,"København V");
INSERT INTO kealibrary.cities VALUES (1621,"København V");
INSERT INTO kealibrary.cities VALUES (1622,"København V");
INSERT INTO kealibrary.cities VALUES (1623,"København V");
INSERT INTO kealibrary.cities VALUES (1624,"København V");
INSERT INTO kealibrary.cities VALUES (1630,"København V");
INSERT INTO kealibrary.cities VALUES (1631,"København V");
INSERT INTO kealibrary.cities VALUES (1632,"København V");
INSERT INTO kealibrary.cities VALUES (1633,"København V");
INSERT INTO kealibrary.cities VALUES (1634,"København V");
INSERT INTO kealibrary.cities VALUES (1635,"København V");
INSERT INTO kealibrary.cities VALUES (1639,"København V");
INSERT INTO kealibrary.cities VALUES (1640,"København V");
INSERT INTO kealibrary.cities VALUES (1650,"København V");
INSERT INTO kealibrary.cities VALUES (1651,"København V");
INSERT INTO kealibrary.cities VALUES (1652,"København V");
INSERT INTO kealibrary.cities VALUES (1653,"København V");
INSERT INTO kealibrary.cities VALUES (1654,"København V");
INSERT INTO kealibrary.cities VALUES (1655,"København V");
INSERT INTO kealibrary.cities VALUES (1656,"København V");
INSERT INTO kealibrary.cities VALUES (1657,"København V");
INSERT INTO kealibrary.cities VALUES (1658,"København V");
INSERT INTO kealibrary.cities VALUES (1659,"København V");
INSERT INTO kealibrary.cities VALUES (1660,"København V");
INSERT INTO kealibrary.cities VALUES (1661,"København V");
INSERT INTO kealibrary.cities VALUES (1662,"København V");
INSERT INTO kealibrary.cities VALUES (1663,"København V");
INSERT INTO kealibrary.cities VALUES (1664,"København V");
INSERT INTO kealibrary.cities VALUES (1665,"København V");
INSERT INTO kealibrary.cities VALUES (1666,"København V");
INSERT INTO kealibrary.cities VALUES (1667,"København V");
INSERT INTO kealibrary.cities VALUES (1668,"København V");
INSERT INTO kealibrary.cities VALUES (1669,"København V");
INSERT INTO kealibrary.cities VALUES (1670,"København V");
INSERT INTO kealibrary.cities VALUES (1671,"København V");
INSERT INTO kealibrary.cities VALUES (1672,"København V");
INSERT INTO kealibrary.cities VALUES (1673,"København V");
INSERT INTO kealibrary.cities VALUES (1674,"København V");
INSERT INTO kealibrary.cities VALUES (1675,"København V");
INSERT INTO kealibrary.cities VALUES (1676,"København V");
INSERT INTO kealibrary.cities VALUES (1677,"København V");
INSERT INTO kealibrary.cities VALUES (1699,"København V");
INSERT INTO kealibrary.cities VALUES (1700,"København V");
INSERT INTO kealibrary.cities VALUES (1701,"København V");
INSERT INTO kealibrary.cities VALUES (1702,"København V");
INSERT INTO kealibrary.cities VALUES (1703,"København V");
INSERT INTO kealibrary.cities VALUES (1704,"København V");
INSERT INTO kealibrary.cities VALUES (1705,"København V");
INSERT INTO kealibrary.cities VALUES (1706,"København V");
INSERT INTO kealibrary.cities VALUES (1707,"København V");
INSERT INTO kealibrary.cities VALUES (1708,"København V");
INSERT INTO kealibrary.cities VALUES (1709,"København V");
INSERT INTO kealibrary.cities VALUES (1710,"København V");
INSERT INTO kealibrary.cities VALUES (1711,"København V");
INSERT INTO kealibrary.cities VALUES (1712,"København V");
INSERT INTO kealibrary.cities VALUES (1713,"København V");
INSERT INTO kealibrary.cities VALUES (1714,"København V");
INSERT INTO kealibrary.cities VALUES (1715,"København V");
INSERT INTO kealibrary.cities VALUES (1716,"København V");
INSERT INTO kealibrary.cities VALUES (1717,"København V");
INSERT INTO kealibrary.cities VALUES (1718,"København V");
INSERT INTO kealibrary.cities VALUES (1719,"København V");
INSERT INTO kealibrary.cities VALUES (1720,"København V");
INSERT INTO kealibrary.cities VALUES (1721,"København V");
INSERT INTO kealibrary.cities VALUES (1722,"København V");
INSERT INTO kealibrary.cities VALUES (1723,"København V");
INSERT INTO kealibrary.cities VALUES (1724,"København V");
INSERT INTO kealibrary.cities VALUES (1725,"København V");
INSERT INTO kealibrary.cities VALUES (1726,"København V");
INSERT INTO kealibrary.cities VALUES (1727,"København V");
INSERT INTO kealibrary.cities VALUES (1728,"København V");
INSERT INTO kealibrary.cities VALUES (1729,"København V");
INSERT INTO kealibrary.cities VALUES (1730,"København V");
INSERT INTO kealibrary.cities VALUES (1731,"København V");
INSERT INTO kealibrary.cities VALUES (1732,"København V");
INSERT INTO kealibrary.cities VALUES (1733,"København V");
INSERT INTO kealibrary.cities VALUES (1734,"København V");
INSERT INTO kealibrary.cities VALUES (1735,"København V");
INSERT INTO kealibrary.cities VALUES (1736,"København V");
INSERT INTO kealibrary.cities VALUES (1737,"København V");
INSERT INTO kealibrary.cities VALUES (1738,"København V");
INSERT INTO kealibrary.cities VALUES (1739,"København V");
INSERT INTO kealibrary.cities VALUES (1748,"København V");
INSERT INTO kealibrary.cities VALUES (1749,"København V");
INSERT INTO kealibrary.cities VALUES (1750,"København V");
INSERT INTO kealibrary.cities VALUES (1751,"København V");
INSERT INTO kealibrary.cities VALUES (1752,"København V");
INSERT INTO kealibrary.cities VALUES (1753,"København V");
INSERT INTO kealibrary.cities VALUES (1754,"København V");
INSERT INTO kealibrary.cities VALUES (1755,"København V");
INSERT INTO kealibrary.cities VALUES (1756,"København V");
INSERT INTO kealibrary.cities VALUES (1757,"København V");
INSERT INTO kealibrary.cities VALUES (1758,"København V");
INSERT INTO kealibrary.cities VALUES (1759,"København V");
INSERT INTO kealibrary.cities VALUES (1760,"København V");
INSERT INTO kealibrary.cities VALUES (1761,"København V");
INSERT INTO kealibrary.cities VALUES (1762,"København V");
INSERT INTO kealibrary.cities VALUES (1763,"København V");
INSERT INTO kealibrary.cities VALUES (1764,"København V");
INSERT INTO kealibrary.cities VALUES (1765,"København V");
INSERT INTO kealibrary.cities VALUES (1766,"København V");
INSERT INTO kealibrary.cities VALUES (1770,"København V");
INSERT INTO kealibrary.cities VALUES (1771,"København V");
INSERT INTO kealibrary.cities VALUES (1772,"København V");
INSERT INTO kealibrary.cities VALUES (1773,"København V");
INSERT INTO kealibrary.cities VALUES (1774,"København V");
INSERT INTO kealibrary.cities VALUES (1775,"København V");
INSERT INTO kealibrary.cities VALUES (1777,"København V");
INSERT INTO kealibrary.cities VALUES (1778,"København V");
INSERT INTO kealibrary.cities VALUES (1780,"København V");
INSERT INTO kealibrary.cities VALUES (1782,"København V");
INSERT INTO kealibrary.cities VALUES (1783,"København V");
INSERT INTO kealibrary.cities VALUES (1784,"København V");
INSERT INTO kealibrary.cities VALUES (1785,"København V");
INSERT INTO kealibrary.cities VALUES (1786,"København V");
INSERT INTO kealibrary.cities VALUES (1787,"København V");
INSERT INTO kealibrary.cities VALUES (1788,"København V");
INSERT INTO kealibrary.cities VALUES (1789,"København V");
INSERT INTO kealibrary.cities VALUES (1790,"København V");
INSERT INTO kealibrary.cities VALUES (1795,"København V");
INSERT INTO kealibrary.cities VALUES (1799,"København V");
INSERT INTO kealibrary.cities VALUES (1800,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1801,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1802,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1803,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1804,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1805,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1806,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1807,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1808,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1809,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1810,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1811,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1812,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1813,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1814,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1815,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1816,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1817,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1818,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1819,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1820,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1822,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1823,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1824,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1825,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1826,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1827,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1828,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1829,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1835,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1850,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1851,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1852,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1853,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1854,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1855,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1856,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1857,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1860,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1861,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1862,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1863,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1864,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1865,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1866,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1867,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1868,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1870,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1871,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1872,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1873,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1874,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1875,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1876,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1877,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1878,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1879,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1900,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1901,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1902,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1903,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1904,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1905,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1906,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1908,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1909,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1910,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1911,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1912,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1913,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1914,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1915,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1916,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1917,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1920,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1921,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1922,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1923,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1924,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1925,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1926,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1927,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1928,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1931,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1950,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1951,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1952,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1953,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1954,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1955,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1956,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1957,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1958,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1959,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1960,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1961,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1962,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1963,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1964,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1965,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1966,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1967,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1970,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1971,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1972,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1973,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1974,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (1999,"Frederiksberg C");
INSERT INTO kealibrary.cities VALUES (2000,"Frederiksberg");
INSERT INTO kealibrary.cities VALUES (2100,"København Ø");
INSERT INTO kealibrary.cities VALUES (2200,"København N");
INSERT INTO kealibrary.cities VALUES (2300,"København S");
INSERT INTO kealibrary.cities VALUES (2400,"København NV");
INSERT INTO kealibrary.cities VALUES (2450,"København SV");
INSERT INTO kealibrary.cities VALUES (2500,"Valby");
INSERT INTO kealibrary.cities VALUES (2600,"Glostrup");
INSERT INTO kealibrary.cities VALUES (2605,"Brøndby");
INSERT INTO kealibrary.cities VALUES (2610,"Rødovre");
INSERT INTO kealibrary.cities VALUES (2620,"Albertslund");
INSERT INTO kealibrary.cities VALUES (2625,"Vallensbæk");
INSERT INTO kealibrary.cities VALUES (2630,"Taastrup");
INSERT INTO kealibrary.cities VALUES (2633,"Taastrup");
INSERT INTO kealibrary.cities VALUES (2635,"Ishøj");
INSERT INTO kealibrary.cities VALUES (2640,"Hedehusene");
INSERT INTO kealibrary.cities VALUES (2650,"Hvidovre");
INSERT INTO kealibrary.cities VALUES (2660,"Brøndby Strand");
INSERT INTO kealibrary.cities VALUES (2665,"Vallensbæk Strand");
INSERT INTO kealibrary.cities VALUES (2670,"Greve");
INSERT INTO kealibrary.cities VALUES (2680,"Solrød Strand");
INSERT INTO kealibrary.cities VALUES (2690,"Karlslunde");
INSERT INTO kealibrary.cities VALUES (2700,"Brønshøj");
INSERT INTO kealibrary.cities VALUES (2720,"Vanløse");
INSERT INTO kealibrary.cities VALUES (2730,"Herlev");
INSERT INTO kealibrary.cities VALUES (2740,"Skovlunde");
INSERT INTO kealibrary.cities VALUES (2750,"Ballerup");
INSERT INTO kealibrary.cities VALUES (2760,"Måløv");
INSERT INTO kealibrary.cities VALUES (2765,"Smørum");
INSERT INTO kealibrary.cities VALUES (2770,"Kastrup");
INSERT INTO kealibrary.cities VALUES (2791,"Dragør");
INSERT INTO kealibrary.cities VALUES (2800,"Kongens Lyngby");
INSERT INTO kealibrary.cities VALUES (2820,"Gentofte");
INSERT INTO kealibrary.cities VALUES (2830,"Virum");
INSERT INTO kealibrary.cities VALUES (2840,"Holte");
INSERT INTO kealibrary.cities VALUES (2850,"Nærum");
INSERT INTO kealibrary.cities VALUES (2860,"Søborg");
INSERT INTO kealibrary.cities VALUES (2870,"Dyssegård");
INSERT INTO kealibrary.cities VALUES (2880,"Bagsværd");
INSERT INTO kealibrary.cities VALUES (2900,"Hellerup");
INSERT INTO kealibrary.cities VALUES (2920,"Charlottenlund");
INSERT INTO kealibrary.cities VALUES (2930,"Klampenborg");
INSERT INTO kealibrary.cities VALUES (2942,"Skodsborg");
INSERT INTO kealibrary.cities VALUES (2950,"Vedbæk");
INSERT INTO kealibrary.cities VALUES (2960,"Rungsted Kyst");
INSERT INTO kealibrary.cities VALUES (2970,"Hørsholm");
INSERT INTO kealibrary.cities VALUES (2980,"Kokkedal");
INSERT INTO kealibrary.cities VALUES (2990,"Nivå");
INSERT INTO kealibrary.cities VALUES (3000,"Helsingør");
INSERT INTO kealibrary.cities VALUES (3050,"Humlebæk");
INSERT INTO kealibrary.cities VALUES (3060,"Espergærde");
INSERT INTO kealibrary.cities VALUES (3070,"Snekkersten");
INSERT INTO kealibrary.cities VALUES (3080,"Tikøb");
INSERT INTO kealibrary.cities VALUES (3100,"Hornbæk");
INSERT INTO kealibrary.cities VALUES (3120,"Dronningmølle");
INSERT INTO kealibrary.cities VALUES (3140,"Ålsgårde");
INSERT INTO kealibrary.cities VALUES (3150,"Hellebæk");
INSERT INTO kealibrary.cities VALUES (3200,"Helsinge");
INSERT INTO kealibrary.cities VALUES (3210,"Vejby");
INSERT INTO kealibrary.cities VALUES (3220,"Tisvildeleje");
INSERT INTO kealibrary.cities VALUES (3230,"Græsted");
INSERT INTO kealibrary.cities VALUES (3250,"Gilleleje");
INSERT INTO kealibrary.cities VALUES (3300,"Frederiksværk");
INSERT INTO kealibrary.cities VALUES (3310,"Ølsted");
INSERT INTO kealibrary.cities VALUES (3320,"Skævinge");
INSERT INTO kealibrary.cities VALUES (3330,"Gørløse");
INSERT INTO kealibrary.cities VALUES (3360,"Liseleje");
INSERT INTO kealibrary.cities VALUES (3370,"Melby");
INSERT INTO kealibrary.cities VALUES (3390,"Hundested");
INSERT INTO kealibrary.cities VALUES (3400,"Hillerød");
INSERT INTO kealibrary.cities VALUES (3450,"Allerød");
INSERT INTO kealibrary.cities VALUES (3460,"Birkerød");
INSERT INTO kealibrary.cities VALUES (3480,"Fredensborg");
INSERT INTO kealibrary.cities VALUES (3490,"Kvistgård");
INSERT INTO kealibrary.cities VALUES (3500,"Værløse");
INSERT INTO kealibrary.cities VALUES (3520,"Farum");
INSERT INTO kealibrary.cities VALUES (3540,"Lynge");
INSERT INTO kealibrary.cities VALUES (3550,"Slangerup");
INSERT INTO kealibrary.cities VALUES (3600,"Frederikssund");
INSERT INTO kealibrary.cities VALUES (3630,"Jægerspris");
INSERT INTO kealibrary.cities VALUES (3650,"Ølstykke");
INSERT INTO kealibrary.cities VALUES (3660,"Stenløse");
INSERT INTO kealibrary.cities VALUES (3670,"Veksø Sjælland");
INSERT INTO kealibrary.cities VALUES (3700,"Rønne");
INSERT INTO kealibrary.cities VALUES (3720,"Aakirkeby");
INSERT INTO kealibrary.cities VALUES (3730,"Nexø");
INSERT INTO kealibrary.cities VALUES (3740,"Svaneke");
INSERT INTO kealibrary.cities VALUES (3751,"Østermarie");
INSERT INTO kealibrary.cities VALUES (3760,"Gudhjem");
INSERT INTO kealibrary.cities VALUES (3770,"Allinge");
INSERT INTO kealibrary.cities VALUES (3782,"Klemensker");
INSERT INTO kealibrary.cities VALUES (3790,"Hasle");
INSERT INTO kealibrary.cities VALUES (4000,"Roskilde");
INSERT INTO kealibrary.cities VALUES (4030,"Tune");
INSERT INTO kealibrary.cities VALUES (4040,"Jyllinge");
INSERT INTO kealibrary.cities VALUES (4050,"Skibby");
INSERT INTO kealibrary.cities VALUES (4060,"Kirke Såby");
INSERT INTO kealibrary.cities VALUES (4070,"Kirke Hyllinge");
INSERT INTO kealibrary.cities VALUES (4100,"Ringsted");
INSERT INTO kealibrary.cities VALUES (4105,"Ringsted");
INSERT INTO kealibrary.cities VALUES (4129,"Ringsted");
INSERT INTO kealibrary.cities VALUES (4130,"Viby Sjælland");
INSERT INTO kealibrary.cities VALUES (4140,"Borup");
INSERT INTO kealibrary.cities VALUES (4160,"Herlufmagle");
INSERT INTO kealibrary.cities VALUES (4171,"Glumsø");
INSERT INTO kealibrary.cities VALUES (4173,"Fjenneslev");
INSERT INTO kealibrary.cities VALUES (4174,"Jystrup Midtsj");
INSERT INTO kealibrary.cities VALUES (4180,"Sorø");
INSERT INTO kealibrary.cities VALUES (4190,"Munke Bjergby");
INSERT INTO kealibrary.cities VALUES (4200,"Slagelse");
INSERT INTO kealibrary.cities VALUES (4220,"Korsør");
INSERT INTO kealibrary.cities VALUES (4230,"Skælskør");
INSERT INTO kealibrary.cities VALUES (4241,"Vemmelev");
INSERT INTO kealibrary.cities VALUES (4242,"Boeslunde");
INSERT INTO kealibrary.cities VALUES (4243,"Rude");
INSERT INTO kealibrary.cities VALUES (4250,"Fuglebjerg");
INSERT INTO kealibrary.cities VALUES (4261,"Dalmose");
INSERT INTO kealibrary.cities VALUES (4262,"Sandved");
INSERT INTO kealibrary.cities VALUES (4270,"Høng");
INSERT INTO kealibrary.cities VALUES (4281,"Gørlev");
INSERT INTO kealibrary.cities VALUES (4291,"Ruds Vedby");
INSERT INTO kealibrary.cities VALUES (4293,"Dianalund");
INSERT INTO kealibrary.cities VALUES (4295,"Stenlille");
INSERT INTO kealibrary.cities VALUES (4296,"Nyrup");
INSERT INTO kealibrary.cities VALUES (4300,"Holbæk");
INSERT INTO kealibrary.cities VALUES (4320,"Lejre");
INSERT INTO kealibrary.cities VALUES (4330,"Hvalsø");
INSERT INTO kealibrary.cities VALUES (4340,"Tølløse");
INSERT INTO kealibrary.cities VALUES (4350,"Ugerløse");
INSERT INTO kealibrary.cities VALUES (4360,"Kirke Eskilstrup");
INSERT INTO kealibrary.cities VALUES (4370,"Store Merløse");
INSERT INTO kealibrary.cities VALUES (4390,"Vipperød");
INSERT INTO kealibrary.cities VALUES (4400,"Kalundborg");
INSERT INTO kealibrary.cities VALUES (4420,"Regstrup");
INSERT INTO kealibrary.cities VALUES (4440,"Mørkøv");
INSERT INTO kealibrary.cities VALUES (4450,"Jyderup");
INSERT INTO kealibrary.cities VALUES (4460,"Snertinge");
INSERT INTO kealibrary.cities VALUES (4470,"Svebølle");
INSERT INTO kealibrary.cities VALUES (4480,"Store Fuglede");
INSERT INTO kealibrary.cities VALUES (4490,"Jerslev Sjælland");
INSERT INTO kealibrary.cities VALUES (4500,"Nykøbing Sj");
INSERT INTO kealibrary.cities VALUES (4520,"Svinninge");
INSERT INTO kealibrary.cities VALUES (4532,"Gislinge");
INSERT INTO kealibrary.cities VALUES (4534,"Hørve");
INSERT INTO kealibrary.cities VALUES (4540,"Fårevejle");
INSERT INTO kealibrary.cities VALUES (4550,"Asnæs");
INSERT INTO kealibrary.cities VALUES (4560,"Vig");
INSERT INTO kealibrary.cities VALUES (4571,"Grevinge");
INSERT INTO kealibrary.cities VALUES (4572,"Nørre Asmindrup");
INSERT INTO kealibrary.cities VALUES (4573,"Højby");
INSERT INTO kealibrary.cities VALUES (4581,"Rørvig");
INSERT INTO kealibrary.cities VALUES (4583,"Sjællands Odde");
INSERT INTO kealibrary.cities VALUES (4591,"Føllenslev");
INSERT INTO kealibrary.cities VALUES (4592,"Sejerø");
INSERT INTO kealibrary.cities VALUES (4593,"Eskebjerg");
INSERT INTO kealibrary.cities VALUES (4600,"Køge");
INSERT INTO kealibrary.cities VALUES (4621,"Gadstrup");
INSERT INTO kealibrary.cities VALUES (4622,"Havdrup");
INSERT INTO kealibrary.cities VALUES (4623,"Lille Skensved");
INSERT INTO kealibrary.cities VALUES (4632,"Bjæverskov");
INSERT INTO kealibrary.cities VALUES (4640,"Fakse");
INSERT INTO kealibrary.cities VALUES (4652,"Hårlev");
INSERT INTO kealibrary.cities VALUES (4653,"Karise");
INSERT INTO kealibrary.cities VALUES (4654,"Fakse Ladeplads");
INSERT INTO kealibrary.cities VALUES (4660,"Store Heddinge");
INSERT INTO kealibrary.cities VALUES (4671,"Strøby");
INSERT INTO kealibrary.cities VALUES (4672,"Klippinge");
INSERT INTO kealibrary.cities VALUES (4673,"Rødvig Stevns");
INSERT INTO kealibrary.cities VALUES (4681,"Herfølge");
INSERT INTO kealibrary.cities VALUES (4682,"Tureby");
INSERT INTO kealibrary.cities VALUES (4683,"Rønnede");
INSERT INTO kealibrary.cities VALUES (4684,"Holmegaard");
INSERT INTO kealibrary.cities VALUES (4690,"Haslev");
INSERT INTO kealibrary.cities VALUES (4700,"Næstved");
INSERT INTO kealibrary.cities VALUES (4720,"Præstø");
INSERT INTO kealibrary.cities VALUES (4733,"Tappernøje");
INSERT INTO kealibrary.cities VALUES (4735,"Mern");
INSERT INTO kealibrary.cities VALUES (4736,"Karrebæksminde");
INSERT INTO kealibrary.cities VALUES (4750,"Lundby");
INSERT INTO kealibrary.cities VALUES (4760,"Vordingborg");
INSERT INTO kealibrary.cities VALUES (4771,"Kalvehave");
INSERT INTO kealibrary.cities VALUES (4772,"Langebæk");
INSERT INTO kealibrary.cities VALUES (4773,"Stensved");
INSERT INTO kealibrary.cities VALUES (4780,"Stege");
INSERT INTO kealibrary.cities VALUES (4791,"Borre");
INSERT INTO kealibrary.cities VALUES (4792,"Askeby");
INSERT INTO kealibrary.cities VALUES (4793,"Bogø By");
INSERT INTO kealibrary.cities VALUES (4800,"Nykøbing F");
INSERT INTO kealibrary.cities VALUES (4840,"Nørre Alslev");
INSERT INTO kealibrary.cities VALUES (4850,"Stubbekøbing");
INSERT INTO kealibrary.cities VALUES (4862,"Guldborg");
INSERT INTO kealibrary.cities VALUES (4863,"Eskilstrup");
INSERT INTO kealibrary.cities VALUES (4871,"Horbelev");
INSERT INTO kealibrary.cities VALUES (4872,"Idestrup");
INSERT INTO kealibrary.cities VALUES (4873,"Væggerløse");
INSERT INTO kealibrary.cities VALUES (4874,"Gedser");
INSERT INTO kealibrary.cities VALUES (4880,"Nysted");
INSERT INTO kealibrary.cities VALUES (4891,"Toreby L");
INSERT INTO kealibrary.cities VALUES (4892,"Kettinge");
INSERT INTO kealibrary.cities VALUES (4894,"Øster Ulslev");
INSERT INTO kealibrary.cities VALUES (4895,"Errindlev");
INSERT INTO kealibrary.cities VALUES (4900,"Nakskov");
INSERT INTO kealibrary.cities VALUES (4912,"Harpelunde");
INSERT INTO kealibrary.cities VALUES (4913,"Horslunde");
INSERT INTO kealibrary.cities VALUES (4920,"Søllested");
INSERT INTO kealibrary.cities VALUES (4930,"Maribo");
INSERT INTO kealibrary.cities VALUES (4941,"Bandholm");
INSERT INTO kealibrary.cities VALUES (4943,"Torrig L");
INSERT INTO kealibrary.cities VALUES (4944,"Fejø");
INSERT INTO kealibrary.cities VALUES (4951,"Nørreballe");
INSERT INTO kealibrary.cities VALUES (4952,"Stokkemarke");
INSERT INTO kealibrary.cities VALUES (4953,"Vesterborg");
INSERT INTO kealibrary.cities VALUES (4960,"Holeby");
INSERT INTO kealibrary.cities VALUES (4970,"Rødby");
INSERT INTO kealibrary.cities VALUES (4983,"Dannemare");
INSERT INTO kealibrary.cities VALUES (4990,"Sakskøbing");
INSERT INTO kealibrary.cities VALUES (5000,"Odense C");
INSERT INTO kealibrary.cities VALUES (5029,"Odense C");
INSERT INTO kealibrary.cities VALUES (5090,"Odense C");
INSERT INTO kealibrary.cities VALUES (5100,"Odense C");
INSERT INTO kealibrary.cities VALUES (5200,"Odense V");
INSERT INTO kealibrary.cities VALUES (5210,"Odense NV");
INSERT INTO kealibrary.cities VALUES (5220,"Odense SØ");
INSERT INTO kealibrary.cities VALUES (5230,"Odense M");
INSERT INTO kealibrary.cities VALUES (5240,"Odense NØ");
INSERT INTO kealibrary.cities VALUES (5250,"Odense SV");
INSERT INTO kealibrary.cities VALUES (5260,"Odense S");
INSERT INTO kealibrary.cities VALUES (5270,"Odense N");
INSERT INTO kealibrary.cities VALUES (5290,"Marslev");
INSERT INTO kealibrary.cities VALUES (5300,"Kerteminde");
INSERT INTO kealibrary.cities VALUES (5320,"Agedrup");
INSERT INTO kealibrary.cities VALUES (5330,"Munkebo");
INSERT INTO kealibrary.cities VALUES (5350,"Rynkeby");
INSERT INTO kealibrary.cities VALUES (5370,"Mesinge");
INSERT INTO kealibrary.cities VALUES (5380,"Dalby");
INSERT INTO kealibrary.cities VALUES (5390,"Martofte");
INSERT INTO kealibrary.cities VALUES (5400,"Bogense");
INSERT INTO kealibrary.cities VALUES (5450,"Otterup");
INSERT INTO kealibrary.cities VALUES (5462,"Morud");
INSERT INTO kealibrary.cities VALUES (5463,"Harndrup");
INSERT INTO kealibrary.cities VALUES (5464,"Brenderup Fyn");
INSERT INTO kealibrary.cities VALUES (5466,"Asperup");
INSERT INTO kealibrary.cities VALUES (5471,"Søndersø");
INSERT INTO kealibrary.cities VALUES (5474,"Veflinge");
INSERT INTO kealibrary.cities VALUES (5485,"Skamby");
INSERT INTO kealibrary.cities VALUES (5491,"Blommenslyst");
INSERT INTO kealibrary.cities VALUES (5492,"Vissenbjerg");
INSERT INTO kealibrary.cities VALUES (5500,"Middelfart");
INSERT INTO kealibrary.cities VALUES (5540,"Ullerslev");
INSERT INTO kealibrary.cities VALUES (5550,"Langeskov");
INSERT INTO kealibrary.cities VALUES (5560,"Aarup");
INSERT INTO kealibrary.cities VALUES (5580,"Nørre Aaby");
INSERT INTO kealibrary.cities VALUES (5591,"Gelsted");
INSERT INTO kealibrary.cities VALUES (5592,"Ejby");
INSERT INTO kealibrary.cities VALUES (5600,"Faaborg");
INSERT INTO kealibrary.cities VALUES (5610,"Assens");
INSERT INTO kealibrary.cities VALUES (5620,"Glamsbjerg");
INSERT INTO kealibrary.cities VALUES (5631,"Ebberup");
INSERT INTO kealibrary.cities VALUES (5642,"Millinge");
INSERT INTO kealibrary.cities VALUES (5672,"Broby");
INSERT INTO kealibrary.cities VALUES (5683,"Haarby");
INSERT INTO kealibrary.cities VALUES (5690,"Tommerup");
INSERT INTO kealibrary.cities VALUES (5700,"Svendborg");
INSERT INTO kealibrary.cities VALUES (5750,"Ringe");
INSERT INTO kealibrary.cities VALUES (5762,"Vester Skerninge");
INSERT INTO kealibrary.cities VALUES (5771,"Stenstrup");
INSERT INTO kealibrary.cities VALUES (5772,"Kværndrup");
INSERT INTO kealibrary.cities VALUES (5792,"Årslev");
INSERT INTO kealibrary.cities VALUES (5800,"Nyborg");
INSERT INTO kealibrary.cities VALUES (5853,"Ørbæk");
INSERT INTO kealibrary.cities VALUES (5854,"Gislev");
INSERT INTO kealibrary.cities VALUES (5856,"Ryslinge");
INSERT INTO kealibrary.cities VALUES (5863,"Ferritslev Fyn");
INSERT INTO kealibrary.cities VALUES (5871,"Frørup");
INSERT INTO kealibrary.cities VALUES (5874,"Hesselager");
INSERT INTO kealibrary.cities VALUES (5881,"Skårup Fyn");
INSERT INTO kealibrary.cities VALUES (5882,"Vejstrup");
INSERT INTO kealibrary.cities VALUES (5883,"Oure");
INSERT INTO kealibrary.cities VALUES (5884,"Gudme");
INSERT INTO kealibrary.cities VALUES (5892,"Gudbjerg Sydfyn");
INSERT INTO kealibrary.cities VALUES (5900,"Rudkøbing");
INSERT INTO kealibrary.cities VALUES (5932,"Humble");
INSERT INTO kealibrary.cities VALUES (5935,"Bagenkop");
INSERT INTO kealibrary.cities VALUES (5953,"Tranekær");
INSERT INTO kealibrary.cities VALUES (5960,"Marstal");
INSERT INTO kealibrary.cities VALUES (5970,"Ærøskøbing");
INSERT INTO kealibrary.cities VALUES (5985,"Søby Ærø");
INSERT INTO kealibrary.cities VALUES (6000,"Kolding");
INSERT INTO kealibrary.cities VALUES (6040,"Egtved");
INSERT INTO kealibrary.cities VALUES (6051,"Almind");
INSERT INTO kealibrary.cities VALUES (6052,"Viuf");
INSERT INTO kealibrary.cities VALUES (6064,"Jordrup");
INSERT INTO kealibrary.cities VALUES (6070,"Christiansfeld");
INSERT INTO kealibrary.cities VALUES (6091,"Bjert");
INSERT INTO kealibrary.cities VALUES (6092,"Sønder Stenderup");
INSERT INTO kealibrary.cities VALUES (6093,"Sjølund");
INSERT INTO kealibrary.cities VALUES (6094,"Hejls");
INSERT INTO kealibrary.cities VALUES (6100,"Haderslev");
INSERT INTO kealibrary.cities VALUES (6200,"Aabenraa");
INSERT INTO kealibrary.cities VALUES (6230,"Rødekro");
INSERT INTO kealibrary.cities VALUES (6240,"Løgumkloster");
INSERT INTO kealibrary.cities VALUES (6261,"Bredebro");
INSERT INTO kealibrary.cities VALUES (6270,"Tønder");
INSERT INTO kealibrary.cities VALUES (6280,"Højer");
INSERT INTO kealibrary.cities VALUES (6300,"Gråsten");
INSERT INTO kealibrary.cities VALUES (6310,"Broager");
INSERT INTO kealibrary.cities VALUES (6320,"Egernsund");
INSERT INTO kealibrary.cities VALUES (6330,"Padborg");
INSERT INTO kealibrary.cities VALUES (6340,"Kruså");
INSERT INTO kealibrary.cities VALUES (6360,"Tinglev");
INSERT INTO kealibrary.cities VALUES (6372,"Bylderup-Bov");
INSERT INTO kealibrary.cities VALUES (6392,"Bolderslev");
INSERT INTO kealibrary.cities VALUES (6400,"Sønderborg");
INSERT INTO kealibrary.cities VALUES (6430,"Nordborg");
INSERT INTO kealibrary.cities VALUES (6440,"Augustenborg");
INSERT INTO kealibrary.cities VALUES (6470,"Sydals");
INSERT INTO kealibrary.cities VALUES (6500,"Vojens");
INSERT INTO kealibrary.cities VALUES (6510,"Gram");
INSERT INTO kealibrary.cities VALUES (6520,"Toftlund");
INSERT INTO kealibrary.cities VALUES (6534,"Agerskov");
INSERT INTO kealibrary.cities VALUES (6535,"Branderup J");
INSERT INTO kealibrary.cities VALUES (6541,"Bevtoft");
INSERT INTO kealibrary.cities VALUES (6560,"Sommersted");
INSERT INTO kealibrary.cities VALUES (6580,"Vamdrup");
INSERT INTO kealibrary.cities VALUES (6600,"Vejen");
INSERT INTO kealibrary.cities VALUES (6621,"Gesten");
INSERT INTO kealibrary.cities VALUES (6622,"Bække");
INSERT INTO kealibrary.cities VALUES (6623,"Vorbasse");
INSERT INTO kealibrary.cities VALUES (6630,"Rødding");
INSERT INTO kealibrary.cities VALUES (6640,"Lunderskov");
INSERT INTO kealibrary.cities VALUES (6650,"Brørup");
INSERT INTO kealibrary.cities VALUES (6660,"Lintrup");
INSERT INTO kealibrary.cities VALUES (6670,"Holsted");
INSERT INTO kealibrary.cities VALUES (6682,"Hovborg");
INSERT INTO kealibrary.cities VALUES (6683,"Føvling");
INSERT INTO kealibrary.cities VALUES (6690,"Gørding");
INSERT INTO kealibrary.cities VALUES (6700,"Esbjerg");
INSERT INTO kealibrary.cities VALUES (6701,"Esbjerg");
INSERT INTO kealibrary.cities VALUES (6705,"Esbjerg Ø");
INSERT INTO kealibrary.cities VALUES (6710,"Esbjerg V");
INSERT INTO kealibrary.cities VALUES (6715,"Esbjerg N");
INSERT INTO kealibrary.cities VALUES (6720,"Fanø");
INSERT INTO kealibrary.cities VALUES (6731,"Tjæreborg");
INSERT INTO kealibrary.cities VALUES (6740,"Bramming");
INSERT INTO kealibrary.cities VALUES (6752,"Glejbjerg");
INSERT INTO kealibrary.cities VALUES (6753,"Agerbæk");
INSERT INTO kealibrary.cities VALUES (6760,"Ribe");
INSERT INTO kealibrary.cities VALUES (6771,"Gredstedbro");
INSERT INTO kealibrary.cities VALUES (6780,"Skærbæk");
INSERT INTO kealibrary.cities VALUES (6792,"Rømø");
INSERT INTO kealibrary.cities VALUES (6800,"Varde");
INSERT INTO kealibrary.cities VALUES (6818,"Årre");
INSERT INTO kealibrary.cities VALUES (6823,"Ansager");
INSERT INTO kealibrary.cities VALUES (6830,"Nørre Nebel");
INSERT INTO kealibrary.cities VALUES (6840,"Oksbøl");
INSERT INTO kealibrary.cities VALUES (6851,"Janderup Vestj");
INSERT INTO kealibrary.cities VALUES (6852,"Billum");
INSERT INTO kealibrary.cities VALUES (6853,"Vejers Strand");
INSERT INTO kealibrary.cities VALUES (6854,"Henne");
INSERT INTO kealibrary.cities VALUES (6855,"Outrup");
INSERT INTO kealibrary.cities VALUES (6857,"Blåvand");
INSERT INTO kealibrary.cities VALUES (6862,"Tistrup");
INSERT INTO kealibrary.cities VALUES (6870,"Ølgod");
INSERT INTO kealibrary.cities VALUES (6880,"Tarm");
INSERT INTO kealibrary.cities VALUES (6893,"Hemmet");
INSERT INTO kealibrary.cities VALUES (6900,"Skjern");
INSERT INTO kealibrary.cities VALUES (6920,"Videbæk");
INSERT INTO kealibrary.cities VALUES (6933,"Kibæk");
INSERT INTO kealibrary.cities VALUES (6940,"Lem St");
INSERT INTO kealibrary.cities VALUES (6950,"Ringkøbing");
INSERT INTO kealibrary.cities VALUES (6960,"Hvide Sande");
INSERT INTO kealibrary.cities VALUES (6971,"Spjald");
INSERT INTO kealibrary.cities VALUES (6973,"Ørnhøj");
INSERT INTO kealibrary.cities VALUES (6980,"Tim");
INSERT INTO kealibrary.cities VALUES (6990,"Ulfborg");
INSERT INTO kealibrary.cities VALUES (7000,"Fredericia");
INSERT INTO kealibrary.cities VALUES (7007,"Fredericia");
INSERT INTO kealibrary.cities VALUES (7029,"Fredericia");
INSERT INTO kealibrary.cities VALUES (7080,"Børkop");
INSERT INTO kealibrary.cities VALUES (7100,"Vejle");
INSERT INTO kealibrary.cities VALUES (7120,"Vejle Øst");
INSERT INTO kealibrary.cities VALUES (7130,"Juelsminde");
INSERT INTO kealibrary.cities VALUES (7140,"Stouby");
INSERT INTO kealibrary.cities VALUES (7150,"Barrit");
INSERT INTO kealibrary.cities VALUES (7160,"Tørring");
INSERT INTO kealibrary.cities VALUES (7171,"Uldum");
INSERT INTO kealibrary.cities VALUES (7173,"Vonge");
INSERT INTO kealibrary.cities VALUES (7182,"Bredsten");
INSERT INTO kealibrary.cities VALUES (7183,"Randbøl");
INSERT INTO kealibrary.cities VALUES (7184,"Vandel");
INSERT INTO kealibrary.cities VALUES (7190,"Billund");
INSERT INTO kealibrary.cities VALUES (7200,"Grindsted");
INSERT INTO kealibrary.cities VALUES (7250,"Hejnsvig");
INSERT INTO kealibrary.cities VALUES (7260,"Sønder Omme");
INSERT INTO kealibrary.cities VALUES (7270,"Stakroge");
INSERT INTO kealibrary.cities VALUES (7280,"Sønder Felding");
INSERT INTO kealibrary.cities VALUES (7300,"Jelling");
INSERT INTO kealibrary.cities VALUES (7321,"Gadbjerg");
INSERT INTO kealibrary.cities VALUES (7323,"Give");
INSERT INTO kealibrary.cities VALUES (7330,"Brande");
INSERT INTO kealibrary.cities VALUES (7361,"Ejstrupholm");
INSERT INTO kealibrary.cities VALUES (7362,"Hampen");
INSERT INTO kealibrary.cities VALUES (7400,"Herning");
INSERT INTO kealibrary.cities VALUES (7401,"Herning");
INSERT INTO kealibrary.cities VALUES (7429,"Herning");
INSERT INTO kealibrary.cities VALUES (7430,"Ikast");
INSERT INTO kealibrary.cities VALUES (7441,"Bording");
INSERT INTO kealibrary.cities VALUES (7442,"Engesvang");
INSERT INTO kealibrary.cities VALUES (7451,"Sunds");
INSERT INTO kealibrary.cities VALUES (7470,"Karup J");
INSERT INTO kealibrary.cities VALUES (7480,"Vildbjerg");
INSERT INTO kealibrary.cities VALUES (7490,"Aulum");
INSERT INTO kealibrary.cities VALUES (7500,"Holstebro");
INSERT INTO kealibrary.cities VALUES (7540,"Haderup");
INSERT INTO kealibrary.cities VALUES (7550,"Sørvad");
INSERT INTO kealibrary.cities VALUES (7560,"Hjerm");
INSERT INTO kealibrary.cities VALUES (7570,"Vemb");
INSERT INTO kealibrary.cities VALUES (7600,"Struer");
INSERT INTO kealibrary.cities VALUES (7620,"Lemvig");
INSERT INTO kealibrary.cities VALUES (7650,"Bøvlingbjerg");
INSERT INTO kealibrary.cities VALUES (7660,"Bækmarksbro");
INSERT INTO kealibrary.cities VALUES (7673,"Harboøre");
INSERT INTO kealibrary.cities VALUES (7680,"Thyborøn");
INSERT INTO kealibrary.cities VALUES (7700,"Thisted");
INSERT INTO kealibrary.cities VALUES (7730,"Hanstholm");
INSERT INTO kealibrary.cities VALUES (7741,"Frøstrup");
INSERT INTO kealibrary.cities VALUES (7742,"Vesløs");
INSERT INTO kealibrary.cities VALUES (7752,"Snedsted");
INSERT INTO kealibrary.cities VALUES (7755,"Bedsted Thy");
INSERT INTO kealibrary.cities VALUES (7760,"Hurup Thy");
INSERT INTO kealibrary.cities VALUES (7770,"Vestervig");
INSERT INTO kealibrary.cities VALUES (7790,"Thyholm");
INSERT INTO kealibrary.cities VALUES (7800,"Skive");
INSERT INTO kealibrary.cities VALUES (7830,"Vinderup");
INSERT INTO kealibrary.cities VALUES (7840,"Højslev");
INSERT INTO kealibrary.cities VALUES (7850,"Stoholm Jyll");
INSERT INTO kealibrary.cities VALUES (7860,"Spøttrup");
INSERT INTO kealibrary.cities VALUES (7870,"Roslev");
INSERT INTO kealibrary.cities VALUES (7884,"Fur");
INSERT INTO kealibrary.cities VALUES (7900,"Nykøbing M");
INSERT INTO kealibrary.cities VALUES (7950,"Erslev");
INSERT INTO kealibrary.cities VALUES (7960,"Karby");
INSERT INTO kealibrary.cities VALUES (7970,"Redsted M");
INSERT INTO kealibrary.cities VALUES (7980,"Vils");
INSERT INTO kealibrary.cities VALUES (7990,"Øster Assels");
INSERT INTO kealibrary.cities VALUES (8000,"Århus C");
INSERT INTO kealibrary.cities VALUES (8011,"Århus C");
INSERT INTO kealibrary.cities VALUES (8100,"Århus C");
INSERT INTO kealibrary.cities VALUES (8200,"Århus N");
INSERT INTO kealibrary.cities VALUES (8210,"Århus V");
INSERT INTO kealibrary.cities VALUES (8220,"Brabrand");
INSERT INTO kealibrary.cities VALUES (8229,"Risskov Ø");
INSERT INTO kealibrary.cities VALUES (8230,"Åbyhøj");
INSERT INTO kealibrary.cities VALUES (8240,"Risskov");
INSERT INTO kealibrary.cities VALUES (8245,"Risskov Ø");
INSERT INTO kealibrary.cities VALUES (8250,"Egå");
INSERT INTO kealibrary.cities VALUES (8260,"Viby J");
INSERT INTO kealibrary.cities VALUES (8270,"Højbjerg");
INSERT INTO kealibrary.cities VALUES (8300,"Odder");
INSERT INTO kealibrary.cities VALUES (8305,"Samsø");
INSERT INTO kealibrary.cities VALUES (8310,"Tranbjerg J");
INSERT INTO kealibrary.cities VALUES (8320,"Mårslet");
INSERT INTO kealibrary.cities VALUES (8330,"Beder");
INSERT INTO kealibrary.cities VALUES (8340,"Malling");
INSERT INTO kealibrary.cities VALUES (8350,"Hundslund");
INSERT INTO kealibrary.cities VALUES (8355,"Solbjerg");
INSERT INTO kealibrary.cities VALUES (8361,"Hasselager");
INSERT INTO kealibrary.cities VALUES (8362,"Hørning");
INSERT INTO kealibrary.cities VALUES (8370,"Hadsten");
INSERT INTO kealibrary.cities VALUES (8380,"Trige");
INSERT INTO kealibrary.cities VALUES (8381,"Tilst");
INSERT INTO kealibrary.cities VALUES (8382,"Hinnerup");
INSERT INTO kealibrary.cities VALUES (8400,"Ebeltoft");
INSERT INTO kealibrary.cities VALUES (8410,"Rønde");
INSERT INTO kealibrary.cities VALUES (8420,"Knebel");
INSERT INTO kealibrary.cities VALUES (8444,"Balle");
INSERT INTO kealibrary.cities VALUES (8450,"Hammel");
INSERT INTO kealibrary.cities VALUES (8462,"Harlev J");
INSERT INTO kealibrary.cities VALUES (8464,"Galten");
INSERT INTO kealibrary.cities VALUES (8471,"Sabro");
INSERT INTO kealibrary.cities VALUES (8472,"Sporup");
INSERT INTO kealibrary.cities VALUES (8500,"Grenaa");
INSERT INTO kealibrary.cities VALUES (8520,"Lystrup");
INSERT INTO kealibrary.cities VALUES (8530,"Hjortshøj");
INSERT INTO kealibrary.cities VALUES (8541,"Skødstrup");
INSERT INTO kealibrary.cities VALUES (8543,"Hornslet");
INSERT INTO kealibrary.cities VALUES (8544,"Mørke");
INSERT INTO kealibrary.cities VALUES (8550,"Ryomgård");
INSERT INTO kealibrary.cities VALUES (8560,"Kolind");
INSERT INTO kealibrary.cities VALUES (8570,"Trustrup");
INSERT INTO kealibrary.cities VALUES (8581,"Nimtofte");
INSERT INTO kealibrary.cities VALUES (8585,"Glesborg");
INSERT INTO kealibrary.cities VALUES (8586,"Ørum Djurs");
INSERT INTO kealibrary.cities VALUES (8592,"Anholt");
INSERT INTO kealibrary.cities VALUES (8600,"Silkeborg");
INSERT INTO kealibrary.cities VALUES (8620,"Kjellerup");
INSERT INTO kealibrary.cities VALUES (8632,"Lemming");
INSERT INTO kealibrary.cities VALUES (8641,"Sorring");
INSERT INTO kealibrary.cities VALUES (8643,"Ans By");
INSERT INTO kealibrary.cities VALUES (8653,"Them");
INSERT INTO kealibrary.cities VALUES (8654,"Bryrup");
INSERT INTO kealibrary.cities VALUES (8660,"Skanderborg");
INSERT INTO kealibrary.cities VALUES (8670,"Låsby");
INSERT INTO kealibrary.cities VALUES (8680,"Ry");
INSERT INTO kealibrary.cities VALUES (8700,"Horsens");
INSERT INTO kealibrary.cities VALUES (8721,"Daugård");
INSERT INTO kealibrary.cities VALUES (8722,"Hedensted");
INSERT INTO kealibrary.cities VALUES (8723,"Løsning");
INSERT INTO kealibrary.cities VALUES (8732,"Hovedgård");
INSERT INTO kealibrary.cities VALUES (8740,"Brædstrup");
INSERT INTO kealibrary.cities VALUES (8751,"Gedved");
INSERT INTO kealibrary.cities VALUES (8752,"Østbirk");
INSERT INTO kealibrary.cities VALUES (8762,"Flemming");
INSERT INTO kealibrary.cities VALUES (8763,"Rask Mølle");
INSERT INTO kealibrary.cities VALUES (8765,"Klovborg");
INSERT INTO kealibrary.cities VALUES (8766,"Nørre Snede");
INSERT INTO kealibrary.cities VALUES (8781,"Stenderup");
INSERT INTO kealibrary.cities VALUES (8783,"Hornsyld");
INSERT INTO kealibrary.cities VALUES (8800,"Viborg");
INSERT INTO kealibrary.cities VALUES (8830,"Tjele");
INSERT INTO kealibrary.cities VALUES (8831,"Løgstrup");
INSERT INTO kealibrary.cities VALUES (8832,"Skals");
INSERT INTO kealibrary.cities VALUES (8840,"Rødkærsbro");
INSERT INTO kealibrary.cities VALUES (8850,"Bjerringbro");
INSERT INTO kealibrary.cities VALUES (8860,"Ulstrup");
INSERT INTO kealibrary.cities VALUES (8870,"Langå");
INSERT INTO kealibrary.cities VALUES (8881,"Thorsø");
INSERT INTO kealibrary.cities VALUES (8882,"Fårvang");
INSERT INTO kealibrary.cities VALUES (8883,"Gjern");
INSERT INTO kealibrary.cities VALUES (8900,"Randers C");
INSERT INTO kealibrary.cities VALUES (8920,"Randers NV");
INSERT INTO kealibrary.cities VALUES (8930,"Randers NØ");
INSERT INTO kealibrary.cities VALUES (8940,"Randers SV");
INSERT INTO kealibrary.cities VALUES (8950,"Ørsted");
INSERT INTO kealibrary.cities VALUES (8960,"Randers SØ");
INSERT INTO kealibrary.cities VALUES (8961,"Allingåbro");
INSERT INTO kealibrary.cities VALUES (8963,"Auning");
INSERT INTO kealibrary.cities VALUES (8970,"Havndal");
INSERT INTO kealibrary.cities VALUES (8981,"Spentrup");
INSERT INTO kealibrary.cities VALUES (8983,"Gjerlev J");
INSERT INTO kealibrary.cities VALUES (8990,"Fårup");
INSERT INTO kealibrary.cities VALUES (9000,"Aalborg");
INSERT INTO kealibrary.cities VALUES (9020,"Aalborg");
INSERT INTO kealibrary.cities VALUES (9029,"Aalborg");
INSERT INTO kealibrary.cities VALUES (9100,"Aalborg");
INSERT INTO kealibrary.cities VALUES (9200,"Aalborg SV");
INSERT INTO kealibrary.cities VALUES (9210,"Aalborg SØ");
INSERT INTO kealibrary.cities VALUES (9220,"Aalborg Øst");
INSERT INTO kealibrary.cities VALUES (9230,"Svenstrup J");
INSERT INTO kealibrary.cities VALUES (9240,"Nibe");
INSERT INTO kealibrary.cities VALUES (9260,"Gistrup");
INSERT INTO kealibrary.cities VALUES (9270,"Klarup");
INSERT INTO kealibrary.cities VALUES (9280,"Storvorde");
INSERT INTO kealibrary.cities VALUES (9293,"Kongerslev");
INSERT INTO kealibrary.cities VALUES (9300,"Sæby");
INSERT INTO kealibrary.cities VALUES (9310,"Vodskov");
INSERT INTO kealibrary.cities VALUES (9320,"Hjallerup");
INSERT INTO kealibrary.cities VALUES (9330,"Dronninglund");
INSERT INTO kealibrary.cities VALUES (9340,"Asaa");
INSERT INTO kealibrary.cities VALUES (9352,"Dybvad");
INSERT INTO kealibrary.cities VALUES (9362,"Gandrup");
INSERT INTO kealibrary.cities VALUES (9370,"Hals");
INSERT INTO kealibrary.cities VALUES (9380,"Vestbjerg");
INSERT INTO kealibrary.cities VALUES (9381,"Sulsted");
INSERT INTO kealibrary.cities VALUES (9382,"Tylstrup");
INSERT INTO kealibrary.cities VALUES (9400,"Nørresundby");
INSERT INTO kealibrary.cities VALUES (9430,"Vadum");
INSERT INTO kealibrary.cities VALUES (9440,"Aabybro");
INSERT INTO kealibrary.cities VALUES (9460,"Brovst");
INSERT INTO kealibrary.cities VALUES (9480,"Løkken");
INSERT INTO kealibrary.cities VALUES (9490,"Pandrup");
INSERT INTO kealibrary.cities VALUES (9492,"Blokhus");
INSERT INTO kealibrary.cities VALUES (9493,"Saltum");
INSERT INTO kealibrary.cities VALUES (9500,"Hobro");
INSERT INTO kealibrary.cities VALUES (9510,"Arden");
INSERT INTO kealibrary.cities VALUES (9520,"Skørping");
INSERT INTO kealibrary.cities VALUES (9530,"Støvring");
INSERT INTO kealibrary.cities VALUES (9541,"Suldrup");
INSERT INTO kealibrary.cities VALUES (9550,"Mariager");
INSERT INTO kealibrary.cities VALUES (9560,"Hadsund");
INSERT INTO kealibrary.cities VALUES (9574,"Bælum");
INSERT INTO kealibrary.cities VALUES (9575,"Terndrup");
INSERT INTO kealibrary.cities VALUES (9600,"Aars");
INSERT INTO kealibrary.cities VALUES (9610,"Nørager");
INSERT INTO kealibrary.cities VALUES (9620,"Aalestrup");
INSERT INTO kealibrary.cities VALUES (9631,"Gedsted");
INSERT INTO kealibrary.cities VALUES (9632,"Møldrup");
INSERT INTO kealibrary.cities VALUES (9640,"Farsø");
INSERT INTO kealibrary.cities VALUES (9670,"Løgstør");
INSERT INTO kealibrary.cities VALUES (9681,"Ranum");
INSERT INTO kealibrary.cities VALUES (9690,"Fjerritslev");
INSERT INTO kealibrary.cities VALUES (9700,"Brønderslev");
INSERT INTO kealibrary.cities VALUES (9740,"Jerslev J");
INSERT INTO kealibrary.cities VALUES (9750,"Østervrå");
INSERT INTO kealibrary.cities VALUES (9760,"Vrå");
INSERT INTO kealibrary.cities VALUES (9800,"Hjørring");
INSERT INTO kealibrary.cities VALUES (9830,"Tårs");
INSERT INTO kealibrary.cities VALUES (9850,"Hirtshals");
INSERT INTO kealibrary.cities VALUES (9870,"Sindal");
INSERT INTO kealibrary.cities VALUES (9881,"Bindslev");
INSERT INTO kealibrary.cities VALUES (9900,"Frederikshavn");
INSERT INTO kealibrary.cities VALUES (9940,"Læsø");
INSERT INTO kealibrary.cities VALUES (9970,"Strandby");
INSERT INTO kealibrary.cities VALUES (9981,"Jerup");
INSERT INTO kealibrary.cities VALUES (9982,"Ålbæk");

INSERT INTO kealibrary.categories VALUES (1,"nonfiction");
INSERT INTO kealibrary.categories VALUES (2,"fiction");

INSERT INTO kealibrary.e_roles VALUES (1, "Librarian");
INSERT INTO kealibrary.e_roles VALUES (2, "Assistant librarian");
INSERT INTO kealibrary.e_roles VALUES (3, "Janitor");

INSERT INTO kealibrary.genres VALUES (NULL,"science fiction");
INSERT INTO kealibrary.genres VALUES (NULL,"satire");
INSERT INTO kealibrary.genres VALUES (NULL,"drama");
INSERT INTO kealibrary.genres VALUES (NULL,"action and aventure");
INSERT INTO kealibrary.genres VALUES (NULL,"romance");
INSERT INTO kealibrary.genres VALUES (NULL,"mystery");
INSERT INTO kealibrary.genres VALUES (NULL,"horror");
INSERT INTO kealibrary.genres VALUES (NULL,"self help");
INSERT INTO kealibrary.genres VALUES (NULL,"health");
INSERT INTO kealibrary.genres VALUES (NULL,"cooking");
INSERT INTO kealibrary.genres VALUES (NULL,"guide");
INSERT INTO kealibrary.genres VALUES (NULL,"travel");
INSERT INTO kealibrary.genres VALUES (NULL,"children's");
INSERT INTO kealibrary.genres VALUES (NULL,"religion, spirituality & new age");
INSERT INTO kealibrary.genres VALUES (NULL,"science");
INSERT INTO kealibrary.genres VALUES (NULL,"history");
INSERT INTO kealibrary.genres VALUES (NULL,"math");
INSERT INTO kealibrary.genres VALUES (NULL,"anthology");
INSERT INTO kealibrary.genres VALUES (NULL,"poetry");
INSERT INTO kealibrary.genres VALUES (NULL,"encyclopedias");
INSERT INTO kealibrary.genres VALUES (NULL,"dictionaries");
INSERT INTO kealibrary.genres VALUES (NULL,"comics");
INSERT INTO kealibrary.genres VALUES (NULL,"art");
INSERT INTO kealibrary.genres VALUES (NULL,"cookbooks");
INSERT INTO kealibrary.genres VALUES (NULL,"diaries");
INSERT INTO kealibrary.genres VALUES (NULL,"journals");
INSERT INTO kealibrary.genres VALUES (NULL,"prayer books");
INSERT INTO kealibrary.genres VALUES (NULL,"series");
INSERT INTO kealibrary.genres VALUES (NULL,"trilogy");
INSERT INTO kealibrary.genres VALUES (NULL,"biographies");
INSERT INTO kealibrary.genres VALUES (NULL,"autobiographies");
INSERT INTO kealibrary.genres VALUES (NULL,"fantasy");

INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('0109652713', '2100 ', 'Hans', 'Nielsen', 'hansy@gmail.com', 'm', '1965-01-09', 'Lersø Parkallé 61', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('0812554823', '2100', 'Jens', 'Hansen', 'jenders@hotmail.com', 'm', '1955-12-08', 'Romsøgade 5,', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('1901684327', '2400', 'Johanna', 'Rasmussen', 'joh@hotmail.com', 'f', '1968-01-19', 'Hyrdevangen 57', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('2006417834', '2200 ', 'Alicia', 'Zelaya', 'alicia@gmail.com', 'f', '1941-06-20', 'Lundtoftegade 17', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('150954312', '2200', 'Jens', 'Jensen', 'jens@gmail.com', 'm', '1995-09-15', 'Titangade 3', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('220588653', '2000', 'Poul', 'Petersen', 'poul5@gmail.com', 'm', '1988-05-22', 'Guldborgvej 25', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('1906816543', '2400 ', 'Isabella', 'Madsen', 'vell32@live.com', 'f', '1981-06-19', 'Hvidkildevej 66', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('0101952934', '2400', 'Jensigne', 'Kristensen', 'jensigne@yahoo.com', 'f', '1995-01-01', 'Engsvinget 7', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('230289756', '2400', 'Frederik', 'Olsen', 'fredddd@live.com', 'm', '1989-02-23', 'Bøllegård Allé 13', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('1404955883', '2200', 'Erik', 'Thomsen', 'erik66@gmail.com', 'm', '1995-04-14', 'Sigynsgade 65', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('290692545', '2400', 'Severine', 'Christiansen', 'seve@gmail.com', 'f', '1992-06-29', 'Møllerlodden 13', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('230598254', '2400', 'Inge', 'Poulsen', 'inge@mail.com', 'f', '1998-05-23', 'Svanevej 26B', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('020784345', '2400', 'Jane', 'Johansen', 'jane@gmail.com', 'f', '1984-07-02', 'Lygten 16', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('1607658423', '2400', 'Claus', 'Jacobsen', 'claus@gmail.com', 'm', '1965-07-16', 'Lygten 16', '1', NULL);
INSERT INTO kealibrary.members (cpr, city_zip, fname, lname, email, gender, bdate, address, status, image) VALUES ('1504763231', '2400', 'Stan', 'Frederiksen', 'stan@hotmail.com', 'm', '1976-04-15', 'Tagensvej 186H', '1', NULL);

INSERT INTO kealibrary.employees (cpr, city_zip, er_id, fname, lname, email, gender, bdate, address, image) VALUES ('1104709320', '2400', '1', 'Ina', 'Jespersen', 'ina@gmail.com', 'f', '1970-04-11', 'Bogtrykkervej 1,', NULL);
INSERT INTO kealibrary.employees (cpr, city_zip, er_id, fname, lname, email, gender, bdate, address, image) VALUES ('1407591232', '2200', '3', 'Frands', 'Mogensen', 'frands@live.com', 'm', '1959-07-14', 'Rovsingsgade 97', NULL);
INSERT INTO kealibrary.employees (cpr, city_zip, er_id, fname, lname, email, gender, bdate, address, image) VALUES ('1611904323', '2400', '2', 'Jasmin', 'Nissen', 'jasmmmt@hotmail.com', 'f', '1990-11-16', 'Blåmejsevej 9', NULL);

INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1611904323', '2017-03-26 02:14:12', '2017-03-26 12:29:23');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1407591232', '2017-03-28 06:15:16', '2017-03-28 16:35:28');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1104709320', '2017-03-29 09:21:18', '2017-03-29 19:43:38');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1104709320', '2017-03-30 15:31:29', '2017-03-30 22:47:38');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1407591232', '2017-04-01 10:20:24', '2017-04-01 17:33:34');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1611904323', '2017-04-02 20:09:08', '2017-04-03 05:15:13');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1104709320', '2017-04-02 11:20:12', '2017-04-04 20:25:34');
INSERT INTO kealibrary.hours (id, employee_cpr, from_dt, to_dt) VALUES (NULL, '1104709320', '2017-04-24 07:20:18', '2017-04-24 21:29:29');

INSERT INTO kealibrary.salaries (id, employee_cpr, amount, from_d) VALUES (NULL, '1104709320', '40000.00', '2017-02-07');
INSERT INTO kealibrary.salaries (id, employee_cpr, amount, from_d) VALUES (NULL, '1407591232', '12000.00', '2017-03-15');   
INSERT INTO kealibrary.salaries (id, employee_cpr, amount, from_d) VALUES (NULL, '1611904323', '30000.00', '2016-12-07');

INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Richard', 'Dawkins', '1976-06-08', '2017-02-05', 'Clinton Richard Dawkins FRS FRSL is an English ethologist, evolutionary biologist and author. He is an emeritus fellow of New College, Oxford, and was the University of Oxford''s Professor for Public Understanding of Science from 1995 until 2008.', 'dawkings.png');
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'George', 'Orwell', '1903-06-25', '1950-01-21', 'Eric Arthur Blair, better known by his pen name George Orwell, was an English author and journalist. His work is marked by keen intelligence and wit, a profound awareness of social injustice, an intense opposition to totalitarianism, a passion for clarity in language, and a belief in democratic socialism.', 'orwell.png');
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Aldous', 'Huxley', '1894-07-26', '1936-11-22', 'Aldous Leonard Huxley was an English writer and one of the most prominent members of the famous Huxley family. He spent the latter part of his life in the United States, living in Los Angeles from 1937 until his death in 1963. Best known for his novels and wide-ranging output of essays, he also published short stories, poetry, travel writing, and film stories and scripts. Through his novels and essays Huxley functioned as an examiner and sometimes critic of social mores, norms and ideals. Huxley was a humanist but was also interested towards the end of his life in spiritual subjects such as parapsychology and philosophical mysticism. By the end of his life, Huxley was widely acknowledged as one of the pre-eminent intellectuals of his time.', 'huxley.png'), (NULL, 'Albert', 'Camus', '1913-11-07', '1960-01-04', 'Albert Camus was a representative of non-metropolitan French literature. His origin in Algeria and his experiences there in the thirties were dominating influences in his thought and work. Of semi-proletarian parents, early attached to intellectual circles of strongly revolutionary tendencies, with a deep interest in philosophy (only chance prevented him from pursuing a university career in that field), he came to France at the age of twenty-five. The man and the times met: Camus joined the resistance movement during the occupation and after the liberation was a columnist for the newspaper Combat.', 'camus.png');
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Harper', 'Lee', '2017-04-28', '2016-02-16', 'Harper Lee, known as Nelle, was born in the Alabama town of Monroeville, the youngest of four children of Amasa Coleman Lee and Frances Cunningham Finch Lee. Her father, a former newspaper editor and proprietor, was a lawyer who served on the state legislature from 1926 to 1938. As a child, Lee was a tomboy and a precocious reader, and enjoyed the friendship of her schoolmate and neighbor, the young Truman Capote.', 'hlee.png');
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Fernando', 'Pessoa', '1888-06-13', '2016-11-30', 'It is sometimes said that the four greatest Portuguese poets of modern times are Fernando Pessoa. The statement is possible since Pessoa, whose name means ‘person’ in Portuguese, had three alter egos who wrote in styles completely different from his own. ', 'pessoa.png');
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Joseph', 'Smith', '1805-12-23', '1844-06-27', 'Joseph Smith, Jr. was an American religious leader and founder of Mormonism and the Latter Day Saint movement. When he was twenty-four, Smith published the Book of Mormon', NULL);
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Lawrence', 'Wright ', '1947-08-02', NULL, 'Lawrence Wright is a Pulitzer Prize-winning American author, screenwriter, staff writer for The New Yorker magazine, and fellow at the Center for Law and Security at the New York University School of Law.', NULL);
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Mark Z. ', 'Danielewski', '1966-03-14', NULL, NULL, NULL);
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Mary', 'Shelley', '1797-08-30', '1985-02-01', 'Mary Wollstonecraft Shelley was an English novelist, short story writer, dramatist, essayist, biographer, and travel writer, best known for her Gothic novel Frankenstein: or, The Modern Prometheus', 'shelly.png');
INSERT INTO kealibrary.authors (id, fname, lname, b_date, d_date, excerpt, image) VALUES (NULL, 'Joseph', 'Heller', '1923-05-01', '1999-12-12', 'Joseph Heller was an American author of novels, short stories, plays and screenplays. His best-known work is the novel Catch-22, a satire on war and bureaucracy, whose title has become a synonym for an absurd or contradictory choice', 'heller.png');

INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (456456345, '1', '2', '32', '1984', '16', '1950-06-01', CURRENT_TIME(), '356', '1', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (564656642, '2', '2', '32', 'Brave New World', '20', '1998-09-01', '2017-01-04', '269', '1', 'nbw.png');
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (354345532, '3', '2', '32', 'The Stranger', '10', '1989-03-28', '1999-11-15', '123', '2', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (534543623, '4', '2', '32', 'The Book of Disquiet', '12', '2002-12-31', '2010-11-15', '544', '5', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (234324523, '7', '2', '16', 'Going Clear: Scientology, Hollywood, and the Prison of Belief ', '4', '2013-09-12', '2014-04-12', '356', '1', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (463534634, '6', '2', '16', 'The Book of Mormon ', '220', '1876-12-07', '2010-04-04', '455', '2', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (216516516, '8', '2', '7', 'House of Leaves', '7', '2005-03-22', '2008-04-05', '369', '2', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (433463442, '9', '2', '7', 'Frankenstein', '89', '2001-12-13', '2014-07-06', '866', '5', 'frankenstein.png');
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (435435343, '10', '2', '2', 'Catch-22', '70', '1961-11-06', '2017-04-05', '453', '3', 'catch22.png');
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (654665464, '1', '2', '2', 'Animal Farm', '12', '1945-08-17', '2017-02-12', '312', '4', NULL);
INSERT INTO kealibrary.books (isbn, author_id, category_id, genre_id, title, edition, publish_d, archived_d, total_pages, copies, image) VALUES (543435337, '11', '1', '15', 'The Selfish Gene', '22', '1976-04-12', '2017-02-06', '496', '2', 'theselfishgene.png');

INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '216516516', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '234324523', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '354345532', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '433463442', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '435435343', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '456456345', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '463534634', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '534543623', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '543435337', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '564656642', '0');
INSERT INTO kealibrary.book (id, b_isbn, status) VALUES (NULL, '654665464', '0');

INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '20784345', '1', '2017-04-03 11:21:19', '2017-05-03 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '101952934', '5', '2017-02-07 06:24:19', '2017-03-07 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '230289756', '9', '2017-04-02 13:11:21', '2017-05-02 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '1906816543', '5', '2017-04-12 08:27:29', '2017-05-12 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '1906816543', '11', '2017-03-19 08:23:18', '2017-04-19 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '150954312', '4', '2017-04-03 16:34:12', '2017-05-03 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '2006417834', '1', '2017-03-03 15:23:19', '2017-04-03 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '109652713', '8', '2017-03-03 16:29:23', '2017-04-03 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '812554823', '4', '2017-03-16 09:24:23', '2017-04-16 12:30:00', '1');
INSERT INTO kealibrary.lents (id, member_cpr, book_id, lent_d, return_d, status) VALUES (NULL, '1607658423', '8', '2017-03-28 14:30:29', '2017-05-28 12:30:00', '1');

SET FOREIGN_KEY_CHECKS=1;

/************************************/
/**********STORED PROCEDURES*********/
/**check for unreturned books*/
DELIMITER //
CREATE PROCEDURE kealibrary.unreturned_books()
BEGIN
	SELECT * FROM kealibrary.lents WHERE return_d < CURDATE() AND status = 0;
END //
DELIMITER ;
/**execute unreturned_books*/
CALL kealibrary.unreturned_books();

/**count total books*/
DELIMITER //
CREATE PROCEDURE kealibrary.count_books(OUT val INT)
BEGIN
	SELECT COUNT(*) INTO val FROM kealibrary.books;
END //
DELIMITER ;
/**execute count_books*/
CALL kealibrary.count_books(@bookcount);
SELECT @bookcount;

/**upload default user image*/
/**
DELIMITER //
CREATE TRIGGER kealibrary.uploadDefaultUserImage BEFORE UPDATE ON kealibrary.members
FOR EACH ROW
BEGIN
	IF members.image IS NULL THEN
		SET members.image = "default.png";
	END IF;
END //
DELIMITER ;
*/ 

/************************************/
/*********PREPARED STATEMENT*********/
/**prepare select statement*/
PREPARE jasmin_stmt
FROM "SELECT * FROM kealibrary.employees
WHERE fname='Jasmin'";
/**execute jasmin_stmt*/
EXECUTE jasmin_stmt;







