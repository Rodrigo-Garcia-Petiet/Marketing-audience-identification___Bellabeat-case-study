-- FILTERING TABLES TO WORK WITH

-- One of the first things I recognize from the database is that there are three pairs of tables that have the data in narrow and wide format. Before deciding to use one or another I am going to check if both tables have the same data.
-- By the way the pairs of tables are: [minute_calories_narrow and minute_calories_wide], [minute_intensities_narrow and minute_intensities_wide] and [minute_steps_narrow and minute_steps_wide]

-- I will use now the tables in long-format of the wide-format tables that I created in the scipt named "Wide_to_long_data".
-- With the next query I will create a temporary table with the data that is different on both tables or that does't exist in one of them for the three pairs of tables.

CREATE TEMPORARY TABLE bellabeat_case_study.mcn_missing_different AS
(
SELECT 
	mcn.User_id User_id_n,
    mcn.Date_minute Date_minute_n,
    mcn.Calories Calories_n,
    mcn2.User_id User_id_w,
    mcn2.Date_minute Date_minute_w,
    mcn2.Calories Calories_w
FROM bellabeat_case_study.minute_calories_narrow mcn
LEFT JOIN bellabeat_case_study.minute_calories_narrow2 mcn2
	USING (User_id, Date_minute)
WHERE mcn.Calories <> mcn2.Calories OR mcn2.Calories IS NULL
UNION ALL
SELECT
	mcn.User_id User_id_n,
    mcn.Date_minute Date_minute_n,
    mcn.Calories Calories_n,
    mcn2.User_id User_id_w,
    mcn2.Date_minute Date_minute_w,
    mcn2.Calories Calories_w
FROM bellabeat_case_study.minute_calories_narrow mcn
RIGHT JOIN bellabeat_case_study.minute_calories_narrow2 mcn2
	USING (User_id, Date_minute)
WHERE mcn.Calories IS NULL
);

SELECT COUNT(*)
FROM bellabeat_case_study.mcn_missing_different -- There is a total of 68160 rows in this table.
-- WHERE User_id_n IS NULL -- I get 20640 records without values in the narrow column.
-- WHERE User_id_w IS NULL -- I get 47520 records without values in the narrow2 column.
-- WHERE Calories_n <> Calories_w -- I get 0 records with different values in both tables.
;

-- With the previous query I now know each table [minute_calories_narrow and minute_calories_wide] has unique values to it but there are no values that are different between tables. Knowing this I will create a table that has all the values of both tables.

CREATE TABLE bellabeat_case_study.mcn_complete AS
(
	SELECT * FROM bellabeat_case_study.minute_calories_narrow
    UNION ALL
	SELECT 
		mcn2.User_id User_id_w,
		mcn2.Date_minute Date_minute_w,
		mcn2.Calories Calories_w
	FROM bellabeat_case_study.minute_calories_narrow mcn
	RIGHT JOIN bellabeat_case_study.minute_calories_narrow2 mcn2
		USING (User_id, Date_minute)
	WHERE mcn.Calories IS NULL
);

