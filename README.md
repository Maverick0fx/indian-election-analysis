# Indian General Election Analysis (SQL)

## Tech Stack

- MySQL
- SQL
- Relational Database Analysis
- Common Table Expressions (CTEs)
- Joins
- Aggregate Functions

> SQL-based analytical project developed to analyze the 2024 Indian General Election using relational database techniques, multi-table joins, Common Table Expressions (CTEs), and business-focused SQL reporting.


---

## Business Problem
The 2024 Indian General Election generated a large volume of constituency, candidate, party, and state-level data spread across multiple related tables. Analyzing this information using raw datasets alone makes it difficult to evaluate election outcomes, party performance, and voting trends efficiently.

This project addresses this challenge by using SQL to combine and analyze relational datasets, enabling meaningful insights into election results, seat distribution, vote counts, winning candidates, and party performance across different states.

---

## Solution Overview

The project was completed entirely using SQL within MySQL.

Multiple election datasets were imported, cleaned, and connected using primary and foreign key relationships. SQL queries were then developed to answer analytical questions related to election outcomes, party performance, constituency results, and state-level voting trends.

Advanced SQL techniques including joins, Common Table Expressions (CTEs), aggregate functions, CASE expressions, and grouping operations were used to transform raw election data into meaningful analytical reports.


---

## SQL Analysis

The project was completed entirely using SQL in MySQL to transform raw election datasets into meaningful analytical reports.

SQL was used to:

- Import and prepare multiple election datasets.
- Establish relationships between constituency, party, candidate, and state tables.
- Combine data using multi-table joins.
- Analyze election outcomes across constituencies and states.
- Generate reports on winning candidates, political parties, and vote distribution.
- Build reusable Common Table Expressions (CTEs) for complex analysis.
- Summarize election statistics using aggregate functions and grouped queries.

All SQL queries and their corresponding outputs have been documented and included in this repository.

---

## SQL Techniques Used

Throughout this project, SQL was used for:

- INNER JOIN
- LEFT JOIN
- Common Table Expressions (CTEs)
- Aggregate Functions (COUNT, SUM, MAX)
- GROUP BY Analysis
- ORDER BY
- CASE Expressions
- Aliases
- Multi-table Relational Analysis
- Data Cleaning

  ---

## Analysis Performed

The SQL queries answer a variety of analytical questions, including:

- Total seats won by each political party.
- Winning candidates across constituencies.
- Party performance by state.
- Constituency-level election results.
- State-wise seat distribution.
- Vote count analysis.
- Alliance performance.
- Candidate performance across constituencies.
- Comparative analysis of election outcomes using relational datasets.

---

## Business Impact

This project demonstrates how SQL can be used to transform large relational datasets into meaningful analytical insights.

By combining multiple election datasets and applying advanced SQL techniques, the analysis provides a structured view of election outcomes, political party performance, constituency-level results, and state-wise voting patterns.

The project highlights how relational databases can support large-scale analytical reporting through efficient querying and data relationships.

---

## Key Insights

The SQL analysis enables users to quickly identify:

- Political parties with the highest number of seats won.
- Winning candidates across constituencies.
- State-wise election performance.
- Vote distribution across political parties.
- Alliance performance.
- Constituencies with close election results.
- Overall election trends using relational datasets.

---

## Key Skills Demonstrated

- SQL
- MySQL
- Relational Database Analysis
- Data Cleaning
- INNER JOIN
- LEFT JOIN
- Common Table Expressions (CTEs)
- Aggregate Functions
- CASE Expressions
- GROUP BY Analysis
- Multi-table Querying
- Data Analysis

---

## Repository Contents

- `indian-election-analysis.sql` – SQL queries used for election analysis.
- `indian-election-data-loading.sql` – SQL script for importing and preparing the datasets.
- `election-project-queries.pdf` *(or `.docx`)* – Documented SQL queries with outputs.
- `constituencywise_details.csv`
- `constituencywise_results.csv`
- `partywise_results.csv`
- `statewise_results.csv`
- `states.csv`
- `README.md` – Project documentation.

---

## What I Learned

Through this project, I strengthened my understanding of relational databases by working with multiple connected tables and writing SQL queries to answer complex analytical questions.

I also improved my ability to use joins, Common Table Expressions (CTEs), aggregate functions, and relational database design to generate meaningful reports from real-world datasets.

---

## Future Improvements

Future enhancements may include:

- Developing an interactive Power BI dashboard for election reporting.
- Creating stored procedures for reusable analysis.
- Optimizing complex queries for larger datasets.
- Expanding the analysis with additional election datasets.
- Incorporating trend analysis across multiple election years.

---

## About This Project

This project was developed as part of my SQL learning journey to strengthen my understanding of relational database analysis using a real-world election dataset.

The project demonstrates the complete SQL workflow, including data preparation, relational joins, Common Table Expressions (CTEs), and analytical reporting across multiple connected tables.

While the dataset is publicly available for educational purposes, all SQL development, analysis, and project documentation were completed independently as part of my portfolio.
