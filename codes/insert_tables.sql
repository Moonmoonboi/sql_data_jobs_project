/* This file inserts all the data into the table, run the create_table code first before running this. Take note you need to change
the directory of the file, depending on where it is saved.
*/

BULK INSERT skills_job_dim
FROM 'C:\Users\justi\Downloads\all_folders\csv_files\skills_job_dim.csv'
WITH (
    FORMAT ='csv',
    FIRSTROW = 2,           -- skips the header row (Postgres' HEADER true)
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',-- same as DELIMITER ','
    CODEPAGE = '65001',     -- UTF-8 (same as ENCODING 'UTF8')
    TABLOCK
);
BULK INSERT skills_dim
FROM 'C:\Users\justi\Downloads\all_folders\csv_files\skills_dim.csv'
WITH (
    FORMAT ='csv',
    FIRSTROW = 2,           -- skips the header row (Postgres' HEADER true)
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',-- same as DELIMITER ','
    CODEPAGE = '65001',     -- UTF-8 (same as ENCODING 'UTF8')
    TABLOCK
);

BULK INSERT company_dim
FROM 'C:\Users\justi\Downloads\all_folders\csv_files\company_dim.csv'
WITH (
    FORMAT ='csv',
    FIRSTROW = 2,           -- skips the header row (Postgres' HEADER true)
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',-- same as DELIMITER ','
    CODEPAGE = '65001',     -- UTF-8 (same as ENCODING 'UTF8')
    TABLOCK
);
BULK INSERT job_postings_fact
FROM 'C:\Users\justi\Downloads\all_folders\csv_files\job_postings_fact.csv'
WITH (
    FORMAT ='csv',
    FIRSTROW = 2,           -- skips the header row (Postgres' HEADER true)
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',-- same as DELIMITER ','
    CODEPAGE = '65001',     -- UTF-8 (same as ENCODING 'UTF8')
    TABLOCK
);
