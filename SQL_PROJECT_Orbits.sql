 ---------------------------------  SATELLITES----------------------------------------------------



create database orbits;
use orbits;

-- 1. Countries Table
CREATE TABLE Countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    space_agency_name VARCHAR(100)
);

-- 2. Satellite Table
CREATE TABLE Satellites (
    satellite_id INT PRIMARY KEY AUTO_INCREMENT,
    satellite_name VARCHAR(100) NOT NULL,
    launch_year INT,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

-- 3. Debris Objects Table
CREATE TABLE Debris_Objects (
    debris_id INT PRIMARY KEY AUTO_INCREMENT,
    object_name VARCHAR(100) NOT NULL,
    size_meters DECIMAL(5, 2),
    mass_kg DECIMAL(8, 2),
    originating_satellite_id INT,
    FOREIGN KEY (originating_satellite_id) REFERENCES Satellites(satellite_id)
);

-- 4. Orbital Events & Collisions
CREATE TABLE Orbital_Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    debris_id INT,
    event_type VARCHAR(50), -- e.g., 'Collision', 'Close Approach'
    event_date DATE,
    risk_score INT, -- Scale 1 to 10
    FOREIGN KEY (debris_id) REFERENCES Debris_Objects(debris_id)
);

-- 1.Insert Countries
INSERT INTO Countries (country_name, space_agency_name) VALUES 
('India', 'ISRO'),
('Japan', 'JAXA'),
('Canada', 'CSA'),
('France', 'CNES'),
('Germany', 'DLR'),
('Italy', 'ASI'),
('United Kingdom', 'UKSA'),
('South Korea', 'KARI'),
('Brazil', 'AEB'),
('Ukraine', 'NSAU'),
('Australia', 'ASA'),
('Argentina', 'CONAE'),
('Israel', 'ISA'),
('Iran', 'ISA'),
('North Korea', 'NATA'),
('Pakistan', 'SUPARCO'),
('Turkey', 'TUA'),
('Mexico', 'AEM'),
('Netherlands', 'NSO'),
('Spain', 'INTA'),
('Sweden', 'SNSA'),
('Switzerland', 'SSO'),
('Austria', 'ALR'),
('Belgium', 'BELSPO'),
('Poland', 'POLSA'),
('Norway', 'NOSA'),
('Denmark', 'DTU Space'),
('Finland', 'BF'),
('Czech Republic', 'CSO'),
('Hungary', 'HSA'),
('Romania', 'ROSA'),
('Portugal', 'PT Space'),
('Greece', 'HSA'),
('South Africa', 'SANSA'),
('Nigeria', 'NASRDA'),
('Egypt', 'EgSA'),
('Algeria', 'ASAL'),
('Kenya', 'KSA'),
('Saudi Arabia', 'SSC'),
('United Arab Emirates', 'UAESA'),
('Indonesia', 'LAPAN'),
('Malaysia', 'MYSA'),
('Thailand', 'GISTDA'),
('Vietnam', 'VNSC'),
('Philippines', 'PhilSA'),
('New Zealand', 'NZSA'),
('Brazil', 'INPE'),
('Colombia', 'CDAE'),
('Chile', 'FIDA'),
('Venezuela', 'ABAE');

-- 2.insert Satellites

INSERT INTO Satellites (satellite_name, launch_year, country_id) VALUES
('Telstar 1', 1962, 1),
('TIROS 1', 1960, 1),
('Hubble Space Telescope', 1990, 1),
('Sputnik 1', 1957, 3),
('Sputnik 2', 1957, 3),
('Vostok 1', 1961, 3),
('Luna 2', 1959, 3),
('International Space Station', 1998, 4),
('Aryabhata', 1975, 5),
('Rohini', 1980, 5),
('Mangalyaan', 2013, 5),
('Chandrayaan 1', 2008, 5),
('Osumi', 1970, 6),
('Hayabusa', 2003, 6),
('Alouette 1', 1962, 7),
('Anik A1', 1972, 7),
('Asterix', 1965, 8),
('SPOT 1', 1986, 8),
('Azur', 1969, 9),
('TerraSAR-X', 2007, 9),
('San Marco 1', 1964, 10),
('LARES', 2012, 10),
('Ariel 1', 1962, 11),
('Skynet 1A', 1969, 11),
('Uribyeol 1', 1992, 12),
('Chollian', 2010, 12),
('SCD-1', 1993, 13),
('CBERS-1', 1999, 13),
('Sich-1', 1995, 14),
('Wresat', 1967, 15),
('FedSat', 2002, 15),
('SAC-B', 1996, 16),
('ARSAT-1', 2014, 16),
('Ofeq 1', 1988, 17),
('Amos 1', 1996, 17),
('Sina-1', 2005, 18),
('Omid', 2009, 18),
('Kwangmyongsong-1', 1998, 19),
('Kwangmyongsong-3 Unit 2', 2012, 19),
('Badr-1', 1990, 20),
('Paksat-1', 2002, 20),
('Türksat 1A', 1994, 21),
('Göktürk-2', 2012, 21),
('Satmex 5', 1998, 22),
('Azteca 1', 1985, 22),
('ANS', 1974, 23),
('NSS-6', 2002, 23),
('Hispasat 1A', 1992, 24),
('Deimos 1', 2009, 24),
('Shijian 1', 1971, 2);
 
 -- 3.Insert Debris Objects

