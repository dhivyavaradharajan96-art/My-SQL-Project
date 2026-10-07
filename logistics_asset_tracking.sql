-- =========================================================================
-- PROJECT TITLE: ENTERPRISE GLOBAL LOGISTICS & INVENTORY ASSET TRACKING SYSTEM
-- ARCHITECTURE: MULTI-REGIONAL PIPELINE & INCIDENT MITIGATION ARCHITECTURE
-- CONTEXT: SUPPLY CHAIN MANAGEMENT & FLEET LIFECYCLE TRACKING
-- =========================================================================

CREATE DATABASE LogisticsTracker;
USE LogisticsTracker;

-- 1. Regional Hubs & Logistics Centers (Formerly: Countries)
CREATE TABLE Regional_Hubs (
    hub_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(100) NOT NULL,
    operating_carrier VARCHAR(100)
);

-- 2. Distribution Fleets & Active Machinery (Formerly: Satellites)
CREATE TABLE Asset_Fleets (
    asset_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_model_name VARCHAR(100) NOT NULL,
    deployment_year INT,
    hub_id INT,
    FOREIGN KEY (hub_id) REFERENCES Regional_Hubs(hub_id)
);

-- 3. Damaged Cargo & Shipping Incidents (Formerly: Debris_Objects)
CREATE TABLE Cargo_Incidents (
    incident_item_id INT PRIMARY KEY AUTO_INCREMENT,
    package_description VARCHAR(100) NOT NULL,
    dimension_meters DECIMAL(5, 2),
    weight_kg DECIMAL(8, 2),
    originating_asset_id INT,
    FOREIGN KEY (originating_asset_id) REFERENCES Asset_Fleets(asset_id)
);

-- 4. High-Risk Supply Chain Bottlenecks & Critical Exceptions (Formerly: Orbital_Events)
CREATE TABLE Supply_Chain_Exceptions (
    exception_id INT PRIMARY KEY AUTO_INCREMENT,
    incident_item_id INT,
    exception_type VARCHAR(50), -- e.g., 'Transit Delay', 'Route Collision', 'Package Rupture'
    reported_date DATE,
    severity_score INT, -- Criticality Rating Scale: 1 to 10
    FOREIGN KEY (incident_item_id) REFERENCES Cargo_Incidents(incident_item_id)
);

-- =========================================================================
-- DATA SEEDING (DML OPERATIONS)
-- =========================================================================

-- 1. Seed Multi-Regional Logistical Operations Nodes
INSERT INTO Regional_Hubs (region_name, operating_carrier) VALUES 
('North America East', 'FedEx Express'),
('APAC South (Japan Hub)', 'Yamato Transport'),
('Trans-Canada Trade Zone', 'Canada Post'),
('Euro-Zone West (France)', 'DHL Global'),
('Central Europe (Germany)', 'DB Schenker'),
('Southern Europe (Italy)', 'Poste Italiane'),
('UK Domestic Network', 'Royal Mail'),
('East Asia Core (South Korea)', 'CJ Logistics'),
('LATAM South (Brazil)', 'Correios'),
('Eastern Europe Pipeline', 'Ukrposhta'),
('Oceania Freight Zone', 'Australia Post'),
('South America Coast (Argentina)', 'Correo Argentino'),
('Middle East Node (Israel)', 'Israel Post'),
('Western Asia Cargo', 'Iran Post'),
('North Asia Transport', 'KPT'),
('South Asia Zone (Pakistan)', 'Pakistan Post'),
('Eurasia Hub (Turkey)', 'PTT'),
('Central America Zone (Mexico)', 'Correos de México'),
('Benelux Network (Netherlands)', 'PostNL'),
('Iberian Peninsula (Spain)', 'Correos'),
('Nordic Core (Sweden)', 'PostNord'),
('Alpine Trade Route (Switzerland)', 'Swiss Post'),
('Central Europe East (Austria)', 'Austrian Post'),
('Belgian Logistics Base', 'bpost'),
('Eastern Europe Base (Poland)', 'Poczta Polska'),
('Nordic Coast (Norway)', 'Posten Norge'),
('Scandinavia Node (Denmark)', 'PostNord Danmark'),
('Nordic North (Finland)', 'Posti Group'),
('Central Europe Central (Czech Rep)', 'Česká pošta'),
('Pannonian Basin (Hungary)', 'Magyar Posta'),
('Balkan Trade Route (Romania)', 'Poșta Română'),
('Iberian West (Portugal)', 'CTT'),
('Aegean Cargo Hub (Greece)', 'Hellenic Post'),
('African Southern Node (South Africa)', 'SAPO'),
('West African Cargo (Nigeria)', 'NIPOST'),
('Nile Valley Logistics (Egypt)', 'Egypt Post'),
('Maghreb Trade Zone (Algeria)', 'Algérie Poste'),
('East African Hub (Kenya)', 'Posta Kenya'),
('Gulf Trade Node (Saudi Arabia)', 'Saudi Post'),
('Middle East Express (UAE)', 'Emirates Post'),
('Southeast Asia Base (Indonesia)', 'Pos Indonesia'),
('Malay Peninsula (Malaysia)', 'Pos Malaysia'),
('Indochina Freight (Thailand)', 'Thailand Post'),
('Southeast Asia East (Vietnam)', 'Vietnam Post'),
('Archipelago Logistics (Philippines)', 'PHLPost'),
('South Pacific Core (New Zealand)', 'NZ Post'),
('Amazon Basin Node (Brazil Regional)', 'Total Express'),
('Andean Network (Colombia)', 'Servientrega'),
('Pacific Coast South (Chile)', 'Starken'),
('Caribbean Gateway (Venezuela)', 'Ipostel');

