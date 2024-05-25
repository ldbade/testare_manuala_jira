-- An continuous updated databases in a hospital make the work much easier for all staff.

CREATE DATABASE HospitalDepartment;
/*A database is created, named HospitalDepartment which contains the information related to respiratory department,
 emplooyees, patients, patients' information, treatment, investigations and other relevant details.*/ 
USE HospitalDepartment;
CREATE TABLE RespDepartment (
DepID int NOT NULL AUTO_INCREMENT,
DepName varchar (20) NOT NULL,
PacFileID int NOT NULL,
EmpID int NOT NULL,
PRIMARY KEY (DepID)
);

ALTER TABLE RespDepartment MODIFY COLUMN PacFileID varchar (10) NOT NULL;
-- Mentioning the name of created database, I created a table which contains the information related to RESPIRATORY DEPARTMENT. 
-- Anoher column has added to create a relation one to many to Hospitalization table through a FOREGN KEY.
-- Using ALTER TABLE command and ADD PRIMARY KEY, RespDepartment table has a unique identifiction.
desc RespDepartment;
CREATE TABLE Employees (
EmpID int NOT NULL,
EmpLastName varchar (150) NOT NULL,
EmpFirstName varchar (150) NOT NULL,
EmpCNP varchar (13) NOT NULL,
Speciality varchar (50) NOT NULL,
DepID int NOT NULL,
Salary float NULL
);
ALTER TABLE Employees ADD PRIMARY KEY (EmpID);
desc Employees;
SELECT * FROM Employees;
/* Respiratory Department gathered all relevand information in a table created named Employee.
 Employee table is related to RespDepartment table through a one to many relationship Foreign key - RespDepartment.*/
ALTER TABLE RespDepartment ADD CONSTRAINT
FOREIGN KEY (EmpID) REFERENCES Employees(EmpID);



CREATE TABLE Hospitalization(
PacFileID varchar (10) NOT NULL,
PacHospID varchar (10) NOT NULL,
DepID int NOT NULL,
Room varchar (10) NOT NULL,
Diagnostic varchar (255) NOT NULL,
TreatID varchar (255) NOT NULL,
Dateofadmission Datetime NOT NULL,
Dateofdischarge Datetime NULL,
LabTestID varchar (10) NOT NULL,
FarmID varchar (10) NOT NULL,
PRIMARY KEY (PacFileID)
);

/* Every inpatient and/or outpatient must have a file containing double identification: PacHospID (Hospital Number) and PacFileID (file number) to avoid confusion.
To avoid redundancy, in the Hospitalization created table, there is all the information regarding patient hospital identification, 
department, room, main diseases, treatment, investigations and all days in hospital with details.*/
ALTER TABLE Hospitalization ADD CONSTRAINT FOREIGN KEY (DepID) REFERENCES  RespDepartment(DepID);
SELECT * FROM Hospitalization;

CREATE TABLE PatientData (
PacHospID varchar(10) NOT NULL,
PacFileID varchar (10) NOT NULL,
PacLastName varchar (255) NOT NULL,
PacFirstName varchar (255) NOT NULL,
CNP varchar (13) NOT NULL,
City varchar (100) NOT NULL,
Address varchar (100) NULL,
PacType varchar (100) NOT NULL,
PacPhone int NOT NULL,
FamilyNo int NOT NULL
);
ALTER TABLE PatientData ADD PRIMARY KEY (PacFileID);
ALTER TABLE Hospitalization ADD CONSTRAINT FOREIGN KEY Hospitalization(PacFileID)  REFERENCES PatientData(PacFileID);
-- CREATE TABLE PatientData contains patient' personal details and hospital identification numbers.


