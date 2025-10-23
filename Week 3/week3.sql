create database dhiksha_bank;
use dhiksha_bank;
create table dhiksha_bank.branch(
Branch_name varchar(30),
Branch_city varchar(25),
assets int,
PRIMARY KEY (Branch_name)
);
create table dhiksha_bank.BankAccount(
Accno int,
Branch_name varchar(30),
Balance int,
PRIMARY KEY(Accno),
foreign key (Branch_name) references branch(Branch_name)
);
create table dhiksha_bank.BankCustomer(
Customername varchar(20),
Customer_street varchar(30),
CustomerCity varchar (35),
PRIMARY KEY(Customername)
);
create table dhiksha_bank.Depositer(
Customername varchar(20),
Accno int,
PRIMARY KEY(Customername,Accno),

foreign key (Accno) references BankAccount(Accno),
foreign key (Customername) references BankCustomer(Customername)
);
create table dhiksha_bank.Loan(
Loan_number int,
Branch_name varchar(30),
Amount int,
PRIMARY KEY(Loan_number),
foreign key (Branch_name) references branch(Branch_name)
);

INSERT INTO branch (Branch_name, Branch_city, assets) VALUES
    ("SBI_Chamrajpet", "Bangalore", 50000),
    ("SBI_ResidencyRoad", "Bangalore", 10000),
    ("SBI_ShivajiRoad", "Bombay", 20000),
    ("SBI_ParlimentRoad", "Delhi", 10000),
    ("SBI_Jantarmantar", "Delhi", 20000);

INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES
    (1, "SBI_Chamrajpet", 2000),
    (2, "SBI_ResidencyRoad", 5000),
    (3, "SBI_ShivajiRoad", 6000),
    (4, "SBI_ParlimentRoad", 9000),
    (5, "SBI_Jantarmantar", 8000),
    (6, "SBI_ShivajiRoad", 4000),
    (8, "SBI_ResidencyRoad", 4000),
    (9, "SBI_ParlimentRoad", 3000),
    (10, "SBI_ResidencyRoad", 5000),
    (11, "SBI_Jantarmantar", 2000);

INSERT INTO BankCustomer (Customername, Customer_street, CustomerCity) VALUES
    ("Avinash", "Bull_Temple_Road", "Bangalore"),
    ("Dinesh", "Bannergatta_Road", "Bangalore"),
    ("Mohan", "NationalCollege_Road", "Bangalore"),
    ("Nikil", "Akbar_Road", "Delhi"),
    ("Ravi", "Prithviraj_Road", "Delhi");

INSERT INTO Depositer (Customername, Accno) VALUES
    ("Avinash", 1),
    ("Dinesh", 2),
    ("Nikil", 4),
    ("Ravi", 5),
    ("Avinash", 8),
    ("Nikil", 9),
    ("Dinesh", 10),
    ("Nikil", 11);

INSERT INTO Loan (Loan_number, Branch_name, Amount) VALUES
    (1, "SBI_Chamrajpet", 1000),
    (2, "SBI_ResidencyRoad", 2000),
    (3, "SBI_ShivajiRoad", 3000),
    (4, "SBI_ParlimentRoad", 4000),
    (5, "SBI_Jantarmantar", 5000);
    
select * from branch;

select * from BankAccount;

select * from BankCustomer;

select * from depositer;

select * from loan;

SELECT Branch_name, CONCAT(assets / 100000, ' lakhs') AS assets_in_lakhs
FROM branch;

SELECT d.Customername 
FROM Depositer d, BankAccount b 
WHERE b.Branch_name = 'SBI_ResidencyRoad' 
  AND d.Accno = b.Accno 
GROUP BY d.Customername 
HAVING COUNT(d.Accno) >= 2;

CREATE VIEW sum_of_loan AS
SELECT Branch_name, SUM(Balance)
FROM BankAccount
GROUP BY Branch_name;
select * from sum_of_loan;

SELECT d.Customername
FROM Depositer d
JOIN BankAccount b ON d.Accno = b.Accno
JOIN branch br ON b.Branch_name = br.Branch_name
WHERE br.Branch_city = 'Delhi'
GROUP BY d.Customername
HAVING COUNT(DISTINCT b.Branch_name) = (SELECT COUNT(*) FROM branch WHERE Branch_city = 'Delhi');

DELETE FROM BankAccount
WHERE Branch_name IN (SELECT Branch_name FROM branch WHERE Branch_city = 'Bombay');

-- Additional queries

select * from loan order by amount desc;

CREATE VIEW BRANCH_TOTAL_LOAN (BRANCH_NAME, TOTAL_LOAN) AS
SELECT BRANCH_NAME, SUM(AMOUNT)
FROM LOAN
GROUP BY BRANCH_NAME;

UPDATE BankAccount
SET Balance = Balance * 1.05;