-- 2. Seed Active Fleet Logistics Machinery & Equipment Assets
INSERT INTO Asset_Fleets (asset_model_name, deployment_year, hub_id) VALUES
('FreightLiner Classic 100', 1962, 1),
('Thermo King Reefer Gen-1', 1960, 1),
('Heavy Duty Crane Asset 90', 1990, 1),
('Cargo Train Engine V1', 1957, 3),
('Cargo Train Engine V2', 1957, 3),
('Delivery Truck E-100', 1961, 3),
('Loading Dock Loader 2', 1959, 3),
('Intermodal Transit Depot Suite', 1998, 4),
('Tata Prima Hauler 75', 1975, 5),
('Mahindra Blazo Cargo Fleet', 1980, 5),
('BharatBenz Delivery Unit', 2013, 5),
('Ashok Leyland Express Box', 2008, 5),
('Isuzu Forward Truck', 1970, 6),
('Hino Ranger Freighter', 2003, 6),
('Peterbilt Long-Hauler A1', 1962, 7),
('Kenworth Heavy Transport', 1972, 7),
('Renault Premium Cargo Truck', 1965, 8),
('Scania Streamline Box Truck', 1986, 8),
('Mercedes-Benz Actros Rig', 1969, 9),
('MAN TGX Long-Haul Rig', 2007, 9),
('Iveco Stralis Carrier', 1964, 10),
('Piaggio Porter Utility Van', 2012, 10),
('Leyland DAF Distribution Unit', 1962, 11),
('Dennis Eagle Refuse Hauler', 1969, 11),
('Hyundai Xcient Heavy Duty Truck', 1992, 12),
('Kia Bongo Delivery Truck', 2010, 12),
('Volkswagen Constellation Hauler', 1993, 13),
('Volvo FH16 Multi-Axle Cargo', 1999, 13),
('KrAZ Heavy Cargo Freighter', 1995, 14),
('Mack Trucks Heavy Rig R-Series', 1967, 15),
('Western Star Distribution Fleet', 2002, 15),
('Ford Cargo Utility Carrier', 1996, 16),
('Scania R-Series Transporter', 2014, 16),
('Tatra T815 Offroad Transport', 1988, 17),
('DAF XF Long-Haul Tractor', 1996, 17),
('Khodro Diesel Delivery Van', 2005, 18),
('Saipa Diesel Rigid Truck', 2009, 18),
('Changan Delivery Van Unit 1', 1998, 19),
('Dongfeng Heavy Transporter V3', 2012, 19),
('Bedford TK Legacy Truck', 1990, 20),
('Hino 300 Light Duty Carrier', 2002, 20),
('BMC Professional Hauler 1A', 1994, 21),
('Ford Otosan Cargo Truck', 2012, 21),
('Freightliner Cascadia Rig', 1998, 22),
('Kenworth T680 Freight Carrier', 1985, 22),
('DAF CF Medium Duty Truck', 1974, 23),
('Volvo FM Regional Distributor', 2002, 23),
('Pegaso Troner Route Transport', 1992, 24),
('Iveco Eurocargo Box Van', 2009, 24),
('Foton Auman Heavy Hauler S1', 1971, 2);
 
-- 3. Seed Cargo Damage Reports & Broken Freight Shard Logs
INSERT INTO Cargo_Incidents (package_description, dimension_meters, weight_kg, originating_asset_id) VALUES
('Damaged Pallet Shard B (Industrial Hub)', 0.22, 18.40, 2),
('Ruptured Polybag Segment C', 0.05, 1.20, 2),
('Crushed Wooden Crate Shard D', 0.45, 35.10, 2),
('Broken Packing Strap Splinter E', 0.11, 4.80, 2),
('Deformed Steel Barrel Scrap C', 1.10, 160.00, 3),
('Fractured Pallet Bottom Plate D', 0.32, 22.50, 3),
('Torn Plastic Shrinkwrap Layer E', 0.08, 2.10, 3),
('Crushed Composite Cargo Crate F', 0.60, 75.00, 3),
('Shattered Plastic Tote Box Fragment A', 0.18, 9.30, 4),
('Broken Security Seals Clasp Piece B', 0.04, 0.65, 4),
('Damaged Heavy Duty Engine Mount Shard C', 0.55, 48.00, 4),
('Bent Structural Iron Cargo Support D', 1.30, 210.00, 4),
('Shredded Protective Bubble Sheet E', 0.02, 0.12, 4),
('Deformed Aluminum Cargo Panel F', 0.88, 92.40, 4),
('Loose Refrigeration Unit Vent Flake', 0.07, 0.40, 5),
('Broken Container Door Bracket B', 0.14, 2.80, 5),
('Torn Insulation Foil Weather Shielding', 1.20, 0.35, 5),
('Snapped Cable Tie Antenna Clamp', 0.09, 1.15, 5),
('Exposed Electrical Wire Harness Segment', 0.35, 0.90, 5),
('Chipped Container Paint Shard Alpha', 0.01, 0.01, 1),
('Sheared Trailer Structural Bolt Delta', 0.03, 0.18, 1),
('Ruptured Fluid Tank Steel Shard', 0.70, 64.00, 1),
('Damaged Trailer Outer Fairing Piece', 1.90, 185.00, 1),
('Chipped Machine Guard Shrapnel Alpha', 0.40, 28.00, 1),
('Broken Conveyor Side Bracket Beta', 0.15, 6.20, 1),
('Heavy Hydraulic Crane Frame Fragment', 1.05, 140.00, 1),
('Dismantled Liftgate Upper Stage Shard', 2.50, 520.00, 1),
('Ruptured Engine Compartment Component', 0.65, 55.00, 1),
('Detached Trailer Auxiliary Motor Shard', 0.80, 85.00, 1),
('Broken Dock Leveler Lip Adapter Ring', 2.20, 310.00, 1),
('Detached Trailer Protective Cover Cap', 0.30, 4.50, 2),
('Broken Structural Framework Fragment', 0.12, 2.30, 2),
('Deformed Battery Storage Box Casing', 0.50, 42.00, 2),
('Crushed Exterior Panel Segment Group', 0.95, 78.00, 2),
('Exploded Auxiliary Power Unit Housing Wall', 0.75, 61.50, 3),
('Bent Solar Power Array Boom Rig', 1.60, 115.00, 3),
('Shattered Window Protection Frame Splinter', 0.28, 7.10, 3),
('Chipped Transport Base Chassis Fragment', 0.42, 19.00, 3),
('Torn Protective Thermal Engine Cover', 1.15, 8.40, 4),
('Shattered Monitoring Camera Lens Hood', 0.38, 11.20, 4),
('Leaking Fuel Line Coupling Bolt', 0.06, 1.05, 4),
('Loose Alternator Assembly Wiring Clip', 0.04, 0.25, 4),
('Broken Trailer Hitch Ring Segment', 1.75, 230.00, 5),
('Chipped Reefer Cooling Panel Flake', 0.18, 3.40, 5),
('Torn Cargo Security Blanket Fragment', 1.40, 0.95, 5),
('Bent Weighing Sensor Mounting Bracket', 0.13, 2.10, 5),
('Unknown Fleet Payload Adapter Rib', 0.85, 44.00, 1),
('Damaged External Debris Shield Piece', 0.26, 5.30, 3),
('Solidified Lubricant Droplet Cluster', 0.03, 0.08, 4),
('Damaged Optical Sensor Protective Shield', 0.52, 14.70, 5);