CREATE TABLE Treatment (
TreatID varchar(10) NOT NULL,
PacHospID varchar(10) NOT NULL,
MedName varchar(200),
MedcineDose varchar (20) NOT NULL,
MedicineTime varchar (20) NOT NULL,
MedicineWay varchar (25) NOT NULL
);
ALTER TABLE Treatment ADD PRIMARY KEY (TreatID);
ALTER TABLE Treatment CHANGE PacHospID PacFileID varchar (10) NOT NULL;
ALTER TABLE Treatment CHANGE MedcineDose MedicineDose varchar (20) NOT NULL;
-- Every patient will have a specific treatment; the Treatment table created the details of the treatment for each patient.
ALTER TABLE Hospitalization ADD CONSTRAINT FOREIGN KEY Hospitalization(TreatID)  REFERENCES Treatment(TreatID);
desc Treatment;

CREATE TABLE Farmacy (
FarmID varchar (10) NOT NULL,
PacFileID varchar (10) NOT NULL,
MedName1 varchar (100) NOT NULL,
MedName2 varchar (100) NULL,
MedName3 varchar (100) NULL,
MedName4 varchar (100) NULL, 
MedName5 varchar (100) NULL,
MedName6 varchar (100) NULL,
TreatID varchar(10) NOT NULL
);
ALTER TABLE Farmacy ADD PRIMARY KEY (FarmID);
-- Every file goes to the pharmacy of the hospital to get the medication prescribed.

CREATE TABLE Laboratory (
LabTestID varchar(10) NOT NULL,
PacFileID varchar(10) NOT NULL,
TestName varchar(255) NOT NULL,
TestDate date NOT NULL,
TestResults varchar(255) NULL
);
ALTER TABLE Laboratory ADD PRIMARY KEY (LabTestID);
-- The lab tests information is in Loboratory table
ALTER TABLE Hospitalization  ADD CONSTRAINT 
FOREIGN KEY (LabTestID) REFERENCES Laboratory(LabTestID);

CREATE TABLE InPatients (
OutPatientID int (1) NOT NULL AUTO_INCREMENT,
PacHospID varchar(4) NOT NULL,
PacLastName varchar (255) NOT NULL,
PacFirstName varchar (255) NOT NULL,
CNP varchar (13) NOT NULL,
City varchar (100) NOT NULL,
Address varchar (100) NULL,
PacType varchar (100) NOT NULL,
PacPhone int NOT NULL,
FamilyNo int NOT NULL,
PRIMARY KEY (OutPatientID)
);
-- OutPatientID is used as a primary key which auto_increments.
INSERT INTO OutPatients VALUES (358, 2451, 'Cristorean', 'Maria', '2500504124656', 'Cluj Napoca', 'Campului 72', 'respirator', '0745235562', '0755454545');
INSERT INTO OutPatients VALUES (359, 2452, 'Pop', 'Voicu', '1641212125124', 'Dej', 'Ciresilor 10', 'respirator', '0771343264', '0755455210');
INSERT INTO OutPatients VALUES (360, 2453, 'Brad',  'Adrian', '1790823120554', 'Cluj Napoca', 'Tineretului 19', 'respirator', '0757000241', '0745414545');

desc OutPatients;

-- the upper command renames the column name needed to be changed.
ALTER TABLE InPatients RENAME OutPatients;
ALTER TABLE OutPatients RENAME COLUMN InPatientID TO OutPatientID;
TRUNCATE TABLE OutPatients;
-- TRUNCATE removes the complete data from OutPatients table without removing its structure.
DROP TABLE OutPatients;
-- comanda DROP TABLE removes permanently OutPatients table;

desc Hospitalization;
DESC PatientData;
DESC Treatment;
SELECT * FROM  RespDepartment;

INSERT INTO RespDepartment VALUES (1, 'RESPIRATORY', 'RESP138', 21);
INSERT INTO RespDepartment VALUES (2, 'RESPIRATORY', 'RESP139', 22);
INSERT INTO RespDepartment VALUES (3, 'RESPIRATORY', 'RESP140', 23);
INSERT INTO RespDepartment VALUES (4, 'RESPIRATORY', 'RESP141', 24);
INSERT INTO RespDepartment VALUES (5, 'RESPIRATORY', 'RESP142', 25);
INSERT INTO RespDepartment VALUES (6, 'RESPIRATORY', 'RESP143', 26);
INSERT INTO RespDepartment VALUES (7, 'RESPIRATORY', 'RESP144', 27);
INSERT INTO RespDepartment VALUES (8, 'RESPIRATORY', 'RESP145', 28);
INSERT INTO RespDepartment VALUES (9, 'RESPIRATORY', 'RESP146', 29);
INSERT INTO RespDepartment VALUES (10, 'RESPIRATORY', 'RESP147', 30);

