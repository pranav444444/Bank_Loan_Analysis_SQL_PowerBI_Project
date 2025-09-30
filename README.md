# Bank Loan Performance Analysis & Risk Assessment
**Project Overview**
This is an end-to-end data analysis project focused on a bank's loan portfolio. The primary goal was to transform over 38,000 raw financial records into a clear, interactive, and actionable Power BI dashboard. The project provides deep insights into key performance indicators (KPIs), customer segmentation, and financial risk, enabling data-driven decision-making.

The entire workflow, from data preparation in MySQL to advanced DAX calculations and final visualization in Power BI, follows industry best practices for accuracy, performance, and user experience.

Live Dashboard Showcase 📊
Below is an animated demonstration of the final 3-page interactive report, showcasing its dynamic filtering and navigation capabilities.

(This is where you will place your animated GIF. Upload the GIF to your images folder and update the link below.)

**Technical Stack**
Database: MySQL

Data Validation & ETL: SQL

Data Modeling & Analysis: DAX

Visualization: Power BI

**Methodology & Workflow**
Data Preparation and Validation (MySQL):

Staged and cleaned the raw CSV data (38,000+ records) in a MySQL database.

Wrote and executed over 25 SQL queries to pre-calculate and validate all KPIs against the source data, ensuring the Power BI report's accuracy. This "Query Doc" serves as the single source of truth.

Handled on-the-fly data transformations during import, such as converting date formats using STR_TO_DATE().

Data Modeling (Power BI):

Built a robust Star Schema data model with a dedicated and continuous Date Table (CALENDARAUTO()) to enable powerful time intelligence analysis.

Established and configured a correct One-to-Many relationship with a single cross-filter direction, following best practices.

Calculation and Analysis (DAX):

Authored over 30 DAX measures in a dedicated _Key Measures table to calculate core KPIs.

Developed robust, context-proof formulas for time intelligence (MTD, MoM growth) using the safe DIVIDE function.

Used CALCULATE to segment the portfolio into 'Good' vs. 'Bad' loan categories for risk and profitability analysis.

Visualization and Reporting (Power BI):

Designed a 3-page interactive report (Summary, Overview, Details).

Implemented a Field Parameter to allow users to dynamically switch the metric displayed in all charts on the Overview dashboard.

Enabled full cross-filtering across all visuals using "Edit Interactions."

Integrated a page navigator button panel for seamless user experience (UX).

**Key Insights & Actionable Recommendations**
1. The Financial Impact of Risk
Insight: The analysis revealed a significant financial risk within the portfolio. While the 'Good Loan' segment is highly profitable (generating a $65.5M+ profit), the 'Bad Loan' segment resulted in a net loss of over $28.2 million.

Recommendation: Prioritize a deep-dive analysis on the 5,333 'Charged Off' loans to identify common characteristics of defaulting borrowers and refine the bank's loan approval criteria.

2. Primary Customer Motivation & Key Segments
Insight: The overwhelming majority of loans (18K+ applications) are for "Debt Consolidation."

Insight: Borrowers with '10+ years' of employment history and those with a 'Mortgage' represent the largest and most financially significant customer segments.

Recommendation: Focus marketing campaigns on the benefits of debt consolidation and develop targeted strategies for high-value customer profiles to maximize return on investment.

**Dashboard Screenshots**
Summary Dashboard

<img width="1200" height="674" alt="image" src="https://github.com/user-attachments/assets/92f6a29f-1e02-4657-9d66-f2925f4cf70f" />

Overview Dashboard  

<img width="1200" height="674" alt="image" src="https://github.com/user-attachments/assets/33880ca5-abd4-493c-947e-66e10a067981" />

Details Dashboard

<img width="1200" height="674" alt="image" src="https://github.com/user-attachments/assets/14f1adb7-af10-4322-9a57-78ff35f60550" />

**Project Files**
This repository is organized to showcase the complete end-to-end workflow.

Bank_Loan_Analysis_Dashboard.pbix: The main Power BI project file. Download and open in Power BI Desktop to explore the full interactive report.

Bank_Loan_Analysis_Report-Pranav_Patel.pdf: The final, detailed project report document.

Query_Doc.pdf: The PDF document containing all SQL validation queries and their outputs, proving the accuracy of the dashboard.

bank_loan_sql.sql: The SQL script used to create the table and load the data in MySQL.

financial_loan.csv: The original source data file.

Supporting Docs: Includes documents on "Finance Domain Knowledge" and "Understanding of data Columns."