-- 4. Seed Supply Chain Disruptions & Critical Pipeline Exception Logs
INSERT INTO Supply_Chain_Exceptions (incident_item_id, exception_type, reported_date, severity_score) VALUES
(5, 'Route Collision', '2026-06-28', 10),
(12, 'Package Rupture', '2026-06-18', 9),
(24, 'Package Rupture', '2026-06-22', 9),
(37, 'Route Collision', '2026-06-14', 10),
(6, 'Transit Delay', '2026-06-02', 8),
(9, 'Transit Delay', '2026-06-05', 7),
(15, 'Transit Delay', '2026-06-11', 8),
(18, 'Transit Delay', '2026-06-16', 7),
(21, 'Transit Delay', '2026-06-20', 8),
(27, 'Transit Delay', '2026-06-24', 8),
(30, 'Transit Delay', '2026-06-26', 7),
(33, 'Transit Delay', '2026-06-29', 8),
(42, 'Transit Delay', '2026-06-13', 7),
(45, 'Transit Delay', '2026-06-19', 8),
(48, 'Transit Delay', '2026-06-23', 7),
(7, 'Component Degradation', '2026-06-03', 4),
(10, 'Component Degradation', '2026-06-06', 3),
(13, 'Component Degradation', '2026-06-08', 5),
(16, 'Component Degradation', '2026-06-12', 4),
(19, 'Component Degradation', '2026-06-17', 3),
(22, 'Component Degradation', '2026-06-21', 5),
(25, 'Component Degradation', '2026-06-25', 4),
(28, 'Component Degradation', '2026-06-27', 3),
(31, 'Component Degradation', '2026-06-28', 4),
(34, 'Component Degradation', '2026-06-29', 5),
(8, 'Scrap Disposal Re-entry', '2026-06-04', 1),
(11, 'Scrap Disposal Re-entry', '2026-06-07', 1),
(14, 'Scrap Disposal Re-entry', '2026-06-10', 1),
(17, 'Scrap Disposal Re-entry', '2026-06-15', 1),
(20, 'Scrap Disposal Re-entry', '2026-06-19', 1),
(23, 'Scrap Disposal Re-entry', '2026-06-22', 1),
(26, 'Scrap Disposal Re-entry', '2026-06-26', 1),
(29, 'Transit Delay', '2026-06-01', 5),
(32, 'Transit Delay', '2026-06-03', 6),
(35, 'Transit Delay', '2026-06-05', 4),
(36, 'Transit Delay', '2026-06-09', 5),
(38, 'Transit Delay', '2026-06-12', 6),
(39, 'Transit Delay', '2026-06-14', 4),
(40, 'Transit Delay', '2026-06-17', 5),
(41, 'Transit Delay', '2026-06-20', 6),
(43, 'Transit Delay', '2026-06-22', 4),
(44, 'Transit Delay', '2026-06-24', 5),
(46, 'Transit Delay', '2026-06-25', 6),
(47, 'Transit Delay', '2026-06-26', 4),
(49, 'Transit Delay', '2026-06-27', 5),
(50, 'Transit Delay', '2026-06-28', 6),
(1, 'Transit Delay', '2026-06-29', 4),
(2, 'Transit Delay', '2026-06-29', 5),
(3, 'Component Degradation', '2026-06-29', 3),
(4, 'Transit Delay', '2026-06-29', 6);

-- =========================================================================
-- DATA QUERY LANGUAGE (DQL) OPERATIONS
-- =========================================================================

SELECT * FROM Regional_Hubs;
SELECT * FROM Asset_Fleets;
SELECT * FROM Cargo_Incidents;
SELECT * FROM Supply_Chain_Exceptions;

-- Query critical cargo damage logs weighing more than 100 kilograms for freight reclamation analysis
SELECT package_description, dimension_meters, weight_kg 
FROM Cargo_Incidents 
WHERE weight_kg > 100.00 
ORDER BY weight_kg DESC;

-- =========================================================================
-- DATA DEFINITION LANGUAGE (DDL) ALTERATIONS
-- =========================================================================

-- ALTER: Append operational telemetry status column to tracked machinery fleets
ALTER TABLE Asset_Fleets 
ADD COLUMN operational_status VARCHAR(20) DEFAULT 'Active';

SELECT * FROM Asset_Fleets;

-- ALTER: Configure constraint ensuring exception data stays within logical severity limits (1-10)
ALTER TABLE Supply_Chain_Exceptions 
ADD CONSTRAINT chk_severity_score CHECK (severity_score BETWEEN 1 AND 10);

-- Validate Constraint Engine Integrity (Should throw validation error)
-- INSERT INTO Supply_Chain_Exceptions (incident_item_id, exception_type, reported_date, severity_score) VALUES (1, 'Route Collision', '2026-07-02', 12);

-- OPTIMIZATION: Index physical attributes of damaged packages to accelerate logistics audits
CREATE INDEX idx_cargo_metrics ON Cargo_Incidents (dimension_meters, weight_kg);
SHOW INDEX FROM Cargo_Incidents;

-- Verify Execution Plan Utilization
EXPLAIN SELECT package_description, dimension_meters, weight_kg 
FROM Cargo_Incidents 
WHERE dimension_meters > 0.50 AND weight_kg > 50.00;

