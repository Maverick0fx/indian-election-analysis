select * from constituencywise_details;
SHOW CREATE TABLE constituencywise_details;
SELECT COUNT(*) FROM constituencywise_details;
describe constituencywise_details;

SELECT *
FROM constituencywise_details
LIMIT 500,20;

SHOW VARIABLES LIKE 'local_infile';
set global local_infile = 1;

truncate table constituencywise_details;

LOAD DATA LOCAL INFILE 'C:/Users/Iseoluwa/OneDrive/Data Course/Sql with Baraa/Indian Sql Project/Election Project/constituencywise_details.csv'
INTO TABLE constituencywise_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Election Project/constituencywise_details.csv'
INTO TABLE constituencywise_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

truncate table partywise_results;
select * from constituencywise_details ;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Election Project/partywise_results.csv'
into table partywise_results
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from constituencywise_details;
select * from constituencywise_results;
select * from partywise_results;
select * from states;
select * from statewise_results;

describe constituencywise_details;
describe constituencywise_results;
describe partywise_results;
describe states;
describe statewise_results;

alter table constituencywise_results 
add primary key (`parliament constituency`, `Constituency ID`);

SELECT MAX(LENGTH(`Constituency ID`))
FROM constituencywise_results;
SELECT MAX(length(`parliament constituency`))
FROM constituencywise_results;

ALTER TABLE constituencywise_results
MODIFY `Parliament Constituency` VARCHAR(30),
MODIFY `Constituency ID` VARCHAR(10);

-- RENAMING COLUMNS
ALTER TABLE constituencywise_results
RENAME COLUMN `S.No` TO s_no,
RENAME COLUMN `Parliament Constituency` TO parliament_constituency,
RENAME COLUMN `Constituency Name` TO constituency_name,
RENAME COLUMN `Winning Candidate` TO winning_candidate,
RENAME COLUMN `Total Votes` TO total_votes,
RENAME COLUMN `Constituency ID` TO constituency_id,
RENAME COLUMN `Party ID` TO party_id;

-- RENAMING COLUMN 
ALTER TABLE statewise_results
RENAME COLUMN `Constituency` TO constituency,
RENAME COLUMN `Const. No.` TO const_no,
RENAME COLUMN `Parliament Constituency` TO parliament_constituency,
RENAME COLUMN `Leading Candidate` TO leading_candidate,
RENAME COLUMN `Trailing Candidate` TO trailing_candidate,
RENAME COLUMN `Margin` TO margin,
RENAME COLUMN `Status` TO status,
RENAME COLUMN `State ID` TO state_id,
RENAME COLUMN `State` TO state;

SELECT
MAX(LENGTH(constituency)) AS constituency_len,
MAX(LENGTH(parliament_constituency)) AS parliament_constituency_len,
MAX(LENGTH(leading_candidate)) AS leading_candidate_len,
MAX(LENGTH(trailing_candidate)) AS trailing_candidate_len,
MAX(LENGTH(status)) AS status_len,
MAX(LENGTH(state_id)) AS state_id_len,
MAX(LENGTH(state)) AS state_len
FROM statewise_results;

select 
MAX(LENGTH(state_id)) AS state_id_len,
MAX(LENGTH(state)) AS state_len
from states;

alter table states
MODIFY state_id VARCHAR(5),
MODIFY state VARCHAR(40);

ALTER TABLE partywise_results
RENAME COLUMN `Party` TO party,
RENAME COLUMN `Won` TO won,
RENAME COLUMN `Party ID` TO party_id;

SELECT MAX(LENGTH(party))
FROM partywise_results;

ALTER TABLE partywise_results
MODIFY party VARCHAR(100);

SELECT COUNT(*) total_rows,
       COUNT(DISTINCT party_id) unique_ids
FROM partywise_results;

alter table partywise_results
add primary key (party_id);

SELECT
MAX(LENGTH(constituency_name)) AS constituency_name_len,
MAX(LENGTH(winning_candidate)) AS winning_candidate_len
FROM constituencywise_results;

ALTER TABLE constituencywise_results
MODIFY constituency_name VARCHAR(25),
MODIFY winning_candidate VARCHAR(55);

ALTER TABLE constituencywise_details
RENAME COLUMN `S.N.` TO s_no,
RENAME COLUMN `Candidate` TO candidate,
RENAME COLUMN `Party` TO party,
RENAME COLUMN `EVM_Votes` TO evm_votes,
RENAME COLUMN `Postal_Votes` TO postal_votes,
RENAME COLUMN `Total_Votes` TO total_votes,
RENAME COLUMN `%_of_Votes` TO vote_percentage,
RENAME COLUMN `Constituency ID` TO constituency_id;

SELECT
MAX(LENGTH(candidate)) AS candidate_len,
MAX(LENGTH(party)) AS party_len,
MAX(LENGTH(constituency_id)) AS constituency_id_len
FROM constituencywise_details;

ALTER TABLE constituencywise_details
MODIFY candidate VARCHAR(70),
MODIFY party VARCHAR(60),
MODIFY constituency_id VARCHAR(10);