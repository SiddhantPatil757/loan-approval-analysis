create database projectdb;
use projectdb;
select * from loan_data;

-- Loan_Approval_status 
select loan_approval_status, count(*) as total
from loan_data
group by loan_approval_status;


-- 2. CIBIL Score vs Approval
SELECT 
    Risk_Category,
    loan_approval_status,
    COUNT(*) AS total
FROM (
    SELECT 
        CASE 
            WHEN CIBIL_Score >= 750 THEN 'Low Risk'
            WHEN CIBIL_Score >= 650 THEN 'Medium Risk'
            ELSE 'High Risk'
        END AS Risk_Category,
        loan_approval_status
    FROM loan_data
) AS sub
GROUP BY Risk_Category, loan_approval_status;


-- 3. Previous Default vs Approval
SELECT Previous_Default, loan_approval_status, COUNT(*) 
FROM loan_data
GROUP BY Previous_Default, loan_approval_status;

-- 4. Income vs Loan Amount (Average)
SELECT 
    AVG(annual_Income) AS avg_income,
    AVG(Loan_Amount) AS avg_loan
FROM loan_data;

-- 5. Rejection Reasons
SELECT Rejection_Reason, COUNT(*) 
FROM loan_data
WHERE Loan_Approval_Status = 'Rejected'
GROUP BY Rejection_Reason
ORDER BY COUNT(*) DESC;

-- 6. Loan Approval by Lender Type
SELECT Lender_Type, Loan_approval_Status, COUNT(*) 
FROM loan_data
GROUP BY Lender_Type, Loan_approval_Status;

SELECT *,
       (Loan_Amount /annual_Income) AS LTI
FROM loan_data;
select * from loan_data;