DESC Employees;
SELECT * FROM Employees;
INSERT INTO Employees VALUES (21, 'Popescu', 'Adrian', '1700218120754', 'doctor', 1, 20000);         
INSERT INTO Employees VALUES (22, 'Tomescu', 'Vasile', '1780615125740','doctor', 2, 1800);     
INSERT INTO Employees VALUES (23, 'Sabau', 'Mihaela', '2751002333120','doctor', 3, 18500);       
INSERT INTO Employees VALUES (24, 'Moldovan', 'Ana','2800305126345', 'asistenta', 4, 5000);       
INSERT INTO Employees VALUES (25, 'Felecan', 'Naomi', '2780910125320', 'asistenta', 5, 4350);        
INSERT INTO Employees VALUES (26, 'Cadis', 'Maria', '2770517120654', 'asistenta', 6, 4550);         
INSERT INTO Employees VALUES (27, 'Deac', 'Sefora', '2791205120636', 'infirmiera', 7, 2900);          
INSERT INTO Employees VALUES (28, 'Sandru', 'Delia', '2650505125455', 'infirmiera', 8, 2650);      
INSERT INTO Employees VALUES (29, 'Pop', 'Dumitru', '1720606125235', 'manager', 9, 24000);         
INSERT INTO Employees VALUES (30, 'Prodan', 'Vasile', '1701205120554', 'portar', 10, 2730);          
INSERT INTO Employees VALUES (31, 'Dumitrache', 'Camelia', '2791105120756', 'administrator', 11, 2655);     
INSERT INTO Employees VALUES (32, 'Tomescu', 'Simona', '2681113125442', 'contabil', 12, 2900);    

SELECT * FROM PatientData;
INSERT INTO PatientData VALUES ('SPR2100', 'RESP138', 'Criste', 'Maria', '2600504124656', 'Cluj Napoca', 'Sesului 72', 'respirator', '0745384562', '0755481545');
INSERT INTO PatientData VALUES ('SPR2101', 'RESP139', 'Pop', 'Vasile', '1641212125454', 'Huedin', 'Ciresilor 10', 'respirator', '0771353264', '0765455210');
INSERT INTO PatientData VALUES ('SPR2102', 'RESP140', 'Bob',  'Adrian', '1790813120554', 'Cluj Napoca', 'Tineretului 15', 'respirator', '0757000341', '0740414545');
INSERT INTO PatientData VALUES ('SPR2103', 'RESP141',  'Vlaicu', 'Emil', '1800506126255', 'Tg. Mures', 'Campului 103', 'respirator', '0764500205', '0741747811');
INSERT INTO PatientData VALUES ('SPR2104', 'RESP142', 'Moldovan', 'Gavril', '1450623125136', 'Gilau', 'Principala 25', 'respirator', '0745111205', '0264554165');
INSERT INTO PatientData VALUES ('SPR2105', 'RESP143', 'Deac', 'Simina', '2550219120464', 'Floresti', 'Iris 56', 'respirator', '0746890525', '074233120');
INSERT INTO PatientData VALUES ('SPR2106', 'RESP144', 'Fesnic', 'Margareta', '263036125964', 'Apahida', 'Morii 15', 'respirator', '0757234010', '0754541245');
INSERT INTO  PatientData VALUES ('SPR2107', 'REP145', 'Crisan', 'Vasile', '1800605120212', 'Dej', 'Castanilor 40', 'respirator', '0747959855', '0740555444');
INSERT INTO PatientData VALUES ('SPR2108', 'RESP146', 'Coste', 'Constantin', '1741212120699', 'Cluj Napoca', 'Donath 102', 'respirator', '0740444313', '0755412421');
INSERT INTO PatientData VALUES ('SPR2109', 'RESP147','Vlaicu', 'Emil', '1820603120699', 'Floresti', 'Crisului 21', 'respirator', '0747901502', '0754636210');