INSERT INTO Debris_Objects (object_name, size_meters, mass_kg, originating_satellite_id) VALUES
-- Iridium 33 & Kosmos 2251 Collision Fragments
('Iridium 33 Debris B', 0.22, 18.40, 2),
('Iridium 33 Debris C', 0.05, 1.20, 2),
('Iridium 33 Debris D', 0.45, 35.10, 2),
('Iridium 33 Debris E', 0.11, 4.80, 2),
('Kosmos 2251 Fragment C', 1.10, 160.00, 3),
('Kosmos 2251 Fragment D', 0.32, 22.50, 3),
('Kosmos 2251 Fragment E', 0.08, 2.10, 3),
('Kosmos 2251 Fragment F', 0.60, 75.00, 3),

-- Fengyun 1C ASAT Test Fragments
('Fengyun 1C Fragment A', 0.18, 9.30, 4),
('Fengyun 1C Fragment B', 0.04, 0.65, 4),
('Fengyun 1C Fragment C', 0.55, 48.00, 4),
('Fengyun 1C Fragment D', 1.30, 210.00, 4),
('Fengyun 1C Fragment E', 0.02, 0.12, 4),
('Fengyun 1C Fragment F', 0.88, 92.40, 4),

-- Envisat Mission & Structural Debris
('Envisat Solar Panel Flake', 0.07, 0.40, 5),
('Envisat Bracket B', 0.14, 2.80, 5),
('Envisat Insulation Foil', 1.20, 0.35, 5),
('Envisat Antenna Clamp', 0.09, 1.15, 5),
('Envisat Wire Harness', 0.35, 0.90, 5),

-- Vanguard Rocket Body Fragments
('Vanguard R/B Paint Chip', 0.01, 0.01, 1),
('Vanguard R/B Bolt Delta', 0.03, 0.18, 1),
('Vanguard R/B Tank Shard', 0.70, 64.00, 1),
('Vanguard R/B Fairing Piece', 1.90, 185.00, 1),

-- General Inactive Satellites & Mission-Related Objects (IDs 1-5)
('Delta 2 R/B Shrapnel Alpha', 0.40, 28.00, 1),
('Delta 2 R/B Shrapnel Beta', 0.15, 6.20, 1),
('Titan 3C R/B Fragment', 1.05, 140.00, 1),
('Zenit-2 SB Upper Stage Shard', 2.50, 520.00, 1),
('SL-8 R/B Exploded Component', 0.65, 55.00, 1),
('SL-16 R/B Ullage Motor', 0.80, 85.00, 1),
('Ariane 4 Upper Stage Adapter', 2.20, 310.00, 1),

('Globalstar M002 Antenna Cover', 0.30, 4.50, 2),
('Orbcomm FM4 Structural Fragment', 0.12, 2.30, 2),
('Strela-3 Battery Casing', 0.50, 42.00, 2),
('Cosmos 2421 Panel Segment', 0.95, 78.00, 2),

('NOAA 16 Exploded Battery Wall', 0.75, 61.50, 3),
('DMSP F13 Solar Array Boom', 1.60, 115.00, 3),
('Meteor 2-21 Frame Splinter', 0.28, 7.10, 3),
('Cosmos 1484 Fragment', 0.42, 19.00, 3),

('TES Satellite Thermal Cover', 1.15, 8.40, 4),
('Cartosat 2A Camera Lens Hood', 0.38, 11.20, 4),
('IRS-1C Fuel Line Coupling', 0.06, 1.05, 4),
('Oceansat 1 Solar Array Clip', 0.04, 0.25, 4),

('Spot 4 Launcher Ring Segment', 1.75, 230.00, 5),
('ERS-2 Radar Panel Flake', 0.18, 3.40, 5),
('Adeos II Blanket Fragment', 1.40, 0.95, 5),
('Jason-1 Altimeter Bracket', 0.13, 2.10, 5),

-- Additional Micro and Macro Debris Mix
('Unknown Payload Adapter Rib', 0.85, 44.00, 1),
('Micrometeoroid Shield Piece', 0.26, 5.30, 3),
('Coolant Droplet Cluster (Solid)', 0.03, 0.08, 4),
('Optical Sensor Cover Shield', 0.52, 14.70, 5);

-- 4. -- Insert Orbital Events

INSERT INTO Orbital_Events (debris_id, event_type, event_date, risk_score) VALUES
-- High-Risk Collisions & Fragmentations
(5, 'Collision', '2026-06-28', 10),
(12, 'Fragmentation', '2026-06-18', 9),
(24, 'Fragmentation', '2026-06-22', 9),
(37, 'Collision', '2026-06-14', 10),

-- Critical Close Approaches (Risk 7-8)
(6, 'Close Approach', '2026-06-02', 8),
(9, 'Close Approach', '2026-06-05', 7),
(15, 'Close Approach', '2026-06-11', 8),
(18, 'Close Approach', '2026-06-16', 7),
(21, 'Close Approach', '2026-06-20', 8),
(27, 'Close Approach', '2026-06-24', 8),
(30, 'Close Approach', '2026-06-26', 7),
(33, 'Close Approach', '2026-06-29', 8),
(42, 'Close Approach', '2026-06-13', 7),
(45, 'Close Approach', '2026-06-19', 8),
(48, 'Close Approach', '2026-06-23', 7),

-- Debris Shedding & Degradation Events
(7, 'Debris Shedding', '2026-06-03', 4),
(10, 'Debris Shedding', '2026-06-06', 3),
(13, 'Debris Shedding', '2026-06-08', 5),
(16, 'Debris Shedding', '2026-06-12', 4),
(19, 'Debris Shedding', '2026-06-17', 3),
(22, 'Debris Shedding', '2026-06-21', 5),
(25, 'Debris Shedding', '2026-06-25', 4),
(28, 'Debris Shedding', '2026-06-27', 3),
(31, 'Debris Shedding', '2026-06-28', 4),
(34, 'Debris Shedding', '2026-06-29', 5),