-- CREATE AUXILIARY MANAGEMENT TABLE
CREATE TABLE IoT_Tracking_Stations (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100) NOT NULL,
    location_country VARCHAR(100),
    rfid_frequency_ghz DECIMAL(4,2)
); 

INSERT INTO IoT_Tracking_Stations (station_name, location_country, rfid_frequency_ghz) VALUES 
('Diego Garcia RFID Gateway', 'British Indian Ocean Territory', 5.50),
('Eglin Logistic Radar Hub', 'United States', 0.44),
('Nordic Gateway Route Monitor', 'Norway', 10.00);

SELECT * FROM IoT_Tracking_Stations;
TRUNCATE TABLE IoT_Tracking_Stations;
DROP TABLE IoT_Tracking_Stations;

-- =========================================================================
-- DATA MANIPULATION LANGUAGE (DML) MUTATIONS
-- =========================================================================

INSERT INTO Supply_Chain_Exceptions (incident_item_id, exception_type, reported_date, severity_score) 
VALUES (1, 'Customs Hold', '2026-08-02', 3);

SELECT * FROM Supply_Chain_Exceptions;

UPDATE Supply_Chain_Exceptions SET severity_score = 9 WHERE exception_id = 3;
SELECT * FROM Supply_Chain_Exceptions;

DELETE FROM Supply_Chain_Exceptions WHERE exception_type = 'Package Rupture';
SELECT * FROM Supply_Chain_Exceptions;

-- =========================================================================
-- DATA CONTROL LANGUAGE (DCL) SIMULATION
-- =========================================================================

CREATE USER 'logistics_analyst'@'localhost' IDENTIFIED BY 'secure_pass123';
GRANT SELECT, INSERT ON LogisticsTracker.Supply_Chain_Exceptions TO 'logistics_analyst'@'localhost';
GRANT ALL PRIVILEGES ON LogisticsTracker.Cargo_Incidents TO 'logistics_analyst'@'localhost';

REVOKE ALL PRIVILEGES ON LogisticsTracker.Cargo_Incidents FROM 'logistics_analyst'@'localhost';
REVOKE ALL PRIVILEGES ON LogisticsTracker.Supply_Chain_Exceptions FROM 'logistics_analyst'@'localhost';

-- =========================================================================
-- TRANSACTION CONTROL LANGUAGE (TCL) SEGMENTS
-- =========================================================================

-- Re-instating table for TCL pipeline workflow
CREATE TABLE IoT_Tracking_Stations (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100) NOT NULL,
    location_country VARCHAR(100),
    rfid_frequency_ghz DECIMAL(4, 2)
);

START TRANSACTION;

-- Step 1: Deploy a brand new delivery fleet truck asset
INSERT INTO Asset_Fleets (asset_model_name, deployment_year, hub_id) 
VALUES ('Starlink-Logistic-Carrier-99', 2026, 1);

-- Step 2: Log first package structural damage asset anomaly linked to the truck
INSERT INTO Cargo_Incidents (package_description, dimension_meters, weight_kg, originating_asset_id) 
VALUES ('Carrier-99 Ruptured Panel Piece', 0.25, 14.20, LAST_INSERT_ID());

-- Step 3: Immediately push a critical transit delay alert exception
INSERT INTO Supply_Chain_Exceptions (incident_item_id, exception_type, reported_date, severity_score) 
VALUES (LAST_INSERT_ID(), 'Transit Delay', '2026-07-02', 7);

COMMIT; 

SELECT * FROM Asset_Fleets;
SELECT * FROM Cargo_Incidents;
SELECT * FROM Supply_Chain_Exceptions;

-- TRANSACTION WITH ROLLBACK CONTROLS
START TRANSACTION;
INSERT INTO Asset_Fleets (asset_model_name, deployment_year, hub_id) VALUES ('Experimental Trailer', 2026, 2);
ROLLBACK;
SELECT * FROM Asset_Fleets;

-- ADVANCED PARTIAL TRANSACTION VIA SAVEPOINTS
START TRANSACTION;

INSERT INTO IoT_Tracking_Stations (station_name, location_country, rfid_frequency_ghz) 
VALUES ('Kwajalein Cargo Node 1', 'Marshall Islands', 5.80);

SAVEPOINT primary_station_saved;

INSERT INTO IoT_Tracking_Stations (station_name, location_country, rfid_frequency_ghz) 
VALUES ('Unverified Temporary Rig', 'International Waters', 14.50);

ROLLBACK TO primary_station_saved;
COMMIT;

SELECT * FROM IoT_Tracking_Stations;

-- =========================================================================
-- ADVANCED OPERATORS, GROUP BY & ALIASING
-- =========================================================================

SELECT DISTINCT exception_type AS Unique_High_Severity_Exception_Types
FROM Supply_Chain_Exceptions
WHERE severity_score >= 7 
  AND exception_type NOT LIKE '%Test%' 
  AND exception_type IS NOT NULL;  

-- Aggregate Analytics reporting metrics over damaged asset pools
SELECT 
    originating_asset_id,
    COUNT(incident_item_id) AS Total_Damaged_Packages,
    SUM(weight_kg) AS Cumulative_Lost_Weight_KG,
    AVG(dimension_meters) AS Mean_Package_Volume_Meters,
    MIN(dimension_meters) AS Smallest_Deformed_Piece,
    MAX(weight_kg) AS Heaviest_Lost_Item
FROM Cargo_Incidents
WHERE originating_asset_id IS NOT NULL
GROUP BY originating_asset_id
HAVING COUNT(incident_item_id) > 1 
   AND SUM(weight_kg) BETWEEN 10.00 AND 5000.00;

-- STRING & SCALAR METRICS EXAMPLES
SELECT region_name, UPPER(operating_carrier) AS Carrier_Uppercase FROM Regional_Hubs;
SELECT asset_id, LOWER(asset_model_name) AS Lowercase_Asset_Name FROM Asset_Fleets;
SELECT package_description, LENGTH(package_description) AS Desc_Character_Count FROM Cargo_Incidents;
SELECT package_description, ROUND(dimension_meters, 1) AS Rounded_Dimension_Meters FROM Cargo_Incidents;

