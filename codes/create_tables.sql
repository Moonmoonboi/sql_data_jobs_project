/* This file contains the SQL file you run to create the tables accordingly in SQL server
*/

-- Create company_dim table with primary key
CREATE TABLE dbo.company_dim
(
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);

-- Create skills_dim table with primary key
CREATE TABLE dbo.skills_dim
(
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
);

-- Create job_postings_fact table with primary key
CREATE TABLE dbo.job_postings_fact
(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home NVARCHAR(225),
    search_location TEXT,
    job_posted_date datetime,
    job_no_degree_mention NVARCHAR(225),
    job_health_insurance NVARCHAR(225),
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES dbo.company_dim (company_id)
);

-- Create skills_job_dim table with a composite primary key and foreign keys
CREATE TABLE dbo.skills_job_dim
(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES dbo.job_postings_fact (job_id),
    FOREIGN KEY (skill_id) REFERENCES dbo.skills_dim (skill_id)
);
