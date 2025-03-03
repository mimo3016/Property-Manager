/*Student Name : Mohamed Ibrahim Khoualed */
/*Section 1 : Create Tables */



CREATE TABLE addp357PropertyOwners (
    OwnerID INT PRIMARY KEY,
    OwnerName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15)
);




CREATE TABLE addp357Properties (
    PropertyID INT PRIMARY KEY,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(50),
    Postcode VARCHAR(10),
    OwnerID INT,
    PurchasePrice DECIMAL(15, 2),
    CurrencySymbol VARCHAR(3),
    PurchaseDate DATE,
    FOREIGN KEY (OwnerID) REFERENCES addp357PropertyOwners(OwnerID)
);



CREATE TABLE addp357Tenants (
    TenantID INT PRIMARY KEY,
    TenantName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100),
    PropertyID INT,
    LeaseStartDate DATE,
    LeaseEndDate DATE,
    FOREIGN KEY (PropertyID) REFERENCES addp357Properties(PropertyID)
);



CREATE TABLE addp357MaintenanceRequests (
    RequestID INT PRIMARY KEY,
    PropertyID INT,
    TenantID INT,
    RequestDate DATE,
    Description TEXT,
    Status VARCHAR(20),
    FOREIGN KEY (PropertyID) REFERENCES addp357Properties(PropertyID),
    FOREIGN KEY (TenantID) REFERENCES addp357Tenants(TenantID)
);



CREATE TABLE addp357Agents (
    AgentID INT PRIMARY KEY,
    AgentName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15),
    CommissionRate DECIMAL(5, 2)
);



CREATE TABLE addp357PropertyListings (
    ListingID INT PRIMARY KEY,
    PropertyID INT,
    AgentID INT,
    ListingDate DATE,
    ListingPrice DECIMAL(15, 2),
    Currency VARCHAR(3),
    FOREIGN KEY (PropertyID) REFERENCES addp357Properties(PropertyID),
    FOREIGN KEY (AgentID) REFERENCES addp357Agents(AgentID)
);





/* SECTION 2 - INSERT STATEMENTS */


INSERT INTO addp357PropertyOwners
VALUES
(1, 'John Kinidy', '123-456-7890'),
(3, 'Michael Jordan', '555-123-4567'),
(4, 'Riyad Mahrez', '789-456-1230'),
(7, 'Brian Muller', '777-888-9999'),
(8, 'Stingo Reebok', '333-222-1111'),
(10, 'Sophia Dixon', '666-555-4444'),
(11, 'Eren Jeager', '222-333-4444');



INSERT INTO addp357Properties 
VALUES
(111, '123 Main St', 'Cityville', 'SW1A 1AA', 7, 2500.00, '£', '2023-01-15'),
(222, '456 Oak Ave', 'Townburg', 'EC1A 1BB', 4, 3500.00, '£', '2022-05-20'),
(333, '789 Pine Rd', 'Villagetown', 'W1A 1AA', 3, 3000.00, '£', '2022-11-10'),
(444, '101 Elm St', 'Hamletville', 'WC1A 1BB', 4, 2800.00, '£', '2023-03-05'),
(555, '202 Maple Ave', 'Countryside', 'E1 7AA', 1, 4000.00, '£', '2022-08-12'),
(666, '303 Birch Ln', 'Suburbia', 'SW17 7EG', 1, 3200.00, '£', '2023-02-28'),
(777, '404 Cedar Ct', 'Townsville', 'EC2A 2AA', 8, 3700.00, '£', '2022-06-15'),
(888, '505 Redwood Dr', 'Ruralville', 'SE1 7AA', 11, 2600.00, '£', '2023-01-01'),
(999, '606 Sycamore Blvd', 'Meadowland', 'W1A 2AA', 4, 3300.00, '£', '2022-12-20'),
(100, '707 Oakwood Dr', 'Uptown', 'SW19 1AA', 8, 4200.00, '£', '2022-09-10'),
(101, '808 Pinecrest Rd', 'Downtown', 'NW1 1AA', 11, 2900.00, '£', '2023-04-15'),
(122, '909 Maplewood Ave', 'Hometown', 'N1 9AA', 10, 3800.00, '£', '2022-07-01');