SELECT 
    exception_id, 
    reported_date, 
    NOW() AS Audit_Execution_Time,
    DATEDIFF(NOW(), reported_date) AS Days_Elapsing_Since_Incident 
FROM Supply_Chain_Exceptions;

SELECT exception_id, exception_type, severity_score
FROM Supply_Chain_Exceptions
ORDER BY severity_score DESC
LIMIT 3;

-- ARITHMETIC OPERATORS UTILIZATION ANALYTICS
SELECT 
    package_description,
    weight_kg,
    (weight_kg + 50) AS Post_Impact_Weight_Estimate,
    (1000 - weight_kg) AS Available_Remaining_Payload_Capacity,
    (weight_kg * 1000) AS Mass_In_Grams,
    (dimension_meters / 0.01) AS Size_In_Centimeters,
    (incident_item_id % 2) AS Is_Even_Indexed_Row
FROM Cargo_Incidents
WHERE weight_kg IS NOT NULL;

SELECT exception_id, exception_type, severity_score 
FROM Supply_Chain_Exceptions
WHERE exception_type != 'Test'       
  AND severity_score > 5             
  AND severity_score <= 9            
  AND reported_date >= '2025-01-01';

SELECT asset_id, asset_model_name, deployment_year
FROM Asset_Fleets
WHERE (deployment_year > 2010 AND deployment_year < 2020) 
   OR NOT (hub_id = 5);                        

SELECT incident_item_id, package_description, weight_kg
FROM Cargo_Incidents
WHERE weight_kg BETWEEN 25.00 AND 500.00 
  AND originating_asset_id IN (1, 2, 3, 5)
  AND package_description LIKE 'Damaged%'
  AND dimension_meters IS NOT NULL;

-- =========================================================================
-- LOGISTICS NETWORK INFRASTRUCTURE TABLES (FOR ARCHIVAL & JOINS)
-- =========================================================================

CREATE TABLE Fleet_Supply_Vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100),
    route_reliability_rate DECIMAL(5, 2)
);

CREATE TABLE Dispatch_Details (
    dispatch_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_id INT UNIQUE,
    vehicle_id INT,
    dispatch_date DATE,
    origin_dispatch_site VARCHAR(100),
    FOREIGN KEY (vehicle_id) REFERENCES Fleet_Supply_Vehicles(vehicle_id)
);

CREATE TABLE Geographical_Transit_Zones (
    zone_id INT PRIMARY KEY AUTO_INCREMENT,
    zone_code VARCHAR(10) UNIQUE,
    min_radius_km INT,
    max_radius_km INT
);

CREATE TABLE Active_Incident_Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    incident_item_id INT UNIQUE,
    zone_id INT,
    route_inclination DECIMAL(5,2),
    outer_bound_km INT,
    inner_bound_km INT,
    FOREIGN KEY (zone_id) REFERENCES Geographical_Transit_Zones(zone_id)
);

CREATE TABLE Regional_Auditing_Hubs (
    auditor_id INT PRIMARY KEY AUTO_INCREMENT,
    station_name VARCHAR(100) NOT NULL,
    hub_id INT,
    hardware_radar_type VARCHAR(50)
);

CREATE TABLE Pipeline_Mitigation_Vendors (
    vendor_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_name VARCHAR(100) NOT NULL,
    hub_id INT,
    allocated_budget_millions DECIMAL(10,2)
);

CREATE TABLE Active_Cleanup_Operations (
    operation_id INT PRIMARY KEY AUTO_INCREMENT,
    operation_name VARCHAR(100) NOT NULL,
    vendor_id INT,
    target_incident_item_id INT,
    operation_status VARCHAR(50),
    launch_year INT,
    FOREIGN KEY (vendor_id) REFERENCES Pipeline_Mitigation_Vendors(vendor_id)
);

-- SEED DATA EXTRA DATA FOR JOINS
INSERT INTO Fleet_Supply_Vehicles (vehicle_id, vehicle_name, manufacturer, route_reliability_rate) VALUES
(1, 'Falcon 9 Carrier', 'SpaceX Freight', 99.20), (2, 'H3 Delivery Truck', 'MHI Logistics', 85.00), (3, 'GSLV Heavy Hauler', 'ISRO Trucking', 95.00),
(4, 'Ariane 6 Transport', 'ArianeGroup Log', 90.00), (5, 'Electron Van', 'Rocket Lab Express', 92.00), (6, 'Atlas V Carrier', 'ULA Freight', 98.50),
(7, 'Vega C Utility', 'Avio Logistics', 80.00), (8, 'Delta IV Container', 'ULA Freight', 96.00), (9, 'Long March Heavy Truck', 'CASC Trans', 94.00),
(10, 'PSLV Medium Truck', 'ISRO Trucking', 97.00), (11, 'Falcon Heavy Rig', 'SpaceX Freight', 98.00), (12, 'Starship Mega Freighter', 'SpaceX Freight', 65.00),
(13, 'Soyuz Carrier Van', 'Roscosmos Log', 95.50), (14, 'New Glenn Transport', 'Blue Origin Freight', 70.00), (15, 'Vulcan Rig', 'ULA Freight', 91.00),
(16, 'Long March Light Van', 'CASC Trans', 96.20), (17, 'Antares Freighter', 'Northrop Cargo', 93.00), (18, 'Epsilon Delivery Van', 'JAXA Logistics', 88.00),
(19, 'KSLV-II Rigid Truck', 'KARI Freight', 85.00), (20, 'Terran 1 Eco Van', 'Relativity Transit', 50.00);

