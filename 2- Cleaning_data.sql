-- CLEANING DATA

-- The cleaning process for this tables started before I imported them to the database. What I did back then was to upload the .csv files to drive and:
-- * change the format of the diferent date data types to a format that MySQL would understand, meaning: "YYYY-MM-DD" or "YYYY-MMM-DD HH:MM:SS";
-- * change the amount of decimals in the Calories column (from 14 to 4) in minute_calories_narrow and minute_calories wide tables; 
-- * change the amount of decimals (to 4) in the different distance columns in the tables daily_activity and daily_intensities tables; and
-- * change the amount of decimals in the average_intensity column of hourly_intensities table.

-- Now what I will do is to check for duplicates in the tables I will be working with.

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date)
FROM bellabeat_case_study.daily_activity; -- Got 940 and 940

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date)
FROM bellabeat_case_study.daily_calories; -- Got 940 and 940

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date)
FROM bellabeat_case_study.daily_intensities; -- Got 940 and 940

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date)
FROM bellabeat_case_study.daily_steps; -- Got 940 and 940

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_time)
FROM bellabeat_case_study.heartrate_seconds; -- Got 2483658 and 2483658

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_hour)
FROM bellabeat_case_study.hourly_calories; -- Got 22099 and 22099

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_hour)
FROM bellabeat_case_study.hourly_intensities; -- Got 22099 and 22099

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_hour)
FROM bellabeat_case_study.hourly_steps; -- Got 22099 and 22099

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_minute)
FROM bellabeat_case_study.minute_calories_narrow; -- Got 1325580 and 1325580

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_hour)
FROM bellabeat_case_study.minute_calories_wide; -- Got 21645 and 21645

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_minute)
FROM bellabeat_case_study.minute_intensities_narrow; -- Got 1325580 and 1325580

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_hour)
FROM bellabeat_case_study.minute_intensities_wide; -- Got 21645 and 21645

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_minute)
FROM bellabeat_case_study.minute_mets_narrow; -- Got 1325580 and 1325580

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_minute)
FROM bellabeat_case_study.minute_sleep; -- Got 188521 and 187978, so there are 543 records that don't have unique User_id - Date_minute combinations. Actually when importing this table I couldn't choose as the primary key thecombination of User_id and Date_minute, so I guessed this could happen.

CREATE TABLE bellabeat_case_study.minute_sleep_distinct AS 
SELECT DISTINCT User_id, Date_minute, Value, Log_id
FROM bellabeat_case_study.minute_sleep; -- So this is the minute_sleep table without duplicates.

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_minute)
FROM bellabeat_case_study.minute_steps_narrow; -- Got 1325580 and 1325580

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_hour)
FROM bellabeat_case_study.minute_steps_wide; -- Got 21645 and 21645

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date)
FROM bellabeat_case_study.sleep_day; -- Got 413 and 410. So there are 3 records that don't have unique User_id - Date combinations. Same suposition as with minute_sleep.

CREATE TABLE bellabeat_case_study.sleep_day_distinct AS
SELECT DISTINCT User_id, Date, Total_sleep_records, Total_minutes_asleep, Total_minutes_in_bed
FROM bellabeat_case_study.sleep_day; -- So this is the sleep_day table without duplicates.

SELECT 
	COUNT(*) Total_count,
    COUNT(DISTINCT User_id, Date_time)
FROM bellabeat_case_study.weight_log_info; -- Got 67 and 67.