INSERT INTO addp357Tenants
VALUES
(1000, 'Alice Johnson', 'alice.j@example.com', 444, '2022-01-15', '2025-08-25'),
(2000, 'Bob Smith', 'bob.smith@example.com', 555, '2022-05-20', '2029-01-26'),
(3000, 'Charlie Brown', 'charlie.b@example.com', 999, '2022-11-10', '2024-02-20'),
(4000, 'David Miller', 'david.m@example.com', 111, '2023-03-05', '2026-07-14'),
(5000, 'Emma Wilson', 'emma.w@example.com', 222, '2022-08-12', '2024-09-18'),
(6000, 'Frank Jones', 'frank.j@example.com', 777, '2023-02-28', '2030-06-30'),
(7000, 'Grace Clark', 'grace.c@example.com', 101, '2022-06-15', '2027-04-09'),
(8000, 'Henry Moore', 'henry.m@example.com', 666, '2023-01-01', '2028-12-10'),
(9000, 'Ivy Taylor', 'ivy.t@example.com', 122, '2022-12-20', '2032-07-25'),
(1001, 'Jack Williams', 'jack.w@example.com', 333, '2022-09-10', '2025-03-04'),
(1100, 'Katherine Brown', 'katherine.b@example.com', 888, '2023-04-15', '2024-12-12'),
(1200, 'Leo Thomas', 'leo.t@example.com', 100, '2022-07-01', '2029-07-01');




INSERT INTO addp357MaintenanceRequests 
VALUES
(105, 111, 2000, '2022-01-15', 'Leaky faucet', 'Pending'),
(110, 222, 4000, '2022-05-20', 'Broken window','In Progress'),
(115, 333, 6000, '2022-11-10', 'Heating issue','Pending'),
(120, 444, 1000, '2023-03-05', 'Clogged drain','Completed'),
(125, 555, 1001, '2022-08-12', 'Electrical problem','In Progress'),
(130, 666, 5000, '2023-02-28', 'Roof leak','Pending'),
(135, 777, 3000, '2022-06-15', 'Appliance repair', 'Completed'),
(140, 888, 7000, '2023-01-01', 'Lock replacement','In Progress'),
(145, 999, 8000, '2022-12-20', 'Painting request','Pending'),
(150, 100, 1100, '2022-09-10', 'Flooring repair','Completed'),
(155, 101, 1200, '2023-04-15', 'Plumbing issue','Pending'),
(160, 122, 9000, '2022-07-01', 'Pest control','In Progress');





INSERT INTO addp357Agents
VALUES
(15, 'Oliver Jones', '123-456-7890', 2.5),
(20, 'Sophia Davis', '234-567-8901', 3.0),
(25, 'William White', '345-678-9012', 2.8),
(45, 'Liam Anderson', '789-012-3456', 2.6),
(65, 'Ethan Taylor', '123-456-7890', 2.4),
(70, 'Isabella Smith', '234-567-8901', 3.4);






INSERT INTO addp357PropertyListings 
VALUES
(331, 101, 15, '2022-01-15', 300000.00, 'GBP'),
(332, 222, 20, '2022-05-20', 400000.00, 'GBP'),
(223, 333, 25, '2022-11-10', 350000.00, 'GBP'),
(334, 444, 65, '2023-03-05', 330000.00, 'GBP'),
(335, 555, 65, '2022-08-12', 450000.00, 'GBP'),
(336, 666, 45, '2023-02-28', 380000.00, 'GBP'),
(337, 777, 20, '2022-06-15', 420000.00, 'GBP'),
(338, 888, 70, '2023-01-01', 310000.00, 'GBP'),
(339, 999, 65, '2022-12-20', 390000.00, 'GBP'),
(310, 100, 70, '2022-09-10', 480000.00, 'GBP'),
(311, 111, 65, '2023-04-15', 340000.00, 'GBP'),
(312, 122, 15, '2022-07-01', 440000.00, 'GBP');