INSERT INTO Dispatch_Details (dispatch_id, asset_id, vehicle_id, dispatch_date, origin_dispatch_site) VALUES
(1, 1, 1, '2021-05-15', 'CCAFS Terminal 40'), (2, 2, 2, '2019-02-12', 'Tanegashima Base'), (3, 3, 3, '2019-11-27', 'Sriharikota Terminal'),
(4, 4, 4, '2022-07-01', 'Kourou ELA-4 Hub'), (5, 5, 6, '2000-12-18', 'Vandenberg SLC-3E'), (6, 6, 4, '2015-06-10', 'Kourou ELA-3 Hub'),
(7, 7, 8, '2005-09-08', 'Cape Canaveral Port'), (8, 8, 4, '2018-03-22', 'Kourou ELA-3 Hub'), (9, 9, 5, '2023-01-11', 'Mahia NZ Depot'),
(10, 10, 10, '2013-08-22', 'Yasny Terminal'), (11, 11, 11, '2022-11-01', 'KSC Complex 39A'), (12, 12, 12, '2024-03-14', 'Boca Chica Facility'),
(13, 13, 13, '2021-12-25', 'Baikonur Yard'), (14, 14, 1, '2023-06-18', 'Vandenberg SLC-4E'), (15, 15, 15, '2024-01-08', 'CCSFS Term 41'),
(16, 16, 5, '2022-05-03', 'Mahia NZ Depot'), (17, 17, 1, '2020-10-18', 'KSC Complex 39A'), (18, 18, 10, '2021-02-28', 'Sriharikota Terminal'),
(19, 19, 9, '2020-07-23', 'Wenchang Terminal'), (20, 20, 16, '2023-05-10', 'Wenchang Terminal');

INSERT INTO Geographical_Transit_Zones (zone_id, zone_code, min_radius_km, max_radius_km) VALUES
(1, 'LEO-Z', 160, 2000), (2, 'MEO-Z', 2000, 35786), (3, 'GEO-Z', 35786, 35800), (4, 'HEO-Z', 40000, 100000),
(5, 'VLEO-Z', 100, 300), (6, 'SSO-Z', 500, 1000), (7, 'MOL-Z', 500, 40000), (8, 'GTO-Z', 250, 35786),
(9, 'TUNDRA-Z', 24000, 47000), (10, 'CISLUNAR-Z', 100000, 400000), (11, 'GRAVE-Z', 36100, 36500), (12, 'POLAR-Z', 600, 1000),
(13, 'EQ-L-Z', 200, 800), (14, 'SUB-O-Z', 50, 150), (15, 'LUNAR-Z', 380000, 390000), (16, 'L1-Z', 1400000, 1600000),
(17, 'L2-Z', 1400000, 1600000), (18, 'LAGR5-Z', 1450000, 1550000), (19, 'INT-PL-Z', 500000, 9999999), (20, 'DEEP-Z', 9999999, 99999999);

INSERT INTO Active_Incident_Locations (location_id, incident_item_id, zone_id, route_inclination, outer_bound_km, inner_bound_km) VALUES
(1, 1, 1, 53.00, 552, 548), (2, 2, 1, 98.20, 710, 695), (3, 3, 6, 97.90, 505, 498),
(4, 4, 6, 98.50, 815, 801), (5, 5, 1, 98.20, 705, 700), (6, 6, 3, 0.05, 35790, 35778),
(7, 7, 3, 0.10, 35795, 35760), (8, 8, 3, 4.50, 35810, 35750), (9, 9, 1, 45.00, 410, 395),
(10, 10, 1, 98.10, 560, 545), (11, 11, 2, 55.00, 20200, 20100), (12, 12, 11, 1.20, 36250, 36180),
(13, 13, 6, 97.40, 610, 590), (14, 14, 1, 51.60, 420, 415), (15, 15, 12, 89.50, 850, 830),
(16, 16, 2, 56.00, 19100, 19050), (17, 17, 3, 0.02, 35788, 35782), (18, 18, 1, 42.00, 530, 520),
(19, 19, 8, 23.40, 35750, 280), (20, 20, 1, 98.80, 700, 680);

INSERT INTO Regional_Auditing_Hubs (auditor_id, station_name, hub_id, hardware_radar_type) VALUES
(1, 'Maui Surveillance Station', 1, 'Optical Sensor System'), (2, 'Okinawa Route Tracker', 2, 'Phased Array Tracker'), (3, 'Sriharikota Audit Facility', 3, 'Phased Array Radar'),
(4, 'Kourou Log Tracking Node', 4, 'Telemetry Receiver'), (5, 'Weilheim Signal Base', 5, 'Deep Frequency Dish'), (6, 'Goonhilly Local Ground Station', 6, 'Parabolic Tracking Dish'),
(7, 'Inuvik Fleet Auditing Post', 7, 'X-band Signal Gateway'), (8, 'Jeju Route Verification Post', 8, 'Optical Movement Tracker'), (9, 'Canberra Fleet Support Hub', 9, 'Deep Line Network'),
(10, 'Matera Laser Telemetry Node', 10, 'Laser Distance Tracker'), (11, 'Haystack System Audit Base', 1, 'X-Band System Radar'), (12, 'Diego Garcia Gateway Station', 1, 'Optical Sensor Unit'),
(13, 'Kwajalein Terminal Track Unit', 1, 'Millimeter-Wave Radar'), (14, 'Tanegashima Regional Audit Node', 2, 'Telemetry Sensor Array'), (15, 'Thule Early Hazard Warning Complex', 1, 'Early Warning Array'),
(16, 'New Norcia Long Distance Node', 9, 'Deep Space Support Antenna'), (17, 'Malindi Port Interface Station', 10, 'S-Band Antenna Assembly'), (18, 'Fucino Regional Routing Centre', 10, 'Telemetry Infrastructure'),
(19, 'Svalbard High Latitude Gateway', 4, 'Multi-Mission Polar Matrix'), (20, 'Hartebeesthoek Receiver Hub', 6, 'Deep Signal Receiver Set');