-- Atmospheric Re-entry Events
(8, 'Atmospheric Re-entry', '2026-06-04', 1),
(11, 'Atmospheric Re-entry', '2026-06-07', 1),
(14, 'Atmospheric Re-entry', '2026-06-10', 1),
(17, 'Atmospheric Re-entry', '2026-06-15', 1),
(20, 'Atmospheric Re-entry', '2026-06-19', 1),
(23, 'Atmospheric Re-entry', '2026-06-22', 1),
(26, 'Atmospheric Re-entry', '2026-06-26', 1),

-- Standard Tracked Maneuvers / Close Approaches (Risk 4-6)
(29, 'Close Approach', '2026-06-01', 5),
(32, 'Close Approach', '2026-06-03', 6),
(35, 'Close Approach', '2026-06-05', 4),
(36, 'Close Approach', '2026-06-09', 5),
(38, 'Close Approach', '2026-06-12', 6),
(39, 'Close Approach', '2026-06-14', 4),
(40, 'Close Approach', '2026-06-17', 5),
(41, 'Close Approach', '2026-06-20', 6),
(43, 'Close Approach', '2026-06-22', 4),
(44, 'Close Approach', '2026-06-24', 5),
(46, 'Close Approach', '2026-06-25', 6),
(47, 'Close Approach', '2026-06-26', 4),
(49, 'Close Approach', '2026-06-27', 5),
(50, 'Close Approach', '2026-06-28', 6),
(1, 'Close Approach', '2026-06-29', 4),
(2, 'Close Approach', '2026-06-29', 5),
(3, 'Debris Shedding', '2026-06-29', 3),
(4, 'Close Approach', '2026-06-29', 6);

-- DATA QUERY LANGUAGE

-- SELECT QUERIES FOR TABLE

SELECT * FROM Countries;

SELECT * FROM Satellites;

SELECT * FROM Debris_Objects;

SELECT * FROM Orbital_Events;

 -- Select all large debris objects weighing over 100 kilograms
SELECT object_name, size_meters, mass_kg 
FROM Debris_Objects 
WHERE mass_kg > 100.00 
ORDER BY mass_kg DESC;

-- DATA DEFINITION LANGUAGE
-- TABLE CREATED
-- ALTER: Add an operational status column to the Satellites table
ALTER TABLE Satellites 
ADD COLUMN operational_status VARCHAR(20) DEFAULT 'Inactive';

-- CHECK IF COLUMN IS ADDED

SELECT * FROM Satellites;

-- ALTER: Add a constraint to ensure risk scores stay within the 1-10 range
ALTER TABLE Orbital_Events 
ADD CONSTRAINT chk_risk_score CHECK (risk_score BETWEEN 1 AND 10);

-- CHECK CONSTRAINT

INSERT INTO Orbital_Events (debris_id, event_type, event_date, risk_score) 
VALUES (1, 'Collision', '2026-07-02', 12);

--  INDEX

CREATE INDEX idx_debris_physics ON Debris_Objects (size_meters, mass_kg);

SHOW INDEX FROM Debris_Objects;

-- VERIFY INDEX USAGE
EXPLAIN SELECT object_name, size_meters, mass_kg 
FROM Debris_Objects 
WHERE size_meters > 0.50 AND mass_kg > 50.00;

CREATE TABLE Tracking_Stations (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100) NOT NULL,
    location_country VARCHAR(100),
    radar_frequency_ghz DECIMAL(4,2)
); 

INSERT INTO Tracking_Stations (station_name, location_country, radar_frequency_ghz) VALUES 
('Diego Garcia Tracking Station', 'British Indian Ocean Territory', 5.50),
('Eglin Radar Complex', 'United States', 0.44),
('Globus III', 'Norway', 10.00);

SELECT * FROM Tracking_Stations;

-- TRUNCATE TABLE
TRUNCATE TABLE Tracking_Stations;
-- CHECK
SELECT * FROM Tracking_Stations;

-- DROP TABLE

DROP TABLE Tracking_Stations;

-- CHECK

SELECT * FROM Tracking_Stations;


-- DATA MANIPULATION LANGUAGE

-- INSERT
INSERT INTO Orbital_Events (debris_id, event_type, event_date, risk_score) 
VALUES (1, 'Risk', '2026-08-02', 3);

SELECT * FROM ORBITAL_EVENTS;
-- UPDATE 
UPDATE Orbital_Events SET risk_score = 9 WHERE event_id = 3;
-- CHECK UPDATION
SELECT * FROM ORBITAL_EVENTS;

-- DELETE

DELETE FROM Orbital_Events 
WHERE event_type = 'Fragmentation';
 -- CHECK FOR DELETION
 SELECT * FROM Orbital_Events;
 
 -- DATA CONTROL LANGUAGE
 
 -- GRANT
 
 -- Allow read and write permissions to a User
create  user 'user_viewer'@'localhost' identified by 'root';
GRANT SELECT, INSERT ON orbits.Orbital_Events TO 'user_viewer'@'localhost';

GRANT ALL PRIVILEGES ON orbits.Debris_Objects TO 'user_viewer'@'localhost';

-- REVOKE

REVOKE ALL PRIVILEGES ON orbits.Debris_Objects FROM 'user_viewer'@'localhost';