/* SECTION 3 - UPDATE STATEMENTS */

/* 1 */
UPDATE addp357MaintenanceRequests
SET Status = 'Completed'
WHERE RequestID = 105;

/* 2 */
UPDATE addp357Agents
SET CommissionRate = 3.8
WHERE AgentID = 15;




/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS */



/* 1) List the properties owned by OwnerID 4  */
SELECT *
FROM addp357Properties
WHERE OwnerID = 4;


/* 2) List the properties with a purchase price higher than £300,000. */
SELECT *
FROM addp357Properties
WHERE PurchasePrice > 3000.00;

/* 3) List the tenants with lease end dates in 2024. */
SELECT *
FROM addp357Tenants
WHERE YEAR(LeaseEndDate) = 2024;


/* 4) List the maintenance request that are still on pending */
SELECT *
FROM addp357MaintenanceRequests
WHERE Status = 'Pending';


/* 5) List the agents with a commission rate greater than 3.0. */
SELECT *
FROM addp357Agents
WHERE CommissionRate > 3.0;


/* 6) List all properties listed by AgentID 65 */
SELECT *
FROM addp357PropertyListings
WHERE AgentID = 65;








/* SECTION 5 MULTIPLE TABLE SELECT StATEMENTS */




/* 1) List the properties in 'Cityville' along with their tenants' names. */
SELECT p.PropertyID, p.Address, p.City, t.TenantName
FROM addp357Properties p
JOIN addp357Tenants t ON p.PropertyID = t.PropertyID
WHERE p.City = 'Cityville';




/* 2) Show the maintenance requests , including the tenant names and their corresponding properties. */
SELECT r.RequestID, r.Description, r.RequestDate, r.Status, t.TenantName, p.Address
FROM addp357MaintenanceRequests r
JOIN addp357Tenants t ON r.TenantID = t.TenantID
JOIN addp357Properties p ON r.PropertyID = p.PropertyID;



/* 3) Show the total amount of commission earned by each agent.*/
SELECT a.AgentID, a.AgentName, SUM(pl.ListingPrice * (a.CommissionRate / 100)) AS TotalCommission
FROM addp357Agents a
JOIN addp357PropertyListings pl ON a.AgentID = pl.AgentID
GROUP BY a.AgentID, a.AgentName;




/* 4) Find properties owned by 'Riyad Mahrez' and list the tenants residing in those properties. */ 
SELECT o.OwnerName, p.PropertyID, p.Address, t.TenantName
FROM addp357PropertyOwners o
JOIN addp357Properties p ON o.OwnerID = p.OwnerID
LEFT JOIN addp357Tenants t ON p.PropertyID = t.PropertyID
WHERE o.OwnerName = 'Riyad Mahrez';


/* 5) Show agents who have listings with a price higher than the average listing price. */
SELECT a.AgentID, a.AgentName, AVG(pl.ListingPrice) AS AvgListingPrice
FROM addp357Agents a
JOIN addp357PropertyListings pl ON a.AgentID = pl.AgentID
GROUP BY a.AgentID, a.AgentName
HAVING MAX(pl.ListingPrice) > AvgListingPrice;



/* 6) Find properties where the lease is ending soon(3 months), along with the tenant details. */
SELECT p.PropertyID, p.Address, t.TenantName, t.LeaseEndDate
FROM addp357Properties p
JOIN addp357Tenants t ON p.PropertyID = t.PropertyID
WHERE t.LeaseEndDate BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL 3 MONTH);
