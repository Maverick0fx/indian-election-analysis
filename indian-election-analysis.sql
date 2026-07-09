select * from constituencywise_details;
select * from constituencywise_results;
select * from partywise_results;
select * from states;
select * from statewise_results;

-- TOTAL SEATS
select distinct count(parliament_constituency) as total_seats
from constituencywise_results;

-- What are the total number of seats available for elections in each state
  SELECT 
 c.state,
 count(a.parliament_constituency) as total_Seats
 from constituencywise_results as a 
 left join statewise_results as b
 on a.Parliament_Constituency = b.parliament_constituency
 left join states as c
 on b.state_id = c.state_id
 where  b.parliament_constituency is not null
 group by state
 order by state asc;
 
 -- SEATS WON BY NDA ALLIANCE
SELECT
SUM(won) AS nda_total_seats_won
FROM partywise_results
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal (Secular) - JD(S)',
    'Lok Janshakti Party (Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
); 


 -- SEATS WON BY NDA ALLIANCE PARTIES
 
 SELECT
 party as party_name,
won as seats_won
FROM partywise_results
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal (Secular) - JD(S)',
    'Lok Janshakti Party (Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
)
order by seats_won desc; 

-- 	TOTAL SEATS WON BY I.N.D.I.A. ALLIANCE
-- INDIAN NATIONAL DEVELOPMENTAL ALLIANCE 

SELECT 
    SUM(WON) as INDIA_total_seats_won
     from 
    partywise_results
	where party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
          );
         
-- TOTAL SEATS WON BY INDIAN ALLIANCE PARTIES
select 
row_number() over(order by sum(won) desc) as 	No,
party,
 sum(won) as total_seats_won
     from 
    partywise_results
	where party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
          )
          group by party 
          ;
          
          /* Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER*/
          
          alter table partywise_results
          add party_alliance varchar(50);
          
          select * from partywise_results;
          
          
update partywise_results
set party_alliance = 'I.D.I.A'
where party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

update partywise_results
set  party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

select  * from partywise_results;

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;

select 
party_alliance,
sum(won) as total_seats
from partywise_results
group by party_alliance;

-- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states
select 
sum(won) as total_seats,
party_alliance
from partywise_results
group by party_alliance
order by total_seats desc;

/* Winning candidate's name, 
their party name, 
total votes, and the margin of victory for a specific state and constituency? */ 

select 
cr.winning_candidate, 
p.party,
cr.total_votes,
cr.margin as margin_of_victory,
s.state,
cr.constituency_name
from constituencywise_results as cr
inner join partywise_results as p
on cr.party_id = p.party_id
inner join statewise_results as sw
on cr.parliament_constituency = sw.parliament_constituency
inner join states as s 
on sw.state_id = s.state_id
where cr.Constituency_name = 'AGRA';

-- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select 
row_number() over () as no,
cd.evm_votes,
cd.postal_votes,
cd.total_votes,
cd.candidate,
cr.constituency_name
from constituencywise_results as cr 
left join 
constituencywise_details as cd 
on cr.constituency_id = cd.constituency_id
where cd.constituency_id is not null and constituency_name = "bidar";


-- Which parties won the most seats in s State, and how many seats did each party win?

select
row_number() over(order by sum(p.won) desc) as no, 
p.party,
s.state,
sum(p.won) as seats_won
from partywise_results as p
inner join constituencywise_results as cr
on p.party_id = cr.party_id
inner join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states as s 
on sr.state_id = s.state_id
where s.state = 'Andhra pradesh'
group by
p.party,
s.state
;


/* What is the total number of seats won by each party alliance 
(NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024 */ 


select
s.state,

	sum(case when P.party_alliance = 'I.N.D.I.A' THEN 1 else 0 end) as INDIA_seats_won,
	sum(case when P.party_alliance = 'NDA' THEN 1 else 0 end) as NDA_seats_won,
    sum(case when party_alliance = 'OTHER' THEN 1 ELSE 0 end) as OTHER_seats_won
from partywise_results as p
inner join constituencywise_results as cr
on p.party_id = cr.party_id
inner join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states as s 
on sr.state_id = s.state_id
-- where s.state = 'Uttar Pradesh'
group by
s.state
;

select
row_number() over(partition by party_alliance order by count(p.party_alliance) desc) as no, 
p.party_alliance,
s.state,
count(p.party_alliance) as party_alliance_seats_won
from partywise_results as p
inner join constituencywise_results as cr
on p.party_id = cr.party_id
inner join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states as s 
on sr.state_id = s.state_id
-- where s.state = 'Andhra pradesh'
group by
party_alliance,
s.state
;

--  Which candidate received the highest number of EVM votes in each constituency (Top 10)?

select 
cd.candidate,
cd.evm_votes,
cr.constituency_name
from constituencywise_details as cd
inner join 
constituencywise_results as cr 
on cd.constituency_id = cr.constituency_id
order by cd.evm_votes desc
limit 10 ;

-- Which candidate won and which candidate was the runner-up 
-- in each constituency of State for the 2024 elections?



with cte_ranked as (
select 
row_number () over(partition by constituency_id order by cd.total_votes desc) as Voters_rank,
cd.constituency_id,
cd.candidate,
cr.constituency_name,
cd.total_votes,
s.state 

from constituencywise_details as cd
inner join constituencywise_results as cr
on cd.constituency_id = cr.constituency_id
inner join statewise_results as sw
on cr.parliament_constituency = sw.parliament_constituency
inner join states as s 
on sw.state_id = s.state_id
)

select 
constituency_name,
max(case when voters_rank =1 then candidate end )as winning_candidate,
max(case when voters_rank = 2 then candidate end ) as runner_up_candidate

from cte_ranked
where state = "Andhra Pradesh"
group by 
constituency_name
order by constituency_name
;

-- For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes 
-- (including EVM and postal), and the breakdown of EVM and postal votes?

with cte_breakdown as 
(
select
cr.parliament_constituency,
cd.candidate,
pr.party,
cd.evm_votes,
cd.postal_votes,
s.state

from 
constituencywise_results as cr
inner join 
constituencywise_details as cd 
on cr.constituency_id = cd.constituency_id
inner join 
partywise_results as pr
on cr.party_id = pr.party_id
inner join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states as s
on sr.state_id = s.state_id
)

select 
state,
count(distinct parliament_constituency) as total_seats,
count(distinct candidate) as total_candidates,
count(distinct party) total_parties,
sum(evm_votes) as total_evm_votes,
sum(postal_votes) as total_postalvotes,
sum(evm_votes + postal_votes) as total_votes
from cte_breakdown
where state = 'Maharashtra'
group by 
state;

-- OR 

select 
s.state,
count(distinct cr.constituency_id) as total_seats,
count(distinct cd.candidate) as total_candidates,
count(distinct pr.party) total_parties,
sum(cd.evm_votes) as total_evm_votes,
sum(cd.postal_votes) as total_postalvotes,
sum(cd.total_votes) as total_votes

from 
constituencywise_results as cr
inner join 
constituencywise_details as cd 
on cr.constituency_id = cd.constituency_id
inner join 
partywise_results as pr
on cr.party_id = pr.party_id
inner join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states as s
on sr.state_id = s.state_id
where s.state = 'Maharashtra'
group by s.state;