REVOKE ALL PRIVILEGES ON orbits.Orbital_Events FROM 'user_viewer'@'localhost';


CREATE TABLE Tracking_Stations (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100) NOT NULL,
    location_country VARCHAR(100),
    radar_frequency_ghz DECIMAL(4, 2)
);


-- TCL

START TRANSACTION;

-- Step 1: Add a brand new tracked satellite
INSERT INTO Satellites (satellite_name, launch_year, country_id) 
VALUES ('Starlink-9999', 2026, 1);

-- Step 2: Extract the generated ID and log its first broken debris fragment
INSERT INTO Debris_Objects (object_name, size_meters, mass_kg, originating_satellite_id) 
VALUES ('Starlink-9999 Debris A', 0.25, 14.20, LAST_INSERT_ID());

-- Step 3: Immediately log a critical approach event for this new fragment
INSERT INTO Orbital_Events (debris_id, event_type, event_date, risk_score) 
VALUES (LAST_INSERT_ID(), 'Close Approach', '2026-07-02', 7);

-- Finalize: Write all 3 interconnected entries to the database permanently
COMMIT;    -- CHECK
SELECT * FROM Satellites;
SELECT * FROM Debris_objects;
SELECT * FROM Orbital_events;

-- ROLLBACK

START TRANSACTION;

-- Step 1: This executes successfully in temporary memory
INSERT INTO Satellites (satellite_name, launch_year, country_id) 
VALUES ('Experiment', 2026, 2);


ROLLBACK;
select * from Satellites;

-- SAVEPOINT & ROLLBACK

-- Open the transaction boundary
START TRANSACTION;

-- Step 1: Add critical baseline data
INSERT INTO Tracking_Stations (station_name, location_country, radar_frequency_ghz) 
VALUES ('Kwajalein Atoll Radar1', 'Marshall Islands', 5.80);

-- Checkpoint: Set your first save marker
SAVEPOINT primary_station_saved;

-- Step 2: Attempt to insert a temporary experimental tracking asset
INSERT INTO Tracking_Stations (station_name, location_country, radar_frequency_ghz) 
VALUES ('Experimental Mobile Rig', 'International Waters', 14.50);

-- Decision: You realize the mobile rig asset data is corrupted or unverified.
-- Erases ONLY Step 2 while preserving your Step 1 radar entry.
ROLLBACK TO primary_station_saved;

-- Finalize: Permanently save Kwajalein Atoll to the database
COMMIT;

SELECT * FROM Tracking_Stations;

-- DISTINCT AND WHERE WITH ALIAS

SELECT DISTINCT event_type AS Unique_High_Risk_Event_Types
FROM Orbital_Events
WHERE risk_score >= 7 
  AND event_type NOT LIKE '%Test%' -- NO TEST EVENT
  AND event_type IS NOT NULL;  -- SHOULD HAVE OCCURED

-- Group By, Having, and All Aggregate Functions

-- GROUPBY
SELECT originating_satellite_id, COUNT(debris_id), SUM(mass_kg)
FROM Debris_Objects
GROUP BY originating_satellite_id;
-- FUNCTIONS WITH HAVING,GROUP BY
SELECT 
    originating_satellite_id,
    COUNT(debris_id) AS Total_Debris_Count,
    SUM(mass_kg) AS Total_Mass_KG,
    AVG(size_meters) AS Average_Size_Meters,
    MIN(size_meters) AS Smallest_Piece,
    MAX(mass_kg) AS Heaviest_Piece
FROM Debris_Objects
WHERE originating_satellite_id IS NOT NULL
GROUP BY originating_satellite_id
HAVING COUNT(debris_id) > 1 
   AND SUM(mass_kg) BETWEEN 10.00 AND 5000.00; -- CONDITION MUST BE SATISFIED

-- UPPER
SELECT 
    country_name, 
    UPPER(space_agency_name) AS Space_Agency_Name
FROM Countries;

-- LOWER
SELECT 
    satellite_id, 
    LOWER(satellite_name) AS Lowercase_Satellite_Name
FROM Satellites;

-- LENGTH
SELECT 
    object_name, 
    LENGTH(object_name) AS Name_Character_Count
FROM Debris_Objects;

-- ROUND
SELECT 
    object_name, 
    ROUND(size_meters, 1) AS Rounded_Size_Meters -- ROUNDED TO 1 FIGURE AFTER POINT
FROM Debris_Objects;

-- NOW
SELECT 
    event_id, 
    event_date, 
    NOW() AS Execution_Time,
    DATEDIFF(NOW(), event_date) AS Days_Since_Event -- DIFFERENCE BETWEEN START AND EXECUTION OF AN EVENT
FROM Orbital_Events;

-- LIMIT
SELECT event_id, event_type, risk_score
FROM Orbital_Events
ORDER BY risk_score DESC
LIMIT 3;

-- Arithmetic Operators (+, -, *, /, %)
SELECT 
    object_name,
    mass_kg,
    -- Add (+): Estimate new mass if a 50kg piece collides with it
    (mass_kg + 50) AS Estimated_Post_Collision_Mass,
    
    -- Subtract (-): Find the difference between a 1000kg baseline and current mass
    (1000 - mass_kg) AS Variance_From_Baseline,
    
    -- Multiply (*): Convert mass from Kilograms to Grams
    (mass_kg * 1000) AS Mass_In_Grams,
    
    -- Divide (/): Convert size from meters to centimeters
    (size_meters / 0.01) AS Size_In_Centimeters,
    
    -- Modulo (%): Find the remainder (useful for alternating row logic or parsing)
    (debris_id % 2) AS Is_Even_ID