INSERT INTO Pipeline_Mitigation_Vendors (vendor_id, vendor_name, hub_id, allocated_budget_millions) VALUES
(1, 'SafeTransit Guard USA', 1, 45.50), (2, 'AstroScale Cargo Support', 2, 85.00), (3, 'Digantara Supply Assurance', 3, 12.00),
(4, 'ClearSpace Waste Management', 4, 60.50), (5, 'DebrisBerlin Supply Cleanup', 5, 18.00), (6, 'RemoveDebris UK Network', 6, 22.40),
(7, 'NorthStar Asset Assurance', 7, 35.00), (8, 'Seoul Pipeline Salvage', 8, 15.00), (9, 'AussieSpace Eco Carriers', 9, 8.50),
(10, 'SafeOrbit Italy Freight', 10, 14.20), (11, 'SpaceTrash Corporate Recovery', 1, 110.00), (12, 'Kika Log Sweep Agency', 2, 24.50),
(13, 'Zenith Supply Chain Labs', 3, 9.80), (14, 'Ecosat Euro Salvage', 4, 40.00), (15, 'Munich Clean Supply Systems', 5, 31.00),
(16, 'London Asset Recovery Ltd', 6, 17.50), (17, 'Polar Vacuum Supply Inc', 7, 19.00), (18, 'Pacific Route Sweepers', 9, 5.20),
(19, 'Roma Astro-Sweepers S.p.A.', 10, 21.00), (20, 'Texas Pipeline Sweepforce', 1, 75.00);

INSERT INTO Active_Cleanup_Operations (operation_id, operation_name, vendor_id, target_incident_item_id, operation_status, launch_year) VALUES
(1, 'Operation Clean Route 1', 2, 2, 'Active Deployment', 2025), (2, 'Project Warehouse Sweep', 1, 1, 'Scheduled Strategy', 2027), (3, 'IndoDebris Pipeline Null', 3, 3, 'Scheduled Strategy', 2028),
(4, 'ClearSpace Salvage Operations 1', 4, 4, 'Active Deployment', 2026), (5, 'EcoOrbit Drop Systems', 5, 5, 'Scheduled Strategy', 2027), (6, 'UK Supply Net-Catch', 6, 8, 'Completed Success', 2024),
(7, 'TrueNorth Freight Recovery', 7, 6, 'Scheduled Strategy', 2028), (8, 'K-Clean Route Sweep', 8, 10, 'Operational Failure', 2025), (9, 'Southern Cross Salvage Run', 9, 9, 'Scheduled Strategy', 2029),
(10, 'Med-Debris Pipeline Terminate', 10, 7, 'Scheduled Strategy', 2027), (11, 'Garbage Collector Maximum Run', 11, 11, 'Active Deployment', 2025), (12, 'Tokyo Harpoon Asset Recovery', 12, 12, 'Scheduled Strategy', 2026),
(13, 'Bengaluru Corporate Broom Run', 13, 13, 'Completed Success', 2023), (14, 'EuroTether Pro Alignment Run', 14, 14, 'Active Deployment', 2026), (15, 'Bavarian Induction Magnet Rig', 15, 15, 'Scheduled Strategy', 2027),
(16, 'Thames Asset Anchor Project', 16, 16, 'Scheduled Strategy', 2028), (17, 'Aurora Shield Supply Mitigation', 17, 17, 'Completed Success', 2024), (18, 'Sydney Net Alpha Route Sweep', 18, 18, 'Operational Failure', 2024),
(19, 'Vatican Clean Sphere Operation', 19, 19, 'Scheduled Strategy', 2026), (20, 'Austin Lasso Freight Retrieval', 20, 20, 'Active Deployment', 2026);

-- =========================================================================
-- LOGISTICAL DATA JOIN SCHEMAS
-- =========================================================================

-- INNER JOIN: Evaluating Dispatch schedules vs Vehicle Efficiency Metrics
SELECT 
    dd.dispatch_id, 
    fsv.vehicle_name, 
    dd.dispatch_date, 
    dd.origin_dispatch_site
FROM Dispatch_Details dd
INNER JOIN Fleet_Supply_Vehicles fsv ON dd.vehicle_id = fsv.vehicle_id;
 
 -- LEFT JOIN: Inspecting Vendor Engagement status across Mitigation Operations
SELECT 
    pmv.vendor_name, 
    pmv.allocated_budget_millions, 
    aco.operation_name, 
    aco.operation_status
FROM Pipeline_Mitigation_Vendors pmv
LEFT JOIN Active_Cleanup_Operations aco ON pmv.vendor_id = aco.vendor_id;

-- RIGHT JOIN: Mapping Incident Coordinates against Macro Geographical Transit Zones
SELECT 
    ail.incident_item_id, 
    ail.outer_bound_km, 
    gtz.zone_code
FROM Active_Incident_Locations ail
RIGHT JOIN Geographical_Transit_Zones gtz ON ail.zone_id = gtz.zone_id;

-- FULL OUTER JOIN SIMULATION: Cross-Referencing Regional Hub Auditing Networks vs Mitigation Vendors
SELECT rah.station_name, rah.hardware_radar_type, pmv.vendor_name
FROM Regional_Auditing_Hubs rah
LEFT JOIN Pipeline_Mitigation_Vendors pmv ON rah.hub_id = pmv.hub_id

UNION 

SELECT rah.station_name, rah.hardware_radar_type, pmv.vendor_name 
FROM Regional_Auditing_Hubs rah
RIGHT JOIN Pipeline_Mitigation_Vendors pmv ON rah.hub_id = pmv.hub_id;

-- SELF JOIN: Mapping Backup Hub configurations inside overlapping Auditing Zones
SELECT 
    rah1.station_name AS primary_auditing_node,
    rah2.station_name AS secondary_failover_node,
    rah1.hub_id
FROM Regional_Auditing_Hubs rah1
INNER JOIN Regional_Auditing_Hubs rah2 ON rah1.hub_id = rah2.hub_id
WHERE rah1.auditor_id < rah2.auditor_id;

-- =========================================================================
-- SET COMBINATIONS (UNION / INTERSECT OPERATIONS)
-- =========================================================================

-- UNION: Build structural asset registry grouping operational vs damaged categories
SELECT asset_model_name AS enterprise_asset_name, 'Operational Active Fleet' AS operational_category
FROM Asset_Fleets
UNION
SELECT package_description AS enterprise_asset_name, 'Damaged Scrap Material' AS operational_category
FROM Cargo_Incidents
ORDER BY enterprise_asset_name ASC;