-- For checking purposes I am going to run the next query to calculate the amount of rows that has the mcn_complete compared to the sum of the amount of rows in minute_calories_narrow and minute_calories_narrow2 (rows that doesn't appear in the other table).

SELECT COUNT(*)
FROM bellabeat_case_study.mcn_complete; -- The amount of rows is 1346220
SELECT COUNT(*)
FROM bellabeat_case_study.minute_calories_narrow; -- The amount of rows is 1325580
SELECT COUNT(mcn2.User_id)
FROM bellabeat_case_study.minute_calories_narrow2 mcn2
LEFT JOIN bellabeat_case_study.minute_calories_narrow mcn
	USING (User_id, Date_minute)
WHERE mcn.User_id IS NULL; -- The amount of rows is 20640
SELECT 1346220 complete_amount, 1325580 + 20640 add_amount; -- And we got the same amount.

-- From here on I will be using the table mcn_complete instead of minute_calories_narrow or minute_calories_narrow2.

-- ------------------------------------------------------------

-- Now I will do the same with the minute_intensities_narrow and minute_intensities_wide tables. 

CREATE TEMPORARY TABLE bellabeat_case_study.min_missing_different AS
(
SELECT 
	min.User_id User_id_n,
    min.Date_minute Date_minute_n,
    min.Intensity Intensity_n,
    min2.User_id User_id_w,
    min2.Date_minute Date_minute_w,
    min2.Intensity Intensity_w
FROM bellabeat_case_study.minute_intensities_narrow min
LEFT JOIN bellabeat_case_study.minute_intensities_narrow2 min2
	USING (User_id, Date_minute)
WHERE min.Intensity <> min2.Intensity OR min2.Intensity IS NULL
UNION ALL
SELECT
	min.User_id User_id_n,
    min.Date_minute Date_minute_n,
    min.Intensity Intensity_n,
    min2.User_id User_id_w,
    min2.Date_minute Date_minute_w,
    min2.Intensity Intensity_w
FROM bellabeat_case_study.minute_intensities_narrow min
RIGHT JOIN bellabeat_case_study.minute_intensities_narrow2 min2
	USING (User_id, Date_minute)
WHERE min.Intensity IS NULL
);

SELECT COUNT(*)
FROM bellabeat_case_study.min_missing_different -- There is a total of 68160 rows in this table.
-- WHERE User_id_n IS NULL -- I get 20640 records without values in the narrow column.
-- WHERE User_id_w IS NULL -- I get 47520 records without values in the narrow2 column.
-- WHERE Intensity_n <> Intensity_w -- I get 0 records with different values in both tables.
;

-- With the previous query I now know each table [minute_steps_narrow and minute_steps_wide] has unique values to it but there are no values that are different between tables. Knowing this I will create a table that has all the values of both tables.

CREATE TABLE bellabeat_case_study.min_complete AS
(
	SELECT * FROM bellabeat_case_study.minute_intensities_narrow
    UNION ALL
	SELECT 
		min2.User_id User_id_w,
		min2.Date_minute Date_minute_w,
		min2.Intensity Intensity_w
	FROM bellabeat_case_study.minute_intensities_narrow min
	RIGHT JOIN bellabeat_case_study.minute_intensities_narrow2 min2
		USING (User_id, Date_minute)
	WHERE min.Intensity IS NULL
);

-- For checking purposes I am going to run the next query to calculate the amount of rows that has the min_complete compared to the sum of the amount of rows in minute_steps_narrow and minute_steps_narrow2 (rows that doesn't appear in the other table).

SELECT COUNT(*)
FROM bellabeat_case_study.min_complete; -- The amount of rows is 1346220
SELECT COUNT(*)
FROM bellabeat_case_study.minute_intensities_narrow; -- The amount of rows is 1325580
SELECT COUNT(min2.User_id)
FROM bellabeat_case_study.minute_intensities_narrow2 min2
LEFT JOIN bellabeat_case_study.minute_intensities_narrow min
	USING (User_id, Date_minute)
WHERE min.User_id IS NULL; -- The amount of rows is 20640
SELECT 1346220 complete_amount, 1325580 + 20640 add_amount; -- And we got the same amount.

-- From here on I will be using the table min_complete instead of minute_intensities_narrow or minute_intensities_narrow2.

-- ------------------------------------------------------------

-- Now I will do the same with the minute_steps_narrow and minute_steps_wide tables. 

CREATE TEMPORARY TABLE bellabeat_case_study.msn_missing_different AS
(
SELECT 
	msn.User_id User_id_n,
    msn.Date_minute Date_minute_n,
    msn.Steps Steps_n,
    msn2.User_id User_id_w,
    msn2.Date_minute Date_minute_w,
    msn2.Steps Steps_w
FROM bellabeat_case_study.minute_steps_narrow msn
LEFT JOIN bellabeat_case_study.minute_steps_narrow2 msn2
	USING (User_id, Date_minute)
WHERE msn.Steps <> msn2.Steps OR msn2.Steps IS NULL
UNION ALL
SELECT
	msn.User_id User_id_n,
    msn.Date_minute Date_minute_n,
    msn.Steps Steps_n,
    msn2.User_id User_id_w,
    msn2.Date_minute Date_minute_w,
    msn2.Steps Steps_w
FROM bellabeat_case_study.minute_steps_narrow msn
RIGHT JOIN bellabeat_case_study.minute_steps_narrow2 msn2
	USING (User_id, Date_minute)
WHERE msn.Steps IS NULL
);

SELECT COUNT(*)
FROM bellabeat_case_study.msn_missing_different -- There is a total of 68160 rows in this table.
-- WHERE User_id_n IS NULL -- I get 20640 records without values in the narrow column.
-- WHERE User_id_w IS NULL -- I get 47520 records without values in the narrow2 column.
-- WHERE Steps_n <> Steps_w -- I get 0 records with different values in both tables.
;

-- With the previous query I now know each table [minute_steps_narrow and minute_steps_wide] has unique values to it but there are no values that are different between tables. Knowing this I will create a table that has all the values of both tables.

CREATE TABLE bellabeat_case_study.msn_complete AS
(
	SELECT * FROM bellabeat_case_study.minute_steps_narrow
    UNION ALL
	SELECT 
		msn2.User_id User_id_w,
		msn2.Date_minute Date_minute_w,
		msn2.Steps Steps_w
	FROM bellabeat_case_study.minute_steps_narrow msn
	RIGHT JOIN bellabeat_case_study.minute_steps_narrow2 msn2
		USING (User_id, Date_minute)
	WHERE msn.Steps IS NULL
);

-- For checking purposes I am going to run the next query to calculate the amount of rows that has the msn_complete compared to the sum of the amount of rows in minute_steps_narrow and minute_steps_narrow2 (rows that doesn't appear in the other table).

SELECT COUNT(*)
FROM bellabeat_case_study.msn_complete; -- The amount of rows is 1346220
SELECT COUNT(*)
FROM bellabeat_case_study.minute_steps_narrow; -- The amount of rows is 1325580
SELECT COUNT(msn2.User_id)
FROM bellabeat_case_study.minute_steps_narrow2 msn2
LEFT JOIN bellabeat_case_study.minute_steps_narrow msn
	USING (User_id, Date_minute)
WHERE msn.User_id IS NULL; -- The amount of rows is 20640
SELECT 1346220 complete_amount, 1325580 + 20640 add_amount; -- And we got the same amount.

-- From here on I will be using the table min_complete instead of minute_steps_narrow or minute_steps_narrow2.

-- Now that I finished creating these 3 tables I saw that they have the same amount of rows. This may be a sign that the tables have values for the same users and date, so I am going to check it.

SELECT COUNT(mcn.User_id)
FROM bellabeat_case_study.mcn_complete mcn
JOIN bellabeat_case_study.min_complete min USING (User_id, Date_minute)
JOIN bellabeat_case_study.msn_complete msn USING (User_id, Date_minute);

-- The result of this query is 1346220, meaning that the intersection of the other 3 tables hsa the same amount of rows that each of them. And this shows that they have values of the same User_id - Date_minute combinations. Because of this I will create an unique table that includes the other three.

CREATE TEMPORARY TABLE bellabeat_case_study.mcisn_complete AS
(
	SELECT 
		mcn.User_id,
        mcn.Date_minute,
        mcn.Calories,
        min.Intensity,
        msn.Steps
	FROM bellabeat_case_study.mcn_complete mcn
	JOIN bellabeat_case_study.min_complete min USING (User_id, Date_minute)
	JOIN bellabeat_case_study.msn_complete msn USING (User_id, Date_minute)
);

-- Now that I have a table with all the values (calories, intensities and steps) for certain minutes I remember that I have another table with values for each minute: minute_mets_narrow. So I want to know if it has values for the same User_id - Date_minute combinations.

SELECT 
	COUNT(com.User_id) com_User_id,
    COUNT(mmn.User_id) mmn_User_id
FROM bellabeat_case_study.mcisn_complete com
RIGHT JOIN bellabeat_case_study.minute_mets_narrow mmn USING (User_id, Date_minute); -- This query returns the same amount of rows in each column (1325580). This means that every record in the minute_mets_narrow table has their corresponding values in the mcisn_complete table.

SELECT COUNT(*) FROM bellabeat_case_study.mcisn_complete; -- The amount of rows of the mcisn_complete table is 1346220. This shows that the amount of rows in the minute_mets_narrow table is lower than the amount in the mcisn_complete.

-- Either way I will join these two tables so I work with a less amount of them.
CREATE TABLE bellabeat_case_study.minute_activity AS
SELECT
	com.User_id,
    com.Date_minute,
    com.Calories,
    com.Intensity,
    com.Steps,
    mmn.METs
FROM bellabeat_case_study.mcisn_complete com
LEFT JOIN bellabeat_case_study.minute_mets_narrow mmn USING (User_id, Date_minute);

-- So finally from seven tables (minute_calories_narrow, minute_calories_wide, minute_intensities_narrow, minute_intensities_wide, minute_steps_narrow, minute_steps_wide and minute_mets_narrow) I created one: minute_activity.

-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------

-- Now another thing that I noticed is that the table daily_activity may contain the data of daily_calories, daily_intensities and daily_steps. 
-- First I am going to check if these tables have the same information that the daily_activity table. 

CREATE TEMPORARY TABLE bellabeat_case_study.dc_missing_different AS
(
SELECT 
	da.User_id da_User_id,
    dc.User_id dc_User_id
FROM bellabeat_case_study.daily_activity da
LEFT JOIN bellabeat_case_study.daily_calories dc USING (User_id, Date)
WHERE dc.User_id IS NULL OR da.Calories <> dc.Calories
UNION ALL
SELECT
	da.User_id da_User_id,
    dc.User_id dc_User_id
FROM bellabeat_case_study.daily_activity da
RIGHT JOIN bellabeat_case_study.daily_calories dc USING (User_id, Date)
WHERE da.User_id IS NULL
); -- This query creates as a result a temporary table with 0 records, meaning that both tables have the same information.

CREATE TEMPORARY TABLE bellabeat_case_study.di_missing_different AS
(
SELECT 
	da.User_id da_User_id,
    di.User_id di_User_id
FROM bellabeat_case_study.daily_activity da
LEFT JOIN bellabeat_case_study.daily_intensities di USING (User_id, Date)
WHERE 
	di.User_id IS NULL OR 
    (
		da.Very_active_minutes <> di.Very_active_minutes OR
        da.Moderately_active_minutes <> di.Moderately_active_minutes OR
        da.Light_active_minutes <> di.Light_active_minutes OR
        da.Sedentary_active_mintes <> di.Sedentary_active_mintes OR
        da.Very_active_distance <> di.Very_active_distance OR
        da.Moderately_active_distance <> di.Moderately_active_distance OR
        da.Light_active_distance <> di.Light_active_distance OR
        da.Sedentary_active_distance <> di.Sedentary_active_distance
	)
UNION ALL
SELECT
	da.User_id da_User_id,
    di.User_id di_User_id
FROM bellabeat_case_study.daily_activity da
RIGHT JOIN bellabeat_case_study.daily_intensities di USING (User_id, Date)
WHERE da.User_id IS NULL
); -- This query creates as a result a temporary table with 0 records, meaning that both tables have the same information.

CREATE TEMPORARY TABLE bellabeat_case_study.ds_missing_different AS
(
SELECT 
	da.User_id da_User_id,
    ds.User_id ds_User_id
FROM bellabeat_case_study.daily_activity da
LEFT JOIN bellabeat_case_study.daily_steps ds USING (User_id, Date)
WHERE ds.User_id IS NULL OR da.Total_steps <> ds.Total_steps
UNION ALL
SELECT
	da.User_id da_User_id,
    ds.User_id ds_User_id
FROM bellabeat_case_study.daily_activity da
RIGHT JOIN bellabeat_case_study.daily_steps ds USING (User_id, Date)
WHERE da.User_id IS NULL
); -- This query creates as a result a temporary table with 0 records, meaning that both tables have the same information.

-- With these three last queries I know that the tables daily_calories, daily_intensities and daily_steps have the same information that daily_activity, so I will only use the last one. 

-- So finally from four tables (daily_activity, daily_calories, daily_intensities and daily_steps) I will be using only one (daily_activity).

-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------

-- So third and finally I want to create a unique table with the hourly values, if possible. I have to check first if the hourly_intensities and hourly_steps tables have the same User_id - Date_hour combinations, join them and then create a column of the hourly calories burned.

SELECT COUNT(*) FROM bellabeat_case_study.hourly_calories; -- The result is 22099.
SELECT COUNT(*) FROM bellabeat_case_study.hourly_intensities; -- The result is 22099.
SELECT COUNT(*) FROM bellabeat_case_study.hourly_steps; -- The result is 22099.
-- So these tables have the same amount of rows.

SELECT 
	COUNT(hc.User_id)
FROM bellabeat_case_study.hourly_calories hc
JOIN bellabeat_case_study.hourly_intensities hi USING (User_id, Date_hour)
JOIN bellabeat_case_study.hourly_steps hs USING (User_id, Date_hour); -- So the intersection of these tables has the same length as them. This means that they contain values for the same User_id - Date_hour combinations. This is why I am going to join them in a unique table.

CREATE TABLE bellabeat_case_study.hourly_activity AS
SELECT 
	hc.User_id,
    hc.Date_hour,
    hc.Calories,
    hi.Total_intensity,
    hi.Average_intensity,
    hs.Total_steps
FROM bellabeat_case_study.hourly_calories hc
JOIN bellabeat_case_study.hourly_intensities hi USING (User_id, Date_hour)
JOIN bellabeat_case_study.hourly_steps hs USING (User_id, Date_hour);

-- So from three tables (hourly_calories, hourly_intensities and hourly_steps) I created hourly_activity.

-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- --------------------------------------------------------------

-- Thanks to this script I organized the data and diminished the amount of tables I will be working with from 14 to 3 (daily_activity, hourly_activity and minute_activity).