FROM Debris_Objects
WHERE mass_kg IS NOT NULL;

-- Comparison Operators (=, !=, <, >, <=, >=)
SELECT event_id, event_type, risk_score 
FROM Orbital_Events
WHERE event_type != 'Test'       -- Not Equal
  AND risk_score > 5             -- Greater Than
  AND risk_score <= 9            -- Less Than or Equal
  AND event_date >= '2025-01-01';-- Greater Than or Equal (Dates)

-- Logical Operators (AND, OR, NOT)

SELECT satellite_id, satellite_name, launch_year
FROM Satellites
WHERE (launch_year > 2010 AND launch_year < 2020) -- Both must be true
   OR NOT (country_id = 5);                        -- Reverses the condition and outputs records from 2011 to 2019 with all records execpt country with id 5
   
   -- Special Operators (BETWEEN, IN, LIKE, IS NULL)
   SELECT debris_id, object_name, mass_kg
FROM Debris_Objects
WHERE 
    -- BETWEEN: Matches values within an inclusive range
    mass_kg BETWEEN 25.00 AND 500.00 
    
    -- IN: Matches any value inside a specified list
    AND originating_satellite_id IN (1,2, 3, 5)
    
    -- LIKE: String pattern matching (% means any characters, _ means one character)
    AND object_name LIKE 'I%'
    
    -- IS NOT NULL / IS NULL: Checks for empty or missing values safely
    AND size_meters IS NOT NULL;
	
    -- JOIN
    
-- 1. Launch Vehicles Table
CREATE TABLE Launch_Vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100),
    success_rate DECIMAL(5, 2)
);

-- 2. Launch Metadata Details
CREATE TABLE Launch_Details (
    launch_id INT PRIMARY KEY AUTO_INCREMENT,
    satellite_id INT UNIQUE,
    vehicle_id INT,
    launch_date DATE,
    launch_site VARCHAR(100),
    FOREIGN KEY (vehicle_id) REFERENCES Launch_Vehicles(vehicle_id)
);

-- 3. Orbital Altitude Zones
CREATE TABLE Orbital_Regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_code VARCHAR(10) UNIQUE,
    min_altitude_km INT,
    max_altitude_km INT
);

-- 4. Debris Orbit Tracking Status
CREATE TABLE Debris_Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    debris_id INT UNIQUE,
    region_id INT,
    inclination DECIMAL(5,2),
    apogee_km INT,
    perigee_km INT,
    FOREIGN KEY (region_id) REFERENCES Orbital_Regions(region_id)
);

-- 5. Earth Observation & Ground Tracking Stations
CREATE TABLE Tracking_Stationn (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100) NOT NULL,
    country_id INT,
    radar_type VARCHAR(50)
);

-- 6. Space Debris Removal Operators
CREATE TABLE Mitigation_Operators (
    operator_id INT PRIMARY KEY AUTO_INCREMENT,
    operator_name VARCHAR(100) NOT NULL,
    country_id INT,
    budget_millions DECIMAL(10,2)
);

-- 7. Active Space Cleanup Missions
CREATE TABLE Cleanup_Missions (
    mission_id INT PRIMARY KEY AUTO_INCREMENT,
    mission_name VARCHAR(100) NOT NULL,
    operator_id INT,
    target_debris_id INT,
    mission_status VARCHAR(50),
    launch_year INT,
    FOREIGN KEY (operator_id) REFERENCES Mitigation_Operators(operator_id)
);


INSERT INTO Launch_Vehicles (vehicle_id, vehicle_name, manufacturer, success_rate) VALUES
(1, 'Falcon 9', 'SpaceX', 99.20), (2, 'H3 Rocket', 'MHI', 85.00), (3, 'GSLV Mk III', 'ISRO', 95.00),
(4, 'Ariane 6', 'ArianeGroup', 90.00), (5, 'Electron', 'Rocket Lab', 92.00), (6, 'Atlas V', 'ULA', 98.50),
(7, 'Vega C', 'Avio', 80.00), (8, 'Delta IV Heavy', 'ULA', 96.00), (9, 'Long March 5', 'CASC', 94.00),
(10, 'PSLV', 'ISRO', 97.00), (11, 'Falcon Heavy', 'SpaceX', 98.00), (12, 'Starship', 'SpaceX', 65.00),
(13, 'Soyuz-2', 'Roscosmos', 95.50), (14, 'New Glenn', 'Blue Origin', 70.00), (15, 'Vulcan Centaur', 'ULA', 91.00),
(16, 'Long March 7', 'CASC', 96.20), (17, 'Antares', 'Northrop Grumman', 93.00), (18, 'Epsilon', 'JAXA', 88.00),
(19, 'KSLV-II Nuri', 'KARI', 85.00), (20, 'Terran 1', 'Relativity Space', 50.00);

