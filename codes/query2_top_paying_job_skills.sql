/* 
Question: What are the skills required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? IT provides a detailed look at which high-paying jobs demand certain skills,
	helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
	SELECT TOP 10
	job_id,
	job_title,
	salary_year_avg,
	name AS company_name
	FROM job_postings_fact f
	LEFT JOIN company_dim d
	ON f.company_id= d.company_id
	WHERE CAST(job_title_short AS nvarchar(25))= 'Data Analyst' 
	AND CAST(job_location AS nvarchar(25))= 'Anywhere' 
	AND salary_year_avg IS NOT NULL
	ORDER BY salary_year_avg DESC
	)
SELECT t.*,
skills
FROM top_paying_jobs t
INNER JOIN skills_job_dim s
ON t.job_id = s.job_id
INNER JOIN skills_dim sd
ON sd.skill_id= s.skill_id
ORDER BY salary_year_avg DESC

/* SQL is the one non-negotiable as it shows up in all 8 postings, 
from the $184K ERM Data Analyst role up to the $255,830 Associate Director role at AT&T.
Python is nearly as universal, appearing in 7 of 8, which together with SQL forms the 
baseline pair employers expect across every seniority level in this set.

Tableau is the clear default for visualization here, showing up in 75% of postings 
versus Power BI's 25% which is worth knowing if you're deciding which BI tool to prioritize learning first.

The single most tool-heavy posting is also the highest-paid: AT&T's Associate Director role
lists 13 distinct skills spanning cloud platforms (Azure, AWS, Databricks), 
the Python data-science stack (pandas, PySpark, Jupyter), and reporting tools 
(Excel, Tableau, Power BI, PowerPoint). That breadth and not just SQL/Python depth 
tracks with the jump from "analyst" to "director" level titles in this data.

Cloud and dev-collaboration tools (Snowflake, AWS, Azure, Jira, Confluence, Bitbucket) cluster in 
postings that read as more engineering-adjacent such as the Director and Principal AV Performance Analyst roles 
rather than appearing broadly across all 8. If a posting mentions Git, Jira, or Confluence,
it's likely describing a more cross-functional, engineering-integrated analyst role rather than a 
traditional reporting-focused one.
*/