SELECT * FROM Hospitalization;
INSERT INTO Hospitalization VALUES ('RESP138', 'SPR2100', 1, '17A', 'Traheo-bronsita acuta', 'TR1', '2022-09-15 10:30:05', '2022-09-19 13:40:00', 'LAB301', 'RPR255');
INSERT INTO Hospitalization VALUES ('RESP139', 'SPR2101', 2, '17A', 'Pneumonie acuta', 'TR2', '2022-09-15 11:00:00', '2022-09-20 14:10:09', 'LAB302', 'RPR256');
INSERT INTO Hospitalization VALUES ('RESP140', 'SPR2102', 3, '17B', 'Angina acuta', 'TR3', '2022-09-15 20:05:05', '2022-09-20 11:10:05', 'LAB303', 'RPR257');
INSERT INTO Hospitalization VALUES ('RESP141', 'SPR2103', 4, '18A', 'Angina acuta', 'TR4', '2022-09-16 09:00:05', '2022-09-21 13:14:00', 'LAB304', 'RPR258');
INSERT INTO  Hospitalization VALUES ('RESP142', 'SPR2104', 5, '18B', 'Pneumonie bazala stg', 'TR5', '2022-09-16 10:25:00', '2022-09-22 14:50:00', 'LAB305','RPR259' );
INSERT INTO  Hospitalization VALUES ('RESP143', 'SPR2105', 6, '18B', 'Bronsita acuta', 'TR6', '2022-09-17 10:25:00', '2022-09-22 14:50:00', 'LAB306','RPR260' );
INSERT INTO Hospitalization  VALUES ('RESP144', 'SPR2106', 7, '19B', 'Pneumonie bazala dr', 'TR7', '2022-09-17 10:25:00', '2022-09-22 14:50:00', 'LAB307','RPR261' );
INSERT INTO Hospitalization VALUES ('RESP145', 'SPR2107', 8, '20A', 'Angina acuta', 'TR8', '2022-09-18 09:00:05', '2022-09-21 13:14:00', 'LAB308','RPR262');
INSERT INTO Hospitalization VALUES ('RESP146', 'SPR2108', 9, '20B', 'Pneumonie bazala dr', 'TR9', '2022-09-18 10:25:00', '2022-09-23 14:50:00', 'LAB309', 'RPR263');
INSERT INTO Hospitalization VALUES ('RESP147', 'SPR2109', 10, '20B', 'Pneumonie bazala stg', 'TR10', '2022-09-19 10:25:00', '2022-09-23 14:50:00', 'LAB310', 'RPR264');






SELECT * FROM Farmacy;
SELECT * FROM Treatment;
INSERT INTO Treatment VALUES ('TR1','RESP138' , 'Augmentin', '1,2g', '08:00, 20:00', 'intravenos');
INSERT INTO Treatment VALUES ('TR2', 'RESP139', 'Claritromicina', '500mg', '08:00, 20:00', 'perfuzabil');
INSERT INTO Treatment VALUES ('TR3', 'RESP140', 'Augmentin', '1,2g', '08:00, 20:00', 'intravenos');
INSERT INTO Treatment VALUES ('TR4','RESP141' , 'Augmentin', '1,2g', '08:00, 20:00', 'intravenos');
INSERT INTO Treatment VALUES ('TR5', 'RESP142', 'Claritromicina', '500mg', '08:00, 20:00', 'perfuzabil');
INSERT INTO Treatment VALUES ('TR6', 'RESP143', 'Cefuroxim', '750mg', '08:00, 20:00', 'perfuzabil');
INSERT INTO Treatment VALUES ('TR7', 'RESP144', 'Claritromicina', '500mg', '08:00, 20:00', 'perfuzabil');
INSERT INTO Treatment VALUES ('TR8', 'RESP145' , 'Augmentin', '1,2g', '08:00, 20:00', 'intravenos');
INSERT INTO Treatment VALUES ('TR9', 'RESP146', 'Claritromicina', '500mg', '08:00, 20:00', 'perfuzabil');
INSERT INTO Treatment VALUES ('TR10','RESP147' , 'Claritromicina', '500mg', '08:00, 20:00', 'perfuzabil');
SELECT * FROM Treatment ORDER BY PacFileID ASC;





