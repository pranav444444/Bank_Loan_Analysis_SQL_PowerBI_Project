create database bank_loan_db;

-- Step 2: Select the database to use for all subsequent commands.
USE bank_loan_db;

-- Step 3: Drop the table if it already exists. 
-- This ensures we start with a fresh, clean table every time.
DROP TABLE IF EXISTS loan_data;

-- Step 4: Create the main table with corrected data types.
CREATE TABLE loan_data (
    id INT NOT NULL,
    address_state VARCHAR(50),
    application_type VARCHAR(50),
    emp_length VARCHAR(50),
    emp_title VARCHAR(100), -- Set to 100 characters as requested
    grade VARCHAR(50),
    home_ownership VARCHAR(50),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(50),
    next_payment_date DATE,
    member_id INT,
    purpose VARCHAR(50),
    sub_grade VARCHAR(50),
    term VARCHAR(50),
    verification_status VARCHAR(50),
    annual_income DOUBLE,
    dti DOUBLE,
    installment DOUBLE,
    int_rate DOUBLE,
    loan_amount INT,
    total_acc INT,
    total_payment INT,
    PRIMARY KEY (id)
);

-- Step 5: Enable the local infile setting to allow data loading.
-- This command is necessary for the LOAD DATA command to work.
SET GLOBAL local_infile = 1;

-- Step 6: Load the data from your CSV file.
-- This command reads your CSV, handles the DD-MM-YYYY date format, and inserts the data.
-- !!! IMPORTANT: UPDATE THE FILE PATH BELOW TO YOUR CSV FILE'S LOCATION !!!
LOAD DATA LOCAL INFILE "D:\\BANK_LOAN_ANANLYSIS_SQL_POWERBI_PROJECT\\financial_loan.csv" -- <-- UPDATE THIS PATH
INTO TABLE loan_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id, address_state, application_type, emp_length, emp_title, grade, home_ownership, @issue_date, @last_credit_pull_date, @last_payment_date, loan_status, @next_payment_date, member_id, purpose, sub_grade, term, verification_status, annual_income, dti, installment, int_rate, loan_amount, total_acc, total_payment)
SET
issue_date = STR_TO_DATE(@issue_date, '%d-%m-%Y'),
last_credit_pull_date = STR_TO_DATE(@last_credit_pull_date, '%d-%m-%Y'),
last_payment_date = STR_TO_DATE(@last_payment_date, '%d-%m-%Y'),
next_payment_date = STR_TO_DATE(@next_payment_date, '%d-%m-%Y');


-- Step 7: Verify the data has been loaded correctly.
-- This query will show you the total number of rows imported.
SELECT COUNT(*) AS total_rows_imported FROM loan_data;

-- This query will show you the first 10 rows to visually inspect the data.
SELECT * FROM loan_data LIMIT 10;

-- 1)total loan applivations
SELECT 
    COUNT(id) AS total_loan_applications
FROM
    loan_data;
-- 2)MTD loan applications (loan applications in latest month)
SELECT 
    COUNT(id) AS MTD_total_loan_applications
FROM
    loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021;
        
--  3)PMTD loan applications comparisions of loan application in current month and previous month(has it increased or decreased)
-- here we will see applications in november
SELECT 
    COUNT(id) AS PMTD_total_loan_applications
FROM
    loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021;

-- Total Funded Amount ( loan amount)

SELECT 
    SUM(loan_amount) AS Total_Funded_Amount
FROM
    loan_data;

-- MTD Total Funded Amount
SELECT 
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM
    loan_data
WHERE
    MONTH(issue_date) = 12 and year(issue_date)=2021;
    
-- PMTD Total Funded Amount
SELECT 
    SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM
    loan_data
WHERE
    MONTH(issue_date) = 11 and year(issue_date)=2021;
    
-- Total Amount Received
SELECT 
    SUM(total_payment) AS Total_Amount_Received
FROM
    loan_data;

-- MTD Total Amount Received (december latest month)
SELECT 
    SUM(total_payment) AS MTD_Total_Amount_Received
FROM
    loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021;

-- PMTD Total Amount Received
SELECT 
    SUM(total_payment) AS PMTD_Total_Amount_Received
FROM
    loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021;

-- Average Interest Rate
select round(avg(int_rate*100),2) as Avg_Interest_Rate from loan_data ;

-- MTD Average Interest Rate (latest month december)
SELECT 
    ROUND(AVG(int_rate * 100), 2) AS MTD_Avg_Interest_Rate
FROM
    loan_data
WHERE
    MONTH(issue_date) = 12
        AND YEAR(issue_date) = 2021;

-- PMTD Average Interest Rate (last/previous month of december i.e, november)
SELECT 
    ROUND(AVG(int_rate * 100), 2) AS PMTD_Avg_Interest_Rate
FROM
    loan_data
WHERE
    MONTH(issue_date) = 11
        AND YEAR(issue_date) = 2021;








 