-- UNION ALL: Aggregate cross-entity Hub operational dependencies
SELECT hub_id, 'Assigned to Active Equipment Fleet' AS deployment_context
FROM Asset_Fleets
UNION ALL
SELECT af.hub_id, 'Associated with Material Loss Incident Source' AS deployment_context
FROM Cargo_Incidents ci
INNER JOIN Asset_Fleets af ON ci.originating_asset_id = af.asset_id;

-- INTERSECT: Isolate asset profiles experiencing both package ruptures and fleet anomalies
SELECT originating_asset_id FROM Cargo_Incidents
INTERSECT
SELECT ci.originating_asset_id 
FROM Supply_Chain_Exceptions sce
INNER JOIN Cargo_Incidents ci ON sce.incident_item_id = ci.incident_item_id;

-- =========================================================================
-- DATA VIEW ARCHITECTURE
-- =========================================================================

-- CREATE VIEW: Operational Dashboard monitoring High Severity Exceptions
CREATE VIEW High_Severity_Logistics_Dashboard AS
SELECT 
    sce.exception_id,
    sce.exception_type,
    sce.severity_score,
    ci.package_description,
    ci.dimension_meters
FROM Supply_Chain_Exceptions sce
INNER JOIN Cargo_Incidents ci ON sce.incident_item_id = ci.incident_item_id
WHERE sce.severity_score >= 7; 

SELECT * FROM High_Severity_Logistics_Dashboard;

CREATE OR REPLACE VIEW High_Severity_Logistics_Dashboard AS
SELECT 
    sce.exception_id,
    sce.exception_type,
    sce.severity_score,
    ci.package_description,
    ci.dimension_meters
FROM Supply_Chain_Exceptions sce
INNER JOIN Cargo_Incidents ci ON sce.incident_item_id = ci.incident_item_id
WHERE sce.exception_type = 'Route Collision';

SELECT * FROM High_Severity_Logistics_Dashboard;
DROP VIEW IF EXISTS High_Severity_Logistics_Dashboard;

-- =========================================================================
-- PROCEDURAL & COMPLEX SQL ARCHITECTURE
-- =========================================================================

-- INDEX DELETION AUDIT KEYS
CREATE INDEX idx_reported_date ON Supply_Chain_Exceptions (reported_date);
CREATE UNIQUE INDEX idx_unique_region_name ON Regional_Hubs (region_name);
ALTER TABLE Supply_Chain_Exceptions DROP INDEX idx_reported_date;

-- INNER SUBQUERY: Identifying damaged items exceeding standard aggregate weights
SELECT incident_item_id, package_description, weight_kg
FROM Cargo_Incidents
WHERE weight_kg > (
    SELECT AVG(weight_kg) 
    FROM Cargo_Incidents
);

-- CORRELATED SUBQUERY: Isolation of Outlier damage records based on structural distribution means
SELECT 
    outer_c.incident_item_id, 
    outer_c.package_description, 
    outer_c.dimension_meters, 
    outer_c.originating_asset_id
FROM Cargo_Incidents outer_c
WHERE outer_c.dimension_meters > (
    SELECT AVG(inner_c.dimension_meters) 
    FROM Cargo_Incidents inner_c
    WHERE inner_c.originating_asset_id = outer_c.originating_asset_id
);

-- REUSABLE CALCULATED STORED FUNCTION
DELIMITER //

CREATE FUNCTION GetLogisticsRiskTier(cargo_weight DECIMAL(8,2)) 
RETURNS VARCHAR(20)
DETERMINISTIC 
BEGIN
    DECLARE risk_tier VARCHAR(20); 
    
    IF cargo_weight >= 20.00 THEN
        SET risk_tier = 'High Liability';
    ELSEIF cargo_weight >= 5.00 AND cargo_weight < 20.00 THEN
        SET risk_tier = 'Moderate Liability';
    ELSE
        SET risk_tier = 'Negligible Liability';
    END IF;
    
    RETURN risk_tier;
END //

DELIMITER ;

-- Stored Function Test Execution
SELECT package_description, weight_kg, GetLogisticsRiskTier(weight_kg) AS processing_threat_tier
FROM Cargo_Incidents;

-- STORED ENCAPSULATED REUSABLE AUTOMATION PIPELINE (STORED PROCEDURE)
DELIMITER //

CREATE PROCEDURE UpdateIncidentTelemetry(
    IN p_incident_id INT,
    IN p_new_dimension DECIMAL(5,2),
    IN p_new_weight DECIMAL(8,2),       
    OUT p_risk_assessment VARCHAR(20)   
)
BEGIN
    UPDATE Cargo_Incidents 
    SET dimension_meters = p_new_dimension, 
        weight_kg = p_new_weight
    WHERE incident_item_id = p_incident_id;
    
    SET p_risk_assessment = GetLogisticsRiskTier(p_new_weight);
END //

DELIMITER ;

-- Execution & Test validation workflow on Stored Procedure
SET @out_assessment_tier = '';
CALL UpdateIncidentTelemetry(1, 0.45, 25.50, @out_assessment_tier);
SELECT @out_assessment_tier AS finalized_liability_tier;

-- AUTOMATED TELEMETRY PIPELINE INTERCEPTOR (TRIGGER ENGINE)
DELIMITER //

CREATE TRIGGER After_Critical_Cargo_Anomaly_Insert
AFTER INSERT ON Cargo_Incidents
FOR EACH ROW                                               
BEGIN
    -- Evaluate if newly registered item breaches massive structural liability parameters
    IF NEW.weight_kg >= 20.00 THEN
        INSERT INTO Supply_Chain_Exceptions (incident_item_id, exception_type, reported_date, severity_score)
        VALUES (
            NEW.incident_item_id, 
            'Automated High-Mass Alert', 
            CURDATE(), 
            9 
        );
    END IF;
END //

DELIMITER ;

-- Test Run to trigger the automated alert framework
INSERT INTO Cargo_Incidents (package_description, dimension_meters, weight_kg, originating_asset_id) 
VALUES ('Massive Deformed Chassis Rail Section', 4.20, 65.00, 1);

-- Verify that the trigger instantly fired and wrote an entry to Supply_Chain_Exceptions
SELECT * FROM Supply_Chain_Exceptions WHERE exception_type = 'Automated High-Mass Alert';
