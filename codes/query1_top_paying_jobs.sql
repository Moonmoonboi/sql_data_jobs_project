/* Question : what are the top-paying data analyst jobs?
- Identofy the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
Why? Highlight the top-paying opportunities for Data Analysys offering insights into employment opportunites.
*/
SELECT TOP 10
job_id,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date,
name AS company_name
FROM job_postings_fact f
LEFT JOIN company_dim d
ON f.company_id= d.company_id
WHERE CAST(job_title_short AS nvarchar(25))= 'Data Analyst' 
AND CAST(job_location AS nvarchar(25))= 'Anywhere' 
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
