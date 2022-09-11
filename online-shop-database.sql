-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table cosmetics-online-shop.customerstable
CREATE TABLE IF NOT EXISTS `customerstable` (
  `CustomerID` int NOT NULL,
  `ContactName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Adress` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(6) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.customerstable: ~0 rows (approximately)
INSERT INTO `customerstable` (`CustomerID`, `ContactName`, `Adress`, `City`, `PostalCode`, `Country`, `Phone`) VALUES
	(1, 'Dumitriu Alexandra', 'Strada Grivita nr. 5, etaj 2, apartament 29', 'Iasi', '615011', 'Romania', '0755768999'),
	(2, 'Vintu Ioana-Maria', 'Bulevardul Mihai Eminescu nr. 21, scara C, etaj 4, ap. 23', 'Cluj', '755234', 'Romania', '0755765179'),
	(3, 'Gheorghiu Teodora', 'Aleea Nucului nr.14', 'Timisoara', '851225', 'Romania', '0756965179'),
	(4, 'Boutique S.R.L.', 'Strada Pacii nr. 21, scara 5, bloc Z, etaj 5, ap. 13', 'Arad', '331445', 'Romania', '0722551111'),
	(5, 'Makeup-shop S.R.L.', 'Bulevardul Muncii nr. 21, scara C, etaj 5, ap. 14', 'Cluj', '733521', 'Romania', '0755446644'),
	(6, 'Ghinuta Andreea-Marinela', 'Aleea Tiberiu Crudu nr. 10, scara C, etaj 2, ap. 10', 'Bucuresti', '555112', 'Romania', '0722554466');

-- Dumping structure for table cosmetics-online-shop.customertypedescriptiontable
CREATE TABLE IF NOT EXISTS `customertypedescriptiontable` (
  `CustomerTypeID` varchar(20) NOT NULL,
  `CustomerDescription` tinytext,
  PRIMARY KEY (`CustomerTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.customertypedescriptiontable: ~0 rows (approximately)
INSERT INTO `customertypedescriptiontable` (`CustomerTypeID`, `CustomerDescription`) VALUES
	('Persoana fizica', 'II, PFA'),
	('Persoana juridica', 'SRL, SA');

-- Dumping structure for table cosmetics-online-shop.customertypetable
CREATE TABLE IF NOT EXISTS `customertypetable` (
  `CustomerID` int NOT NULL,
  `CustomerTypeID` varchar(20) NOT NULL,
  KEY `CustomerTypeID` (`CustomerTypeID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `customertypetable_ibfk_1` FOREIGN KEY (`CustomerTypeID`) REFERENCES `customertypedescriptiontable` (`CustomerTypeID`),
  CONSTRAINT `customertypetable_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customerstable` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.customertypetable: ~0 rows (approximately)
INSERT INTO `customertypetable` (`CustomerID`, `CustomerTypeID`) VALUES
	(1, 'Persoana fizica'),
	(2, 'Persoana fizica'),
	(3, 'Persoana fizica'),
	(4, 'Persoana juridica'),
	(5, 'Persoana juridica'),
	(6, 'Persoana fizica');

-- Dumping structure for table cosmetics-online-shop.employeesregionstable
CREATE TABLE IF NOT EXISTS `employeesregionstable` (
  `EmployeeID` int NOT NULL,
  `RegionID` int NOT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `employeesregionstable_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employeestable` (`EmployeeID`),
  CONSTRAINT `employeesregionstable_ibfk_2` FOREIGN KEY (`RegionID`) REFERENCES `regionstable` (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.employeesregionstable: ~0 rows (approximately)
INSERT INTO `employeesregionstable` (`EmployeeID`, `RegionID`) VALUES
	(1, 6),
	(2, 6),
	(3, 7),
	(4, 1),
	(5, 8);

-- Dumping structure for table cosmetics-online-shop.employeestable
CREATE TABLE IF NOT EXISTS `employeestable` (
  `EmployeeID` int NOT NULL,
  `EmployeeLastName` varchar(20) NOT NULL,
  `EmployeeFistName` varchar(10) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(13) DEFAULT NULL,
  `ReportsTo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.employeestable: ~0 rows (approximately)
INSERT INTO `employeestable` (`EmployeeID`, `EmployeeLastName`, `EmployeeFistName`, `Title`, `BirthDate`, `HireDate`, `Address`, `City`, `PostalCode`, `Country`, `HomePhone`, `ReportsTo`) VALUES
	(1, 'Dunca', 'Alexandra', 'Operator vanzari', '1986-05-12', '2020-04-15', 'Strada Nucului nr. 13, scara Z, ap. 11, etaj 3', 'Cluj', '711255', 'Romania', '0722511225', 'Gheorghe Mirela'),
	(2, 'Vizitiu', 'Ioana', 'Operator vanzari', '1999-02-12', '2022-04-15', 'Strada Rozelor nr. 34, etaj 4, ap. 21', 'Brasov', '123456', 'Romania', '0755446633', 'Gheorghe Mirela'),
	(3, 'Stefanescu', 'Vladimira', 'Operator vanzari', '1992-05-12', '2019-04-15', 'Strada 1 Decembrie nr. 17, scara C, etaj 7, ap. 25', 'Timisoara', '857223', 'Romania', '0755756633', 'Gheorghe Mirela'),
	(4, 'Vladimirescu', 'Bogdana', 'Operator vanzari', '1982-05-24', '2016-04-15', 'Strada Constantin Ganea nr. 5, scara A, etaj 1, ap. 3', 'Iasi', '615544', 'Romania', '0788966321', 'Gheorghe Mirela'),
	(5, 'Tudor', 'Livia', 'Operator vanzari', '1989-07-14', '2018-04-19', 'Strada Poetului nr. 1/C, etaj 2, ap. 13', 'Oradea', '445667', 'Romania', '0788966891', 'Gheorghe Mirela');

-- Dumping structure for table cosmetics-online-shop.orderdetailtable
CREATE TABLE IF NOT EXISTS `orderdetailtable` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Quantity` varchar(20) DEFAULT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetailtable_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordertable` (`OrderID`),
  CONSTRAINT `orderdetailtable_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `productstable` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.orderdetailtable: ~0 rows (approximately)
INSERT INTO `orderdetailtable` (`OrderID`, `ProductID`, `UnitPrice`, `Quantity`) VALUES
	(1, 4, 361.00, '2'),
	(2, 3, 361.00, '1'),
	(3, 7, 455.00, '1'),
	(4, 3, 361.00, '1'),
	(5, 1, 279.00, '1');

-- Dumping structure for table cosmetics-online-shop.ordertable
CREATE TABLE IF NOT EXISTS `ordertable` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `Freight` decimal(10,2) DEFAULT NULL,
  `ShipName` varchar(40) DEFAULT NULL,
  `ShipAdress` varchar(60) DEFAULT NULL,
  `ShipCity` varchar(15) DEFAULT NULL,
  `ShipPostalCode` varchar(10) DEFAULT NULL,
  `ShipCountry` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customerstable` (`CustomerID`),
  CONSTRAINT `ordertable_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employeestable` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.ordertable: ~0 rows (approximately)
INSERT INTO `ordertable` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `ShippedDate`, `Freight`, `ShipName`, `ShipAdress`, `ShipCity`, `ShipPostalCode`, `ShipCountry`) VALUES
	(1, 5, 2, '2022-09-05', '2022-09-06', 15.00, 'Dumitriu Alexandra', 'Strada Grivita nr. 5, etaj 2, apartament 29', 'Iasi', '615011', 'Romania'),
	(2, 3, 3, '2022-09-05', '2022-09-06', 15.00, 'Gheorghiu Teodora', 'Aleea Nucului nr.14', 'Timisoara', '851225', 'Romania'),
	(3, 2, 1, '2022-09-05', '2022-09-06', 15.00, 'Vintu Ioana-Maria', 'Bulevardul Mihai Eminescu nr. 21, scara C, etaj 4, ap. 23', 'Cluj', '755234', 'Romania'),
	(4, 3, 3, '2022-09-06', '2022-09-07', 15.00, 'Gheorghiu Teodora', 'Aleea Nucului nr.14', 'Timisoara', '851225', 'Romania'),
	(5, 5, 1, '2022-09-06', '2022-09-07', 15.00, 'Makeup-shop S.R.L.', 'Bulevardul Muncii nr. 21, scara C, etaj 5, ap. 14', 'Cluj', '733521', 'Romania');

-- Dumping structure for table cosmetics-online-shop.productscategorytable
CREATE TABLE IF NOT EXISTS `productscategorytable` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(15) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.productscategorytable: ~0 rows (approximately)
INSERT INTO `productscategorytable` (`CategoryID`, `CategoryName`) VALUES
	(1, 'Machiaj'),
	(2, 'Ingrijire ten'),
	(3, 'Par'),
	(4, 'Parfumuri'),
	(5, 'Baie si corp');

-- Dumping structure for table cosmetics-online-shop.productstable
CREATE TABLE IF NOT EXISTS `productstable` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `Quantity` varchar(20) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `UnitsInStock` smallint DEFAULT NULL,
  `UnitsOnOrder` smallint DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `productstable_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplierstable` (`SupplierID`),
  CONSTRAINT `productstable_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `productscategorytable` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.productstable: ~0 rows (approximately)
INSERT INTO `productstable` (`ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `Quantity`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`) VALUES
	(1, 'Fond de Ten-Estee Lauder Double Wear', 1, 1, '54', 279.00, 57, 13),
	(2, 'Apa de parfum - Dior Jadore', 1, 4, '10', 399.00, 13, 3),
	(3, 'Apa de parfum - Paco Rabanne', 3, 4, '5', 361.00, 7, 2),
	(4, 'Paleta pentru ochi - Tartelette in bloom', 4, 1, '5', 361.00, 7, 2),
	(5, 'Paleta pentru ochi - Huda Beauty Nude', 4, 1, '5', 279.00, 7, 2),
	(6, 'Paleta pentru ochi - Natasha My Dream', 3, 1, '7', 360.00, 9, 2),
	(7, 'Ser pentru fata - Estee Lauder Advanced', 4, 2, '0', 445.00, 4, 4),
	(8, 'Ser pentru fata - Fresh Tea Elixir', 3, 2, '1', 445.00, 3, 2);

-- Dumping structure for table cosmetics-online-shop.regionstable
CREATE TABLE IF NOT EXISTS `regionstable` (
  `RegionID` int NOT NULL,
  `RegionDescription` varchar(30) NOT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.regionstable: ~0 rows (approximately)
INSERT INTO `regionstable` (`RegionID`, `RegionDescription`) VALUES
	(1, 'Moldova'),
	(2, 'Bucovina'),
	(3, 'Dobrogea'),
	(4, 'Muntenia'),
	(5, 'Oltenia'),
	(6, 'Transilvania'),
	(7, 'Banat'),
	(8, 'Crisana'),
	(9, 'Maramures'),
	(10, 'Strainatate');

-- Dumping structure for table cosmetics-online-shop.shipperstable
CREATE TABLE IF NOT EXISTS `shipperstable` (
  `ShipperID` int NOT NULL,
  `CompanyName` varchar(60) NOT NULL,
  `Phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.shipperstable: ~0 rows (approximately)
INSERT INTO `shipperstable` (`ShipperID`, `CompanyName`, `Phone`) VALUES
	(1, 'Fedex', '0755123654'),
	(2, 'TNT', '0755496654'),
	(3, 'Cargus', '0755646133'),
	(4, 'FanCourier', '0789646133');

-- Dumping structure for table cosmetics-online-shop.supplierstable
CREATE TABLE IF NOT EXISTS `supplierstable` (
  `SupplierID` int NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Adress` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table cosmetics-online-shop.supplierstable: ~0 rows (approximately)
INSERT INTO `supplierstable` (`SupplierID`, `CompanyName`, `ContactName`, `ContactTitle`, `Adress`, `City`, `PostalCode`, `Country`, `Phone`) VALUES
	(1, 'Notino S.R.L.', 'Alexandrescu Matei', 'Responsabil vanzari', 'Strada Imparat Traian nr. 14', 'Bucuresti', '755221', 'Romania', '0755332211'),
	(2, 'Parfumeria S.R.L.', 'Dragan Andreea', 'Responsabil vanzari', 'Strada Nucului nr. 214', 'Bucuresti', '744211', 'Romania', '0744562211'),
	(3, 'Make-up Shop S.R.L.', 'Vladut Andrada', 'Responsabil vanzari', 'Strada Florilor nr. 155', 'Bucuresti', '784554', 'Romania', '0789562314'),
	(4, 'Sephora Romania S.A.', 'Constantin Ioana-Loredana', 'Responsabil vanzari', 'Strada Primaverii nr. 21', 'Bucuresti', '721333', 'Romania', '0755443366'),
	(5, 'Douglas Romania S.A.', 'Vladimir Claudia', 'Responsabil vanzari', 'Strada Poetului nr. 111', 'Timisoara', '654885', 'Romania', '0744664466');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