INSERT INTO Launch_Details (launch_id, satellite_id, vehicle_id, launch_date, launch_site) VALUES
(1, 1, 1, '2021-05-15', 'CCAFS LC-40'), (2, 2, 2, '2019-02-12', 'Tanegashima'), (3, 3, 3, '2019-11-27', 'Sriharikota'),
(4, 4, 4, '2022-07-01', 'Kourou ELA-4'), (5, 5, 6, '2000-12-18', 'Vandenberg SLC-3E'), (6, 6, 4, '2015-06-10', 'Kourou ELA-3'),
(7, 7, 8, '2005-09-08', 'Cape Canaveral'), (8, 8, 4, '2018-03-22', 'Kourou ELA-3'), (9, 9, 5, '2023-01-11', 'Mahia NZ'),
(10, 10, 10, '2013-08-22', 'Yasny Russia'), (11, 11, 11, '2022-11-01', 'KSC Pad 39A'), (12, 12, 12, '2024-03-14', 'Boca Chica'),
(13, 13, 13, '2021-12-25', 'Baikonur'), (14, 14, 1, '2023-06-18', 'Vandenberg SLC-4E'), (15, 15, 15, '2024-01-08', 'CCSFS SLC-41'),
(16, 16, 5, '2022-05-03', 'Mahia NZ'), (17, 17, 1, '2020-10-18', 'KSC Pad 39A'), (18, 18, 10, '2021-02-28', 'Sriharikota'),
(19, 19, 9, '2020-07-23', 'Wenchang'), (20, 20, 16, '2023-05-10', 'Wenchang');

INSERT INTO Orbital_Regions (region_id, region_code, min_altitude_km, max_altitude_km) VALUES
(1, 'LEO', 160, 2000), (2, 'MEO', 2000, 35786), (3, 'GEO', 35786, 35800), (4, 'HEO', 40000, 100000),
(5, 'VLEO', 100, 300), (6, 'SSO', 500, 1000), (7, 'MOL', 500, 40000), (8, 'GTO', 250, 35786),
(9, 'Tundra', 24000, 47000), (10, 'Cislunar', 100000, 400000), (11, 'Graveyard', 36100, 36500), (12, 'Polar', 600, 1000),
(13, 'EquatorL', 200, 800), (14, 'SubOrb', 50, 150), (15, 'LunarOrb', 380000, 390000), (16, 'L1-Point', 1400000, 1600000),
(17, 'L2-Point', 1400000, 1600000), (18, 'Lagrange5', 1450000, 1550000), (19, 'Interplan', 500000, 9999999), (20, 'DeepSpace', 9999999, 99999999);

INSERT INTO Debris_Locations (location_id, debris_id, region_id, inclination, apogee_km, perigee_km) VALUES
(1, 1, 1, 53.00, 552, 548), (2, 2, 1, 98.20, 710, 695), (3, 3, 6, 97.90, 505, 498),
(4, 4, 6, 98.50, 815, 801), (5, 5, 1, 98.20, 705, 700), (6, 6, 3, 0.05, 35790, 35778),
(7, 7, 3, 0.10, 35795, 35760), (8, 8, 3, 4.50, 35810, 35750), (9, 9, 1, 45.00, 410, 395),
(10, 10, 1, 98.10, 560, 545), (11, 11, 2, 55.00, 20200, 20100), (12, 12, 11, 1.20, 36250, 36180),
(13, 13, 6, 97.40, 610, 590), (14, 14, 1, 51.60, 420, 415), (15, 15, 12, 89.50, 850, 830),
(16, 16, 2, 56.00, 19100, 19050), (17, 17, 3, 0.02, 35788, 35782), (18, 18, 1, 42.00, 530, 520),
(19, 19, 8, 23.40, 35750, 280), (20, 20, 1, 98.80, 700, 680);

INSERT INTO Tracking_Stationn (station_id, station_name, country_id, radar_type) VALUES
(1, 'Maui Space Surveillance', 1, 'Optical/Radar'), (2, 'Okinawa Tracking', 2, 'Phased Array'), (3, 'Sriharikota Radar Complex', 3, 'Phased Array'),
(4, 'Kourou Tracking Station', 4, 'Telemetry Radar'), (5, 'Weilheim Station', 5, 'Deep Space Antennas'), (6, 'Goonhilly Earth Station', 6, 'Parabolic Dishes'),
(7, 'Inuvik Satellite Station', 7, 'X-band Receiver'), (8, 'Jeju Tracking Post', 8, 'Optical Tracker'), (9, 'Canberra Deep Space', 9, 'Deep Space Network'),
(10, 'Matera Laser Ranging', 10, 'Laser Tracker'), (11, 'Haystack Observatory', 1, 'X-Band Radar'), (12, 'Diego Garcia Station', 1, 'Optical Radar'),
(13, 'Kwajalein Atoll Radar', 1, 'Millimeter-Wave'), (14, 'Tanegashima Tracking', 2, 'Telemetry Unit'), (15, 'Thule Tracking Complex', 1, 'Early Warning Radar'),
(16, 'New Norcia Station', 9, 'Deep Space Antenna'), (17, 'Malindi Space Centre', 10, 'S-Band Antenna'), (18, 'Fucino Space Centre', 10, 'Telemetry Network'),
(19, 'Svalbard Satellite', 4, 'Multi-Mission Polar'), (20, 'Hartebeesthoek Ground', 6, 'Deep Space Receiver');

INSERT INTO Mitigation_Operators (operator_id, operator_name, country_id, budget_millions) VALUES
(1, 'OrbitGuard USA', 1, 45.50), (2, 'AstroScale Japan', 2, 85.00), (3, 'Digantara India', 3, 12.00),
(4, 'ClearSpace France', 4, 60.50), (5, 'DebrisBerlin', 5, 18.00), (6, 'RemoveDebris UK', 6, 22.40),
(7, 'NorthStar Canada', 7, 35.00), (8, 'Seoul Orbit Clean', 8, 15.00), (9, 'AussieSpace Eco', 9, 8.50),
(10, 'SafeOrbit Italy', 10, 14.20), (11, 'SpaceTrash Corp', 1, 110.00), (12, 'Kika Space Sweep', 2, 24.50),
(13, 'Zenith Debris Labs', 3, 9.80), (14, 'Ecosat Europe', 4, 40.00), (15, 'Munich Clean Sky', 5, 31.00),
(16, 'London Orbital Aid', 6, 17.50), (17, 'Polar Vacuum Inc', 7, 19.00), (18, 'Pacific Sweepers', 9, 5.20),
(19, 'Roma Astro-Sweepers', 10, 21.00), (20, 'Texas Sweepforce', 1, 75.00);

