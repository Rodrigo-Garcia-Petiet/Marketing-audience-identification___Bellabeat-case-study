-- UNDERSTANDIG TABLES

-- Now that I cleaned and organized the data it is time to analize it. To do this first is better to know some metadata, at least what the data represents.

-- The first table: minute_activity has 6 columns:

-- * User_id: this represents the individual behind the data. 
	SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.minute_activity; 
    -- It has 33 unique values.
    
-- * Date_minute: refers to the moment when the data was generated.
	SELECT MIN(Date_minute), MAX(Date_minute) FROM bellabeat_case_study.minute_activity;
    -- The data range goes from 2016-04-12 00:00:00 to 2016-05-13 08:59:00
    
-- * Calories: is the amount of calories burned by certain user at certain minute.
	SELECT MIN(Calories), MAX(Calories) FROM bellabeat_case_study.minute_activity;
    -- The data range goes from 0.0000 to 19.7499.
    
-- * Intensity: ... 
	SELECT DISTINCT Intensity FROM bellabeat_case_study.minute_activity; 
    -- I supose this column is related to the intensity of the activity, with the previous query I now know that this column only have four values: 0, 1, 2 and 3. Knowing that the daily_activity table has the columns Sedentary_active_mintes, Light_active_minutes, Moderately_active_minutes and Very_active_minutes I had a hunch that maybe these four numbers represent one of these columns. Because of these I counted the minutes for the different intensities and compare this amount to the one in the daily_activity table. 
    CREATE TEMPORARY TABLE bellabeat_case_study.sum_int AS
    SELECT 
		User_id,
		DATE(Date_minute) Date,
		SUM(CASE WHEN Intensity = 0 THEN 1 ELSE 0 END) Intensity_0,
		SUM(CASE WHEN Intensity = 1 THEN 1 ELSE 0 END) Intensity_1,
		SUM(CASE WHEN Intensity = 2 THEN 1 ELSE 0 END) Intensity_2,
		SUM(CASE WHEN Intensity = 3 THEN 1 ELSE 0 END) Intensity_3
	FROM bellabeat_case_study.minute_activity
	GROUP BY User_id, Date;
    SELECT COUNT(si.User_id)
    FROM bellabeat_case_study.sum_int si
    JOIN bellabeat_case_study.daily_activity da USING (User_id, Date)
    -- WHERE
    -- si.Intensity_0 <> da.Sedentary_active_mintes -- 467 rows with different values
    -- si.Intensity_1 <> da.Light_active_minutes -- 34 rows with different values
    -- si.Intensity_2 <> da.Moderately_active_minutes -- 9 rows with different values
    -- si.Intensity_3 <> da.Very_active_minutes -- 9 rows with different values
    ;
    SELECT 
		si.Intensity_0 - da.Sedentary_active_mintes Difference,
		sdd.Total_minutes_asleep,
        sdd.Total_minutes_in_bed
    FROM bellabeat_case_study.sum_int si
    JOIN bellabeat_case_study.daily_activity da USING (User_id, Date)
    JOIN bellabeat_case_study.sleep_day_distinct sdd USING (User_id, Date); -- From this query I can see that the amount of the difference is equal to the total minutes in bed for a lot of records. Now I want to know for how much it is not the same.
	SELECT 
		COUNT(*) Count
    FROM bellabeat_case_study.sum_int si
    JOIN bellabeat_case_study.daily_activity da USING (User_id, Date)
    JOIN bellabeat_case_study.sleep_day_distinct sdd USING (User_id, Date)
    WHERE si.Intensity_0 - da.Sedentary_active_mintes <> sdd.Total_minutes_in_bed; -- The result is 284, still too high. I lack data about why there is so much difference in the values of the intensity = 0.
    SELECT 
		si.User_id,
        si.Date,
        da.Light_active_minutes,
        si.Intensity_1,
        da.Moderately_active_minutes,
        si.Intensity_2,
        Very_active_minutes,
        si.Intensity_3
    FROM bellabeat_case_study.sum_int si
    JOIN bellabeat_case_study.daily_activity da USING (User_id, Date)
    WHERE si.Intensity_1 <> da.Light_active_minutes OR
          si.Intensity_2 <> da.Moderately_active_minutes OR 
          si.Intensity_3 <> da.Very_active_minutes;
    -- The different values from these two tables are just too different. The only thing that I can say is that the rows that have different values for the intensity 2 or 3 also have a different value for intensity 1.     
    -- The previous results shows that my hunch was wrong or there was data that was uploaded incorrectly, either way I can't relate the minute_activity and daily_activity tables based on this column.
    
