 --Donation database analysis for fundraising strategy and increase donations.
 
 -- Select Data that we are going to be starting with
 -- join 2 datasets to get relevant coloumns for analysis.
SELECT Donation_Data.id, first_name, last_name,donation,state,job_field, gender, donation_frequency, university, favourite_colour, car FROM Donation_Data
JOIN Donor_Data2 on Donation_Data.id=Donor_Data2.id
 ;
 
--states vs count of donors to get an idea of which state has more donors
SELECT state, COUNT(id) FROM Donation_Data group by state order by COUNT(id) DESC;


-- states vs total donations to get an idea of total donations from each state.Donation_Data
SELECT state, sum(donation) FROM Donation_Data group by state order by sum(donation) DESC;
SELECT SUM(donation) FROM Donation_Data;
SELECT COUNT( DISTINCT state) FROM Donation_Data;
SELECT COUNT( DISTINCT university) FROM Donor_Data2;
-- lets look the relation between job field and donorsDonation_Data
SELECT job_field, COUNT(id) FROM Donation_Data GROUP by job_field order by COUNT(id) DESC;
-- TOP DONATED STATES

SELECT state, SUM(donation) FROM Donation_Data GROUP BY state ORDER by SUM(donation) desc;

--state vs job field
SELECT state, job_field, COUNT(job_field) FROM Donation_Data WHERE job_field='Business Development' GROUP by state ORDER BY COUNT(job_field) DESC ;

-- weekly donors and their jobs
SELECT state, job_field, COUNT(donation_frequency) FROM Donation_Data JOIN Donor_Data2 ON Donation_Data.id= Donor_Data2.id
 WHERE donation_frequency='Weekly' GROUP BY job_field order by COUNT(donation_frequency) DESC;
 
 -- look for least frequent donors and their states, gender and job.
 
SELECT state, job_field,gender, donation_frequency  FROM Donation_Data 
join Donor_Data2 
on Donation_Data.id=Donor_Data2.id 
where donation_frequency='Once' ;


-- creating a view of top 20 donorsDonation_Data
CREATE VIEW [TOP 20 DONORS] AS 
 SELECT Donation_Data.id, first_name, last_name, state, donation, donation_frequency, job_field, car, favourite_colour, shirt_size FROM Donation_Data
 JOIN Donor_Data2 on Donation_Data.id=Donor_Data2.id
ORDER by donation desc LIMIT 20;
SELECT * FROM [TOP 20 DONORS];