INSERT INTO Cleanup_Missions (mission_id, mission_name, operator_id, target_debris_id, mission_status, launch_year) VALUES
(1, 'Mission Clean-1', 2, 2, 'In-Flight', 2025), (2, 'Project Sweeper', 1, 1, 'Planned', 2027), (3, 'IndoDebris Null', 3, 3, 'Planned', 2028),
(4, 'ClearSpace-1', 4, 4, 'In-Flight', 2026), (5, 'EcoOrbit Drop', 5, 5, 'Planned', 2027), (6, 'UK Net-Catch', 6, 8, 'Success', 2024),
(7, 'TrueNorth Track', 7, 6, 'Planned', 2028), (8, 'K-Clean Sweep', 8, 10, 'Failed', 2025), (9, 'Southern Cross', 9, 9, 'Planned', 2029),
(10, 'Med-Debris Terminate', 10, 7, 'Planned', 2027), (11, 'Garbage Collector Max', 11, 11, 'In-Flight', 2025), (12, 'Tokyo Harpoon', 12, 12, 'Planned', 2026),
(13, 'Bengaluru Broom', 13, 13, 'Success', 2023), (14, 'EuroTether Pro', 14, 14, 'In-Flight', 2026), (15, 'Bavarian Magnet', 15, 15, 'Planned', 2027),
(16, 'Thames Anchor', 16, 16, 'Planned', 2028), (17, 'Aurora Shield', 17, 17, 'Success', 2024), (18, 'Sidney Net Alpha', 18, 18, 'Failed', 2024),
(19, 'Vatican Clean Sphere', 19, 19, 'Planned', 2026), (20, 'Austin Lasso-1', 20, 20, 'In-Flight', 2026);

-- INNER JOIN
SELECT   -- shows matching records with respect to same id
    ld.launch_id, 
    lv.vehicle_name, 
    ld.launch_date, 
    ld.launch_site
FROM Launch_Details ld
INNER JOIN Launch_Vehicles lv ON ld.vehicle_id = lv.vehicle_id;
 
 -- LEFT JOIN
 
 SELECT  -- all records from mitigation operators on no mission -- the mission field will display null
    mo.operator_name, 
    mo.budget_millions, 
    cm.mission_name, 
    cm.mission_status
FROM Mitigation_Operators mo
LEFT JOIN Cleanup_Missions cm ON mo.operator_id = cm.operator_id;

-- RIGHT JOIN

SELECT  -- all records from Orbital_Regions on no mission  -- the mission field will display null
    dl.debris_id, 
    dl.apogee_km, 
    or_reg.region_code
FROM Debris_Locations dl
RIGHT JOIN Orbital_Regions or_reg ON dl.region_id = or_reg.region_id;

-- FULL OUTER JOIN

SELECT ts.station_name, ts.radar_type, mo.operator_name
FROM Tracking_Stationn ts
LEFT JOIN Mitigation_Operators mo ON ts.country_id = mo.country_id -- Returns all records from Tracking_Stationn, and matching records from Mitigation_Operators.

UNION -- Combines both results and removes duplicate rows.

SELECT ts.station_name, ts.radar_type, mo.operator_name -- Returns all records from Mitigation_Operators, and matching records from Tracking_Stationn.
FROM Tracking_Stationn ts
RIGHT JOIN Mitigation_Operators mo ON ts.country_id = mo.country_id;

-- SELF JOIN

SELECT -- It joins the table Tracking_Stationn to itself (aliased as ts1 and ts2) using the country_id column. 
    ts1.station_name AS primary_radar,
    ts2.station_name AS backup_radar,
    ts1.country_id
FROM Tracking_Stationn ts1
INNER JOIN Tracking_Stationn ts2 ON ts1.country_id = ts2.country_id
WHERE ts1.station_id < ts2.station_id;

-- UNION (Combines and Removes Duplicates)
SELECT satellite_name AS asset_or_object_name, 'Active Satellite' AS object_type
FROM Satellites

UNION

SELECT object_name AS asset_or_object_name, 'Debris Piece' AS object_type
FROM Debris_Objects
ORDER BY asset_or_object_name ASC;

-- UNION ALL (Combines and Keeps Duplicates)
SELECT country_id, 'Assigned to Active Satellite' AS tracking_context
FROM Satellites

UNION ALL

SELECT s.country_id, 'Associated with Debris Source' AS tracking_context
FROM Debris_Objects do
INNER JOIN Satellites s ON do.originating_satellite_id = s.satellite_id;

-- INTERSECT (Finds Common Rows)
--  finds the distinct IDs of satellites that have both shed trackable debris objects and been involved in a high-risk orbital event.
-- Satellites that have produced debris
SELECT originating_satellite_id FROM Debris_Objects

INTERSECT

-- Satellites whose debris has been involved in a recorded event
SELECT do.originating_satellite_id 
FROM Orbital_Events oe
INNER JOIN Debris_Objects do ON oe.debris_id = do.debris_id;


