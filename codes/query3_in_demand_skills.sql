/* Question: What are the most in-demand skills for data analysts?
	- Join job postings to inner join table similar to query 2
	- Identify the top 5 in-demand skills fora data analyst
	- Focus on all job postings
	- Why? Retrieves the top 5 skills with the highest demand in the job market,
		providing insights into the most valuable skills for job seekers.
*/


SELECT TOP 5
CAST(skills as nvarchar(225)) AS skills,
COUNT(s.job_id) AS demand_count
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim sd
ON sd.skill_id= s.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY CAST(skills as nvarchar(225))
ORDER BY demand_count DESC
