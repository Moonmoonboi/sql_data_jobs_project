/* 
Question: What are the top paying skills?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? Reveals how different skills impact salary levels for Data Analysts and helps identify 
	the most financially rewarding skills to acquire or improve.
*/

WITH skills_demand AS (
    SELECT 
        CAST(sd.skills AS NVARCHAR(225)) AS skills,
        COUNT(s.job_id) AS demand_count,
        s.skill_id
    FROM job_postings_fact j
    INNER JOIN skills_job_dim s ON j.job_id = s.job_id
    INNER JOIN skills_dim sd ON sd.skill_id = s.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_work_from_home = 'TRUE'
        AND salary_year_avg IS NOT NULL
    GROUP BY s.skill_id, CAST(sd.skills AS NVARCHAR(225))
),
average_salary AS (
    SELECT 
        CAST(sd.skills AS NVARCHAR(225)) AS skills,
        ROUND(AVG(CAST(salary_year_avg AS FLOAT)), 0) AS avg_salary,
        s.skill_id
    FROM job_postings_fact j
    INNER JOIN skills_job_dim s ON j.job_id = s.job_id
    INNER JOIN skills_dim sd ON sd.skill_id = s.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY s.skill_id, CAST(sd.skills AS NVARCHAR(225))
)
SELECT TOP 25
    d.skill_id,
    d.skills,
    d.demand_count,
    a.avg_salary
FROM skills_demand d
INNER JOIN average_salary a ON d.skill_id = a.skill_id
WHERE demand_count>10
ORDER BY demand_count DESC, avg_salary DESC
/*
Result:
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": 398,
    "avg_salary": 96435.0
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": 256,
    "avg_salary": 86419.0
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": 236,
    "avg_salary": 101512.0
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": 230,
    "avg_salary": 97978.0
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": 148,
    "avg_salary": 98708.0
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": 110,
    "avg_salary": 92324.0
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": 63,
    "avg_salary": 93707.0
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": 63,
    "avg_salary": 93707.0
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": 58,
    "avg_salary": 88316.0
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": 49,
    "avg_salary": 103855.0
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": 48,
    "avg_salary": 82941.0
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": 37,
    "avg_salary": 111578.0
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": 37,
    "avg_salary": 100964.0
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": 35,
    "avg_salary": 96191.0
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": 34,
    "avg_salary": 105400.0
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": 32,
    "avg_salary": 106440.0
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": 32,
    "avg_salary": 84130.0
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": 28,
    "avg_salary": 98020.0
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": 27,
    "avg_salary": 97267.0
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": 24,
    "avg_salary": 93845.0
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": 24,
    "avg_salary": 85293.0
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": 22,
    "avg_salary": 110888.0
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": 20,
    "avg_salary": 107931.0
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": 20,
    "avg_salary": 91805.0
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_count": 18,
    "avg_salary": 89027.0
  }
  SQL, Python, Tableau, and R are the clear priority — they're the only skills that 
  combine genuinely high demand (all in the top 4 by postings) with above-median pay. 
  If you're sequencing what to learn first, this quadrant is the safest bet: 
  broadly useful and not a pay compromise.

Snowflake, Looker, and Oracle are worth calling out specifically: their demand is right a
round the median (37, 49, and 37 postings), but they carry some of the highest average 
salaries on the whole list — Snowflake at $111,578 is the single highest figure here. 
That reads as a genuine "worth learning as a differentiator" signal, distinct from the 
SVN-style outlier risk we flagged in the last file, since these numbers are grounded 
in a reasonable number of postings, not one or two.

Excel, Power BI, PowerPoint, and Word sit in the high-demand-but-lower-pay corner 
— expected baseline software literacy that most analyst postings assume, but not 
something that differentiates pay on its own. Worth having, not worth over-investing 
in past a baseline.
*/