-- VIEWS -- a virtual table -- fetches real time data dynamically from underlying table

-- CREATE VIEW
CREATE VIEW High_Risk_Debris_Dashboard AS
SELECT --  combines space debris tracking data.
    oe.event_id,
    oe.event_type,
    oe.risk_score,
    do.object_name,
    do.size_meters
FROM Orbital_Events oe
INNER JOIN Debris_Objects do ON oe.debris_id = do.debris_id
WHERE oe.risk_score >= 7; 
-- CHECK
SELECT * FROM High_Risk_Debris_Dashboard;
-- UPDATE 
CREATE OR REPLACE VIEW High_Risk_Debris_Dashboard AS
SELECT 
    oe.event_id,
    oe.event_type,
    oe.risk_score,
    do.object_name,
    do.size_meters
FROM Orbital_Events oe
INNER JOIN Debris_Objects do ON oe.debris_id = do.debris_id
WHERE oe.event_type = 'Collision';
-- CHECK
SELECT * FROM High_Risk_Debris_Dashboard;
-- DROP VIEW
DROP VIEW IF EXISTS High_Risk_Debris_Dashboard;

-- CREATE INDEX SPEEDS UP DATA RETRIEVAL
CREATE INDEX idx_event_date 
ON Orbital_Events (event_date);
-- UNIQUE INDEX
CREATE UNIQUE INDEX idx_unique_country_name 
ON Countries (country_name);
-- DROP INDEX
ALTER TABLE Orbital_Events 
DROP INDEX idx_event_date;

-- INNER SUBQUERY (Executes Once)
SELECT 
    debris_id, 
    object_name, 
    mass_kg
FROM Debris_Objects
WHERE mass_kg > (
    -- The Inner Subquery (runs once)
    SELECT AVG(mass_kg) 
    FROM Debris_Objects
);

-- CORRELATED SUBQUERY (Executes for Every Row) --  INNER RELIES ON OUTER QUERY
SELECT 
    outer_d.debris_id, 
    outer_d.object_name, 
    outer_d.size_meters, 
    outer_d.originating_satellite_id
FROM Debris_Objects outer_d
WHERE outer_d.size_meters > (
    -- The Outer Subquery (runs repeatedly per row)
    SELECT AVG(inner_d.size_meters) -- CALCULATES AVG  REPEATEDLY FOR EACH ROW
    FROM Debris_Objects inner_d
    WHERE inner_d.originating_satellite_id = outer_d.originating_satellite_id
);

-- STORED FUNCTIONS  (Returns a Single Value)  -- saved,reusable calculation
DELIMITER // --statement beginning

CREATE FUNCTION GetDebrisMassCategory(mass DECIMAL(8,2)) -- performs calculation
RETURNS VARCHAR(20)
DETERMINISTIC -- the function will always return the exact same answer if you give it the exact same input.
BEGIN
    DECLARE category VARCHAR(20); -- temporary placeholder variable  inside this function
    
    IF mass >= 20.00 THEN
        SET category = 'High Risk';
    ELSEIF mass >= 5.00 AND mass < 20.00 THEN
        SET category = 'Moderate Risk';
    ELSE
        SET category = 'Low Risk';
    END IF;
    
    RETURN category;
END //

DELIMITER ;

-- TEST
SELECT object_name, mass_kg, GetDebrisMassCategory(mass_kg) AS mass_threat_tier
FROM Debris_Objects;

-- STORED PROCEDURE --Macro reuse and call whenever needed
DELIMITER //

CREATE PROCEDURE UpdateDebrisMetrics(
    IN p_debris_id INT,
    IN p_new_size DECIMAL(5,2),
    IN p_new_mass DECIMAL(8,2),       -- read only
    OUT p_risk_category VARCHAR(20)   -- calculates value
)
BEGIN
    -- Update the core physical properties of the debris asset
    UPDATE Debris_Objects 
    SET size_meters = p_new_size, 
        mass_kg = p_new_mass
    WHERE debris_id = p_debris_id;
    
    -- Assign the output category calling our stored function
    SET p_risk_category = GetDebrisMassCategory(p_new_mass);
END //

DELIMITER ;

-- TEST
-- Define a session variable to capture the result
SET @out_category = '';

-- Call the procedure for debris_id = 1
CALL UpdateDebrisMetrics(1, 0.45, 25.50, @out_category);

-- View the updated classification result
SELECT @out_category AS newly_assigned_tier;

-- TRIGGER -- cause and effect.as action occurs ,wakes up and runs

DELIMITER //

CREATE TRIGGER After_New_HighRisk_Debris_Insert
AFTER INSERT ON Debris_Objects
FOR EACH ROW                                               -- runs for every sigle line
BEGIN
    -- Check if the newly added record matches high risk structural weight criteria
    IF NEW.mass_kg >= 20.00 THEN
        INSERT INTO Orbital_Events (debris_id, event_type, event_date, risk_score)
        VALUES (
            NEW.debris_id, 
            'Automated High-Mass Alert', 
            CURDATE(), 
            9 -- High priority scale rating out of 10 -- on weighing above 20kg high pmass alert is triggered with event date it happened
        );
    END IF;
END //

DELIMITER ;

-- TEST
INSERT INTO Debris_Objects (object_name, size_meters, mass_kg, originating_satellite_id) 
VALUES ('Massive Upper Stage Shard', 4.20, 65.00, 1);

-- Verify that the trigger instantly fired and wrote an entry to Orbital_Events
SELECT * FROM Orbital_Events WHERE event_type = 'Automated High-Mass Alert';


