Select 
	Laon.LoanID AS Loan_Number,
	Loan.LoanStatusID AS Loan_Status_ID,
	Loan.LoanTypeId AS Loan_Type_ID,
	Customer.CustomerName AS Customer_Name,
	Customer.CustomerRoleTypeId AS Customer_Role_Type_ID,
	Customer.CustomerRoleTypeText AS Customer_Role_Type_Text,
	Loan_Sales_Relation.FICOScore AS FICO_Score
	
FROM 
	Loan Loan
	Left join Loan_Customer_Relation Loan_Customer_Relation
	ON Loan.LoanSkey = Loan_Customer_Relation.LoanSkey
	Left join Customer Customer
	ON Loan_Customer_Relation.CustomerSkey = Customer.CustomerSkey
	Left Join Loan_Sales_Relation Loan_Sales_Relation
	ON Loan.LoanSkey = Loan_Sales_Relation.LoanSkey
Where Loan_Customer_Relation.CustomerRoleTypeId IN ('P100', 'P400')
AND Loan.LoanStatusId IN ('702','803')
AND LoanTypeId IN ('100','200','300')
AND 
(
(Loan_Sales_Relation.FICOScore <> 0 
AND Loan_Sales_Relation.FICOScore < 200 
AND Loan_Sales_Relation.FICOScore > 800)
OR
Loan_Sales_Relation.FICOScore IS NULL
)
GROUP BY
	Laon.LoanID,
	Loan.LoanStatusID,
	Loan.LoanTypeId,
	Customer.CustomerName,
	Customer.CustomerRoleTypeId,
	Customer.CustomerRoleTypeText,
	Loan_Sales_Relation.FICOScore