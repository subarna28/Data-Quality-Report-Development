# Data-Quality-Report-Development

## Overview: 

The project is a financial institutional project with the goal of better understanding of data quality for different business lines. Different profiling rules (null checks, duplicate checks, data type validation, referential integrity) are implemented.

## Tech Stack: 
-	SQL
-	Databricks (dev,qa and prod environment)
-	PowerBI
-	Azure Devops
-	PySpark
-	
## Objectives:

•	Perform data profiling to detect anomalies in financial institution.

•	Define data quality rules (missing values, duplicates, invalid/violation).

•	Implement data cleansing techniques.

•	Visualize data quality scorecard and trends in Power BI.


## Process Flow of Scorecard Development:

![Image](https://github.com/user-attachments/assets/bcd818fb-b930-444e-a9a0-627dcf1a59b8)

 
## Data Quality Scorecard Developing Steps

•	Business line requests for developing a new report or adding a new profiling rule to the existing report. Then following steps can be done to create a new rule/new scorecard for data quality profiling.

•	Upon receiving the request, sql query is prepared and tested against prod data in Databricks using spark SQL.

•	If the total number of records and violation looks good, then it’s recommended to show the result to business user. 

•	If they agree with the result, then create a local branch in databricks based on ‘dev’ branch for development purpose. The query then incorporated into the appropriate DDL scripts to create the views in Databricks.

•	Run the notebook in databricks which creates appropriate score and history table.

•	Push the code to Dev. Create a pull request in Azure DevOps to pull the codes in QA branch.

•	If the testing is successful in QA, create a Change Request (CR), get approval and push the code to ‘Production’ branch.

•	Run the code in production branch, create the pbix file. Connect appropriate score and history tables according to the view and publish to PowerBI.


## Sample Data Fields

## Table 1
 
<img width="381" alt="Image" src="https://github.com/user-attachments/assets/628b4aeb-88ba-4f23-8dd7-c19d473ec146" />



## Table 2

<img width="225" alt="Image" src="https://github.com/user-attachments/assets/279df062-377c-4da1-bca5-a22dcbda69b9" />


## Table 3
 
<img width="344" alt="Image" src="https://github.com/user-attachments/assets/d35c7331-d503-49f9-8ab9-d0774f9b6f33" />


## Table 4
 
<img width="126" alt="Image" src="https://github.com/user-attachments/assets/fda5bcef-eb94-47f1-b17c-3164ed1f943d" />

## Sample Data profiling using SQL

The requirement of business line is to find out the customer/loan whose FICO Score is not between 200 and 800 and FICO score is blank.

## SQL Code

<img width="448" alt="Image" src="https://github.com/user-attachments/assets/48c7054a-2715-4c28-8bf0-ea833042c3bd" />


## PowerBI Dashboard:

The above sql query will find out the loan/customer whose Credit Score is violating the rule. The dashboard can be built which shows the total number of records, total number of violations, trend and drilldown data to see the violation details.

## Sample PowerBI dashboard will look like as follows:
 
![Image](https://github.com/user-attachments/assets/ce457841-0210-4562-a7a3-4855eb7996cf)


## Data Cleansing in Source System:

Once the report is published in PBI, then business can fix the data in the source system like SAP or other source systems.
