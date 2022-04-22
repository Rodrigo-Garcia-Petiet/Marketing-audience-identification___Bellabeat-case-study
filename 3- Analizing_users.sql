-- ANALIZING USERS
-- First to know if I can analize the data and infer over it I need to know the size of the samples, meaning the amount of people (distinct users id). The sample size must be over 30. To know dist first I created temporary tables to identify the unique users id in each table and then I counted them.

SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.daily_activity; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.daily_calories; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.daily_intensities; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.daily_steps; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.heartrate_seconds; -- Has 14 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.hourly_calories; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.hourly_intensities; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.hourly_steps; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_calories_narrow; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_calories_wide; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_intensities_narrow; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_intensities_wide; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_mets_narrow; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_sleep_distinct; -- Has 24 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_steps_narrow; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_steps_wide; -- Has 33 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.sleep_day_distinct; -- Has 24 different users
SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.weight_log_info; -- Has 8 different users

-- I won't use the tables that have less than 30 different users because that sample of information might not be representative of the whole population (bellabeat's customers). This is beacause of the central limit theorem.
-- Knowing this, I will focus my analysis in the tables: daily_activity, daily_calories, daily_intensities, daily_steps, hourly_calories, hourly_intensities, hourly_steps, minute_calories_narrow, minute_calories_wide, minute_intensities_narrow, minute_intensities_wide, minute_mets_narrow, minute_steps_narrow and minute_steps_wide. Meaning 14 of the 18 initial tables.
-- If we want to have some results about the other tables I will need to more data. 

-- Now I want to know if the different tables that I am going to use have the same users because if that is the case I can compare the values of different tables for the same users and get some more powerfull insights. But first I will create temporary tables so it is faster to compar the users between tables.

CREATE TEMPORARY TABLE bellabeat_case_study.da AS
SELECT DISTINCT User_id FROM bellabeat_case_study.daily_activity;
CREATE TEMPORARY TABLE bellabeat_case_study.dc AS
SELECT DISTINCT User_id FROM bellabeat_case_study.daily_calories;
CREATE TEMPORARY TABLE bellabeat_case_study.di AS
SELECT DISTINCT User_id FROM bellabeat_case_study.daily_intensities;
CREATE TEMPORARY TABLE bellabeat_case_study.ds AS
SELECT DISTINCT User_id FROM bellabeat_case_study.daily_steps;
CREATE TEMPORARY TABLE bellabeat_case_study.hc AS
SELECT DISTINCT User_id FROM bellabeat_case_study.hourly_calories;
CREATE TEMPORARY TABLE bellabeat_case_study.hi AS
SELECT DISTINCT User_id FROM bellabeat_case_study.hourly_intensities;
CREATE TEMPORARY TABLE bellabeat_case_study.hs AS
SELECT DISTINCT User_id FROM bellabeat_case_study.hourly_steps;
CREATE TEMPORARY TABLE bellabeat_case_study.mcn AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_calories_narrow;
CREATE TEMPORARY TABLE bellabeat_case_study.mcw AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_calories_wide;
CREATE TEMPORARY TABLE bellabeat_case_study.min AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_intensities_narrow;
CREATE TEMPORARY TABLE bellabeat_case_study.miw AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_intensities_wide;
CREATE TEMPORARY TABLE bellabeat_case_study.mmn AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_mets_narrow;
CREATE TEMPORARY TABLE bellabeat_case_study.msn AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_steps_narrow;
CREATE TEMPORARY TABLE bellabeat_case_study.msw AS
SELECT DISTINCT User_id FROM bellabeat_case_study.minute_steps_wide;

SELECT COUNT(da.User_id)
FROM bellabeat_case_study.da
JOIN bellabeat_case_study.dc USING (User_id)
JOIN bellabeat_case_study.di USING (User_id)
JOIN bellabeat_case_study.ds USING (User_id)
JOIN bellabeat_case_study.hc USING (User_id)
JOIN bellabeat_case_study.hi USING (User_id)
JOIN bellabeat_case_study.hs USING (User_id)
JOIN bellabeat_case_study.mcn USING (User_id)
JOIN bellabeat_case_study.mcw USING (User_id)
JOIN bellabeat_case_study.min USING (User_id)
JOIN bellabeat_case_study.miw USING (User_id)
JOIN bellabeat_case_study.mmn USING (User_id)
JOIN bellabeat_case_study.msn USING (User_id)
JOIN bellabeat_case_study.msw USING (User_id);

-- The result of this JOIN is 33. This means that the intersection of 14 tables, each one with 33 elements, has 33 elements. So this tables have data of the same 33 users.