SELECT * FROM Laboratory;
INSERT INTO Laboratory VALUES ('LAB301', 'RESP138', 'ASLO', '2022-09-15', NULL);
INSERT INTO Laboratory VALUES ('LAB302', 'RESP139', 'ExFaringian', '2022-09-15', NULL);
INSERT INTO Laboratory VALUES ('LAB303', 'RESP140' , 'CRP', '2022-09-16', NULL);
INSERT INTO Laboratory VALUES ('LAB304', 'RESP141', 'ExFaringian', '2022-09-16', NULL);
INSERT INTO Laboratory VALUES ('LAB305', 'RESP142', 'CRP', '2022-09-16', NULL);
INSERT INTO Laboratory VALUES ('LAB306', 'RESP143', 'ASLO', '2022-09-17', NULL);
INSERT INTO Laboratory VALUES ('LAB307', 'RESP144', 'ExFaringian', '2022-09-17', NULL);
INSERT INTO Laboratory VALUES ('LAB308', 'RESP145', 'ASLO', '2022-09-18', NULL);
INSERT INTO Laboratory VALUES ('LAB309', 'RESP146', 'Radiografie pulmonara', '2022-09-18', NULL);
INSERT INTO Laboratory VALUES ('LAB310', 'RESP147', 'Radiografie pulmonara', '2022-09-19', NULL);
SELECT * FROM Farmacy;
INSERT INTO Farmacy VALUES ('RPR255', 'RESP138', 'Augmentin', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR1');
INSERT INTO Farmacy VALUES ('RPR256', 'RESP139', 'Claritromicina', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR2');
INSERT INTO Farmacy VALUES ('RPR257', 'RESP140', 'Augmentin', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR3');
INSERT INTO Farmacy VALUES ('RPR258', 'RESP141', 'Augmentin', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR4');
INSERT INTO Farmacy VALUES ('RPR259', 'RESP142', 'Claritromicina', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR5');
INSERT INTO Farmacy VALUES ('RPR260', 'RESP143', 'Cefuroxim', 'Ser fiziologic', 'Paracetamol', 'Nurofen', NULL, NULL, 'TR6');
INSERT INTO Farmacy VALUES ('RPR261', 'RESP144', 'Claritromicina', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR7');
INSERT INTO Farmacy VALUES ('RPR262', 'RESP145', 'Augmentin', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR8');
INSERT INTO Farmacy VALUES ('RPR263', 'RESP146', 'Claritromicina', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR9');
INSERT INTO Farmacy VALUES ('RPR264', 'RESP147', 'Claritromicina', 'Ser fiziologic', 'Paracetamol', NULL, NULL, NULL, 'TR10');






-- VIEW ul creat returneaza pacientii care sunt tratati cu Augmentin
SELECT * FROM PatientData;
CREATE  VIEW TratamentAugmentin AS
SELECT PacFileID, MedName
FROM Treatment
WHERE MedName='Augmentin';
SELECT * FROM TratamentAugmentin;

-- Subinterogarea returneaza toti angajatii care au salar mai mare decat salarul angajatului Deac care este de 2900
SELECT * FROM Employees;
SELECT EmpLastName, EmpFirstName FROM Employees WHERE Salary>(
SELECT Salary FROM Employees WHERE EmpLastName='Deac');

-- Folosind în interogarea de mai jos INNER JOIN, a returnat rezultatul dorit– fiecare pacient ce diagnostic are și care este tratamentul de baza care i se administrează.
SELECT * FROM InPatients;
SELECT * FROM PatientFile;
SELECT * FROM Treatment;
SELECT PatientData.PacFileID, PatientData.PacLastName, PatientData.PacFirstName,
Hospitalization.Diagnostic, Treatment.MedName, Treatment.MedicineDose 
FROM PatientData
INNER JOIN Hospitalization ON PatientData.PacFileID=Hospitalization.PacFileID
INNER JOIN Treatment ON PatientData.PacFileID=Treatment.PacFileID;

-- CROSS JOIN returns all matches records from both tables wheather the other tables matches or not
SELECT * FROM PatientData
CROSS JOIN Laboratory ON PatientData.PacFileID=Laboratory.PacFileID;

-- Comenzile UNION ALL si ALIAS aplicate pe coloana CNP si EmpCNP a returnat toate inregistrarile, (pastrand si duplicatele daca acestea exista)
SELECT EmpCNP  AS CNP FROM Employees 
UNION ALL
SELECT CNP FROM PatientData
ORDER BY CNP;

-- Funcționalitatea EXISTS a returnat valoarea TRUE, pozitionarea operatorului se face dupa WHERE
SELECT * FROM Employees;
SELECT EmpLastName, EmpFirstName FROM Employees WHERE EXISTS (
SELECT Salary FROM Employees WHERE EmpLastName>'Sabau');

-- GROUP BY – în SELECT-ul de mai jos a calculat și a grupat valorile identice, afisându-le în ordine crescătoare:
SELECT * FROM PatientData;
SELECT COUNT (PacFileID), City FROM PatientData GROUP BY City ORDER BY COUNT (PacFileID) ASC; 

-- Functia COUNT a returnat numarul total al pacientilor internati
SELECT * FROM PatientData;
SELECT COUNT(PacFileID) FROM PatientData;

-- Functia MAX aplicată pe tabelul Employees returnează cea mai mare valoare a coloanei EmpID care este 32.
SELECT * FROM Employees;
SELECT MAX(EmpID) AS Maxim FROM Employees;

-- Funcția MIN returnează valoarea cea mai mica a coloanei EmpID din tabelul Employees care este 21
SELECT * FROM Employees;
SELECT MIN(EmpID) AS Minim FROM Employees;

-- Funcția AVG aplicată pe coloana Salary din tabelul Employees a returnat valoarea medie a valorilor din coloană, aceasta reprezentând media salarului.
SELECT AVG(Salary) AS Media FROM Employees;
SELECT * FROM Employees;

-- Funcții STRING: au lipit în primul select City cu Address, iar în al doiliea exemplu a folosit * pentru a delimita PacLastName de PacFirstName.
SELECT CONCAT(City, Address) AS FullAddress FROM PatientData;
SELECT CONCAT_WS('*', PacLastName, PacFirstName) AS FullName FROM PatientData;



-- Funcția LEFT () a extras 4 caractere din șir începând cu partea stângă.
SELECT LEFT ('Tomescu', 4) AS String;



-- Funcția ASCII a returnat valoarea ASCII a primului character din coloana PacLastName
SELECT ASCII (PacLastName) AS NumCodeOffFirstChar FROM PatientData; 


-- Captură Stored Procedure: folosind două variabile a returnat pacientii cu Angină acută internați în data de 15.09.2022. Aceasta informație/procedură stocată poate fi reutilizată ori de câte ori este nevoie.

CREATE PROCEDURE SelectAllHospitalizationWithConditions @Diagnostic nvarchar(50),
@Dateofadmission datetime
AS 
SELECT * FROM PatientFile WHERE Diagnostic=@Diagnostic AND Dateofadmission=@Dateofadmission

EXEC SelectAllPatientFileWithConditions @Diagnostic='Angina acuta',
                                        @Dateofadmission='2022-09-15 20:05:05:000';
SELECT * FROM Hospitlization;