-- * Steps: the amount of steps taken by a user in a certain minute. 
	SELECT MIN(Steps), MAX(Steps) FROM bellabeat_case_study.minute_activity;
    -- The data range goes from 0 to 220.
    
-- * METs: according to [https://www.healthline.com/health/what-are-mets] is a ratio of your working metabolic rate relative to your resting metabolic rate. Meaning that if an activity is thrice as hard as sitting while resting, the MET will be equal to 3. It is a way to describe the intensity of an activity.
    SELECT MIN(METs), MAX(METs) FROM bellabeat_case_study.minute_activity;
    -- The data range goes from 0 to 157.
    
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------

-- The hourly_activity table has 6 columns:

-- * User_id: this represents the individual behind the data. 
	SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.hourly_activity; 
    -- It has 33 unique values.
    
-- * Date_minute: refers to the moment when the data was generated.
	SELECT MIN(Date_hour), MAX(Date_hour) FROM bellabeat_case_study.hourly_activity;
    -- The data range goes from 2016-04-12 00:00:00 to 2016-05-12 15:00:00
    
-- * Calories: is the amount of calories burned by certain user at certain hour.
	SELECT MIN(Calories), MAX(Calories) FROM bellabeat_case_study.hourly_activity;
    -- The data range goes from 42 to 948.
    CREATE TEMPORARY TABLE bellabeat_case_study.hour_cal AS
    SELECT 
		User_id,
        CAST(Date_minute - MINUTE(Date_minute) * 100 AS DATETIME) Date_hour,
        SUM(Calories) Calories
    FROM bellabeat_case_study.minute_activity
    GROUP BY User_id, Date_hour;
    
    SELECT COUNT(*)
    FROM bellabeat_case_study.hour_cal hc
    JOIN bellabeat_case_study.hourly_activity ha USING(User_id, Date_hour)
    WHERE hc.Calories <> ha.Calories; -- So, there are 22092 records that are different (the sum of the calories burn by minute is different from the value of the calories burned in that hour). This may be because I rounded the calories burned every minute, so I am going to check how big is the difference between these values.
    
    SELECT 
		MIN(ha.Calories - hc.Calories) Min_difference, -- Is -0.5007
		MAX(ha.Calories - hc.Calories) Max_difference  -- Is 0.5005
    FROM bellabeat_case_study.hour_cal hc
    JOIN bellabeat_case_study.hourly_activity ha USING(User_id, Date_hour);
    -- So, because the nominal variations between the two columns are between ~ +-0.5 they are most probably because of rounding. So lets check. 
    SELECT 
		COUNT(*)
    FROM bellabeat_case_study.hour_cal hc
    JOIN bellabeat_case_study.hourly_activity ha USING(User_id, Date_hour)
    WHERE ROUND(hc.Calories) <> ha.Calories; -- So now from 22099 records only 5 differ, so most of the differences really were because of rounding the total amount of calories burned certain hour. 
    SELECT ha.Calories - hc.Calories Difference
    FROM bellabeat_case_study.hour_cal hc
    JOIN bellabeat_case_study.hourly_activity ha USING(User_id, Date_hour)
    WHERE ROUND(hc.Calories) <> ha.Calories; -- The values this query returns are barely over 0.5 or bellow -0.5 so these other 5 records might be rounded to "the other side". 
    -- Knowing this I will take that the hourly_activity.Calories column is the addition of the calories burned every minute of a certain hour of the minute_activity.Calories column.
    
-- * Total_intensity: ...
	CREATE TEMPORARY TABLE bellabeat_case_study.hour_int AS
    SELECT 
		User_id,
        CAST(Date_minute - MINUTE(Date_minute) * 100 AS DATETIME) Date_hour,
        SUM(Intensity) Intensity
    FROM bellabeat_case_study.minute_activity
    GROUP BY User_id, Date_hour;
    SELECT COUNT(*) FROM bellabeat_case_study.hour_int; -- This table has a total amount of rows equal to 22437.
    SELECT COUNT(*)
    FROM bellabeat_case_study.hour_int hi
    JOIN bellabeat_case_study.hourly_activity ha USING(User_id, Date_hour) -- 22099 rows
    WHERE hi.Intensity <> ha.Total_intensity; -- The result is 0 
    -- This means that the column hourly_activity.Total_intensity is the sum of all the intensities for a certain hour in the minute_activity table.
    
-- * Average_intensity: ...
	SELECT MIN(Average_intensity), MAX(Average_intensity) 
    FROM bellabeat_case_study.hourly_activity; 
    -- The data range goes from 0 to 3
    SELECT COUNT(*) FROM bellabeat_case_study.hourly_activity
    WHERE Average_intensity <> Total_intensity / 60; -- The result is 9049 this differences might be because of rounding. 
    SELECT 
		MIN(Average_intensity - Total_intensity / 60) Min_difference,
        MAX(Average_intensity - Total_intensity / 60) Max_difference
    FROM bellabeat_case_study.hourly_activity
    WHERE Average_intensity <> Total_intensity / 60; -- This differences are around +-0.000000 so they are because of rounding.
    -- This means that the column hourly_activity.Average_intensity is equal to hourly_activity.Total_intensity / 60, meaning the average intensity for every minute for an hour.
    
-- * Total_steps: this is the total amount of steps taken by certain user at certain hour.
	SELECT MIN(Total_steps), MAX(Total_steps) FROM bellabeat_case_study.hourly_activity;
    -- The data range goes from 0 to 10554.
	CREATE TEMPORARY TABLE bellabeat_case_study.sum_st AS
    SELECT
		User_id,
        CAST(Date_minute - MINUTE(Date_minute) * 100 AS DATETIME) Date_hour,
        SUM(Steps) Total_steps
	FROM bellabeat_case_study.minute_activity
    GROUP BY User_id, Date_hour;
	SELECT 
		COUNT(*)
    FROM bellabeat_case_study.hourly_activity ha
    JOIN bellabeat_case_study.sum_st ss USING (User_id, Date_hour)
    WHERE ha.Total_steps <> ss.Total_steps; -- There are 0 rows with different values. So the hourly_steps.Total_steps is equal to the sum of all the steps taken in an hour from minute_activity.Steps

-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------

-- The daily_activity table has 15 columns:

-- * User_id: this represents the individual behind the data. 
	SELECT COUNT(DISTINCT User_id) FROM bellabeat_case_study.daily_activity; 
    -- It has 33 unique values.
    
-- * Date: refers to the moment when the data was generated.
	SELECT MIN(Date), MAX(Date) FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 2016-04-12 to 2016-05-12
    
-- * Total_steps: is the amount of steps taken in a whole day.
	SELECT MIN(Total_steps), MAX(Total_steps) FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 36019.
    CREATE TEMPORARY TABLE bellabeat_case_study.sum_steps AS
    SELECT
		User_id,
        DATE(Date_minute) Date,
        SUM(Steps) Total_steps
	FROM bellabeat_case_study.minute_activity
    GROUP BY User_id, Date;
    SELECT 
		COUNT(*), -- There are 162 rows that have different values.
        MAX(da.Total_steps - ss.Total_steps), -- The max difference is 12015
        MIN(da.Total_steps - ss.Total_steps)  -- The min difference is -11494
    FROM bellabeat_case_study.daily_activity da
    JOIN bellabeat_case_study.sum_steps ss USING (User_id, Date)
    WHERE da.Total_steps <> ss.Total_steps;
    -- The differences between values is too much, lets see it.
    SELECT
		da.User_id,
        da.Date,
        da.Total_steps,
        ss.Total_steps,
        da.Total_steps - ss.Total_steps Difference        
    FROM bellabeat_case_study.daily_activity da
    JOIN bellabeat_case_study.sum_steps ss USING (User_id, Date)
    WHERE da.Total_steps <> ss.Total_steps
    ORDER BY Difference; -- Generally the difference is positive but that is the only thing I can say about it, the differences have very different values. The User_id, the Date and both values of Total_steps change a lot from record to record. I guess there were problems when the data was uploaded.
    -- Because the steps in hourly_activity is the addition of the steps in minute_activity, the steps in daily_activity can not be the addition of the steps in hourly_activity. 
    
-- * Total_distance: ...
	-- I suppose this is the amount of steps taken in a day but converted in distance, lets check. 
	SELECT MIN(Total_distance), MAX(Total_distance) FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 28.03000069.
    SELECT Total_steps / Total_distance Ratio FROM bellabeat_case_study.daily_activity;
    -- These values show the amount steps it contains one unity of distance. They are not the same so the Total_distance column doesn't depend on the amount of steps (at least the ones from the daily_activity table).
    SELECT ss.Total_steps / da.Total_distance Ratio
    FROM bellabeat_case_study.daily_activity da
    JOIN bellabeat_case_study.sum_steps ss USING (User_id, Date);
    -- These results unique for every row, the Total_distance column doesn't depend on the amount of steps.
    
-- * Tracker_distance: I supose this columns show the tracked distance that one user moved.
    -- Lets check if this column is the same as Total_distance.
    SELECT COUNT(*) FROM bellabeat_case_study.daily_activity
    WHERE Total_distance <> Tracker_distance; -- Only 15 rows with different values
    SELECT 
		MIN(Total_distance - Tracker_distance) Min_difference, -- ~0.04
        MAX(Total_distance - Tracker_distance) Max_difference  -- ~1.83
    FROM bellabeat_case_study.daily_activity
    WHERE Total_distance <> Tracker_distance; -- Because the Min_difference is positive all the differences are positive meaning that the Total_distance is >= Tracker_distance. 
    
-- * Logged_activities_distance: Maybe distance done in bike for example.
	SELECT MIN(Logged_activities_distance), MAX(Logged_activities_distance) 
    FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 4.94214201.
    -- Maybe this is the difference from Tracker_distance to Total_distance.
    SELECT COUNT(*) FROM bellabeat_case_study.daily_activity
    WHERE Logged_activities_distance + Tracker_distance <> Total_distance; -- It is not, which is logic having the highest amount of ~4.94 and the highest difference ~1.83
    
-- * Very_active_distance: distance of a very intense activity.
	SELECT MIN(Very_active_distance), MAX(Very_active_distance) 
    FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 21.9200.
    
-- * Moderately_active_distance: distance of a moderately intense activity.
	SELECT MIN(Moderately_active_distance), MAX(Moderately_active_distance) 
    FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 6.4800.
    
-- * Light_active_distance: distance of a light activity.
	SELECT MIN(Light_active_distance), MAX(Light_active_distance) 
    FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 10.7100.
    
-- * Sedentary_active_distance: distance of a sedentary activity.
	SELECT MIN(Sedentary_active_distance), MAX(Sedentary_active_distance) 
    FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 0.1100.
    
    SELECT COUNT(*) FROM bellabeat_case_study.daily_activity
    WHERE Sedentary_active_distance + Light_active_distance + Moderately_active_distance + Very_active_distance <> Total_distance; -- So the sum of these four columns is not equal to the Total_distance. Maybe it is because of rounding. 
    SELECT 
		MIN(Sedentary_active_distance + Light_active_distance + Moderately_active_distance + Very_active_distance - Total_distance) Min_difference, -- ~-9.37
        MAX(Sedentary_active_distance + Light_active_distance + Moderately_active_distance + Very_active_distance - Total_distance) Max_difference  -- ~0.01 
    FROM bellabeat_case_study.daily_activity
    WHERE Sedentary_active_distance + Light_active_distance + Moderately_active_distance + Very_active_distance <> Total_distance; -- It is not because of some rounding.
    
-- * Very_active_minutes, Moderately_active_minutes, Light_active_minutes and Sedentary_active_mintes: these tables have the total amount of minutes within each intensity. I know from before that these columns don't have the count of all the minutes with each intensity (0,1,2,3), some of them differ.
	SELECT COUNT(*) FROM bellabeat_case_study.daily_activity
    WHERE Very_active_minutes + Moderately_active_minutes + Light_active_minutes + Sedentary_active_mintes <> 20*60; -- In none record the addition of these columns is equal to the amount of minutes in a day.
    
-- * Calories: The amount of calories burned in a certain day by a user.
	SELECT MIN(Calories), MAX(Calories) FROM bellabeat_case_study.daily_activity;
    -- The data range goes from 0 to 4900.
    CREATE TEMPORARY TABLE bellabeat_case_study.sum_cal AS
    SELECT 
		User_id,
        DATE(Date_minute) Date,
        SUM(Calories) Calories
    FROM bellabeat_case_study.minute_activity
    GROUP BY User_id, Date;
    SELECT 
		COUNT(*), -- 936 rows with different values.
        MIN(da.Calories - sc.Calories) Min_difference, -- The min difference is -1880.2760
        MAX(da.Calories - sc.Calories) Max_difference -- The max difference is 2533.3068
    FROM bellabeat_case_study.daily_activity da
    JOIN bellabeat_case_study.sum_cal sc USING(User_id, Date)
    WHERE da.Calories <> sc.Calories; -- These results show that the difference between the addition of the calories spent every minute. 
    
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- ----------------------------------------------------------

-- Summarizing: the minute_activity and hourly_activity have the same data (except for the rounding in the Calories column) but the daily_activity doesn't have the same data as these other two tables.

-- The daily_activity table presents various problems:
-- * The steps, calories and intensities columns don't have the same results as the adition of the minute steps, calories and intensities. I work under the assumption that when intensity = 0 it refers to a sedentary activity, = 1 to a light activity, = 2 to a moderate activity and = 3 to an intense activity. I use this asumption because the amount of rows that the count is different for the intensites 1, 2 and 3 are 34, 9 and 9 respectively, that from the 952 records of the temporary table is around 4%, 1% and 1% of the rows. Also a problem with the adition of the minutes that have each intensity in the daily_activity table is that they don't sum up to the amount of minutes in a day. 
-- * The columns: Total_distance, Tracker_distance, Logged_activities_distance are unique to the this table and even it might be evident the meaning of Total_distance, it is not to the other two columns. Even more, you would expect that the total_distance is the adition of the other distances, but this is not the case either. It either is the adition of the columns Sedentary_active_distance, Light_active_distance, Moderately_active_distance and Very_active_distance.

-- In the end I have a problem of consistency with this database. I have two blocks of information that show different information for any user at a certain moment. If I use both the results of my analysis would not be accurate because the data is not consistent within itself.
-- But on the other hand if I choose only one block I have a 50/50 chance to use the correct data (assuming one of the blocks have the correct data). This problem should be solved by ask for help to the ones who collected it. Not having that chance I have to choose one block.
-- I choose to work with the minute_activity - hourly_activit block because I can create the daily data and because if some of the different values between tables was due to bad typing it is nos as bad to type wrong in the value of a minute or an hour than in the value of a whole day.

-- Having decided that I have to create the new daily_activity table.

CREATE TABLE bellabeat_case_study.day_activity AS
SELECT 
	User_id,
    DATE(Date_minute) Date,
    SUM(CASE WHEN Intensity = 3 THEN 1 ELSE 0 END) Very_active_minutes,
    SUM(CASE WHEN Intensity = 2 THEN 1 ELSE 0 END) Moderate_active_minutes,
    SUM(CASE WHEN Intensity = 1 THEN 1 ELSE 0 END) Light_active_minutes,
    SUM(CASE WHEN Intensity = 0 THEN 1 ELSE 0 END) Sedentary_active_minutes,
    SUM(CASE WHEN Intensity = 3 THEN Steps ELSE 0 END) Very_active_steps,
    SUM(CASE WHEN Intensity = 2 THEN Steps ELSE 0 END) Moderate_active_steps,
    SUM(CASE WHEN Intensity = 1 THEN Steps ELSE 0 END) Light_active_steps,
    SUM(CASE WHEN Intensity = 0 THEN Steps ELSE 0 END) Sedentary_active_steps,
    SUM(Steps) Total_steps,
    SUM(Calories) Total_calories
FROM bellabeat_case_study.minute_activity
GROUP BY User_id, Date;
    
-- With this query I created the new table with the summary of a day for certain user.