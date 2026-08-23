/* 
Question: What are the top paying skills?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? Reveals how different skills impact salary levels for Data Analysts and helps identify 
	the most financially rewarding skills to acquire or improve.
*/
SELECT TOP 25
CAST(skills as nvarchar(225)) AS skills,
ROUND(AVG(CAST(salary_year_avg AS FLOAT)),0) AS avg_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim sd
ON sd.skill_id= s.skill_id
WHERE job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
GROUP BY CAST(skills as nvarchar(225))
ORDER BY avg_salary DESC

/* Here are the top paying skills for data analysts, the top 25 which can provide some quick insights into some trends 
into the top paying jobs
[
  {
    "skills": "svn",
    "avg_salary": 400000.0
  },
  {
    "skills": "solidity",
    "avg_salary": 179000.0
  },
  {
    "skills": "couchbase",
    "avg_salary": 160515.0
  },
  {
    "skills": "datarobot",
    "avg_salary": 155486.0
  },
  {
    "skills": "golang",
    "avg_salary": 155000.0
  },
  {
    "skills": "mxnet",
    "avg_salary": 149000.0
  },
  {
    "skills": "dplyr",
    "avg_salary": 147633.0
  },
  {
    "skills": "vmware",
    "avg_salary": 147500.0
  },
  {
    "skills": "terraform",
    "avg_salary": 146734.0
  },
  {
    "skills": "twilio",
    "avg_salary": 138500.0
  },
  {
    "skills": "gitlab",
    "avg_salary": 134126.0
  },
  {
    "skills": "kafka",
    "avg_salary": 129999.0
  },
  {
    "skills": "puppet",
    "avg_salary": 129820.0
  },
  {
    "skills": "keras",
    "avg_salary": 127013.0
  },
  {
    "skills": "pytorch",
    "avg_salary": 125226.0
  },
  {
    "skills": "perl",
    "avg_salary": 124686.0
  },
  {
    "skills": "ansible",
    "avg_salary": 124370.0
  },
  {
    "skills": "hugging face",
    "avg_salary": 123950.0
  },
  {
    "skills": "tensorflow",
    "avg_salary": 120647.0
  },
  {
    "skills": "cassandra",
    "avg_salary": 118407.0
  },
  {
    "skills": "notion",
    "avg_salary": 118092.0
  },
  {
    "skills": "atlassian",
    "avg_salary": 117966.0
  },
  {
    "skills": "bitbucket",
    "avg_salary": 116712.0
  },
  {
    "skills": "airflow",
    "avg_salary": 116387.0
  },
  {
    "skills": "scala",
    "avg_salary": 115480.0
  }
]
*/
