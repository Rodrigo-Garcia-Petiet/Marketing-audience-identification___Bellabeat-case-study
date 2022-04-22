-- WIDE TO LONG DATA
-- In this script I will create long data from wide data, this is with the objective of better comparition of the data between the tables [minute_calories_narrow and minute_calories_wide], [minute_intensities_narrow and minute_intensities_wide] and [minute_steps_narrow and minute_steps_wide].

-- Here I create the table with long data of the minute_calories_wide table.
-- Ends in row 370.

CREATE TABLE bellabeat_case_study.minute_calories_narrow2 AS
	SELECT
		User_id,
        Date_hour Date_minute,
        Calories_m00 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 100 AS DATETIME) Date_minute,
        Calories_m01 Calories
	FROM bellabeat_case_study.minute_calories_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 200 AS DATETIME) Date_minute,
        Calories_m02 Calories
	FROM bellabeat_case_study.minute_calories_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 300 AS DATETIME) Date_minute,
        Calories_m03 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 400 AS DATETIME) Date_minute,
        Calories_m04 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 500 AS DATETIME) Date_minute,
        Calories_m05 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 600 AS DATETIME) Date_minute,
        Calories_m06 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 700 AS DATETIME) Date_minute,
        Calories_m07 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 800 AS DATETIME) Date_minute,
        Calories_m08 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 900 AS DATETIME) Date_minute,
        Calories_m09 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1000 AS DATETIME) Date_minute,
        Calories_m10 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1100 AS DATETIME) Date_minute,
        Calories_m11 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1200 AS DATETIME) Date_minute,
        Calories_m12 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1300 AS DATETIME) Date_minute,
        Calories_m13 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1400 AS DATETIME) Date_minute,
        Calories_m14 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1500 AS DATETIME) Date_minute,
        Calories_m15 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1600 AS DATETIME) Date_minute,
        Calories_m16 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1700 AS DATETIME) Date_minute,
        Calories_m17 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1800 AS DATETIME) Date_minute,
        Calories_m18 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1900 AS DATETIME) Date_minute,
        Calories_m19 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2000 AS DATETIME) Date_minute,
        Calories_m20 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2100 AS DATETIME) Date_minute,
        Calories_m21 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2200 AS DATETIME) Date_minute,
        Calories_m22 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2300 AS DATETIME) Date_minute,
        Calories_m23 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2400 AS DATETIME) Date_minute,
        Calories_m24 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2500 AS DATETIME) Date_minute,
        Calories_m25 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2600 AS DATETIME) Date_minute,
        Calories_m26 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2700 AS DATETIME) Date_minute,
        Calories_m27 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2800 AS DATETIME) Date_minute,
        Calories_m28 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2900 AS DATETIME) Date_minute,
        Calories_m29 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3000 AS DATETIME) Date_minute,
        Calories_m30 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3100 AS DATETIME) Date_minute,
        Calories_m31 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3200 AS DATETIME) Date_minute,
        Calories_m32 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3300 AS DATETIME) Date_minute,
        Calories_m33 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3400 AS DATETIME) Date_minute,
        Calories_m34 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3500 AS DATETIME) Date_minute,
        Calories_m35 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3600 AS DATETIME) Date_minute,
        Calories_m36 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3700 AS DATETIME) Date_minute,
        Calories_m37 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3800 AS DATETIME) Date_minute,
        Calories_m38 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3900 AS DATETIME) Date_minute,
        Calories_m39 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4000 AS DATETIME) Date_minute,
        Calories_m40 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4100 AS DATETIME) Date_minute,
        Calories_m41 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4200 AS DATETIME) Date_minute,
        Calories_m42 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4300 AS DATETIME) Date_minute,
        Calories_m43 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4400 AS DATETIME) Date_minute,
        Calories_m44 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4500 AS DATETIME) Date_minute,
        Calories_m45 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4600 AS DATETIME) Date_minute,
        Calories_m46 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4700 AS DATETIME) Date_minute,
        Calories_m47 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4800 AS DATETIME) Date_minute,
        Calories_m48 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4900 AS DATETIME) Date_minute,
        Calories_m49 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5000 AS DATETIME) Date_minute,
        Calories_m50 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5100 AS DATETIME) Date_minute,
        Calories_m51 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5200 AS DATETIME) Date_minute,
        Calories_m52 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5300 AS DATETIME) Date_minute,
        Calories_m53 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5400 AS DATETIME) Date_minute,
        Calories_m54 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5500 AS DATETIME) Date_minute,
        Calories_m55 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5600 AS DATETIME) Date_minute,
        Calories_m56 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5700 AS DATETIME) Date_minute,
        Calories_m57 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5800 AS DATETIME) Date_minute,
        Calories_m58 Calories
	FROM bellabeat_case_study.minute_calories_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5900 AS DATETIME) Date_minute,
        Calories_m59 Calories
	FROM bellabeat_case_study.minute_calories_wide;

-- Here I create the table with long data of the minute_calories_wide table. 
-- Ends in row 731.

CREATE TABLE bellabeat_case_study.minute_intensities_narrow2 AS
	SELECT
		User_id,
        Date_hour Date_minute,
        Intensity_m00 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 100 AS DATETIME) Date_minute,
        Intensity_m01 Intensity
	FROM bellabeat_case_study.minute_intensities_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 200 AS DATETIME) Date_minute,
        Intensity_m02 Intensity
	FROM bellabeat_case_study.minute_intensities_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 300 AS DATETIME) Date_minute,
        Intensity_m03 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 400 AS DATETIME) Date_minute,
        Intensity_m04 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 500 AS DATETIME) Date_minute,
        Intensity_m05 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 600 AS DATETIME) Date_minute,
        Intensity_m06 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 700 AS DATETIME) Date_minute,
        Intensity_m07 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 800 AS DATETIME) Date_minute,
        Intensity_m08 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 900 AS DATETIME) Date_minute,
        Intensity_m09 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1000 AS DATETIME) Date_minute,
        Intensity_m10 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1100 AS DATETIME) Date_minute,
        Intensity_m11 Intensity
	FROM bellabeat_case_study.minute_intensities_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1200 AS DATETIME) Date_minute,
        Intensity_m12 Intensity
	FROM bellabeat_case_study.minute_intensities_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1300 AS DATETIME) Date_minute,
        Intensity_m13 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1400 AS DATETIME) Date_minute,
        Intensity_m14 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1500 AS DATETIME) Date_minute,
        Intensity_m15 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1600 AS DATETIME) Date_minute,
        Intensity_m16 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1700 AS DATETIME) Date_minute,
        Intensity_m17 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1800 AS DATETIME) Date_minute,
        Intensity_m18 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1900 AS DATETIME) Date_minute,
        Intensity_m19 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2000 AS DATETIME) Date_minute,
        Intensity_m20 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2100 AS DATETIME) Date_minute,
        Intensity_m21 Intensity
	FROM bellabeat_case_study.minute_intensities_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2200 AS DATETIME) Date_minute,
        Intensity_m22 Intensity
	FROM bellabeat_case_study.minute_intensities_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2300 AS DATETIME) Date_minute,
        Intensity_m23 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2400 AS DATETIME) Date_minute,
        Intensity_m24 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2500 AS DATETIME) Date_minute,
        Intensity_m25 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2600 AS DATETIME) Date_minute,
        Intensity_m26 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2700 AS DATETIME) Date_minute,
        Intensity_m27 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2800 AS DATETIME) Date_minute,
        Intensity_m28 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2900 AS DATETIME) Date_minute,
        Intensity_m29 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3000 AS DATETIME) Date_minute,
        Intensity_m30 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3100 AS DATETIME) Date_minute,
        Intensity_m31 Intensity
	FROM bellabeat_case_study.minute_intensities_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3200 AS DATETIME) Date_minute,
        Intensity_m32 Intensity
	FROM bellabeat_case_study.minute_intensities_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3300 AS DATETIME) Date_minute,
        Intensity_m33 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3400 AS DATETIME) Date_minute,
        Intensity_m34 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3500 AS DATETIME) Date_minute,
        Intensity_m35 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3600 AS DATETIME) Date_minute,
        Intensity_m36 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3700 AS DATETIME) Date_minute,
        Intensity_m37 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3800 AS DATETIME) Date_minute,
        Intensity_m38 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3900 AS DATETIME) Date_minute,
        Intensity_m39 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4000 AS DATETIME) Date_minute,
        Intensity_m40 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4100 AS DATETIME) Date_minute,
        Intensity_m41 Intensity
	FROM bellabeat_case_study.minute_intensities_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4200 AS DATETIME) Date_minute,
        Intensity_m42 Intensity
	FROM bellabeat_case_study.minute_intensities_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4300 AS DATETIME) Date_minute,
        Intensity_m43 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4400 AS DATETIME) Date_minute,
        Intensity_m44 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4500 AS DATETIME) Date_minute,
        Intensity_m45 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4600 AS DATETIME) Date_minute,
        Intensity_m46 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4700 AS DATETIME) Date_minute,
        Intensity_m47 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4800 AS DATETIME) Date_minute,
        Intensity_m48 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4900 AS DATETIME) Date_minute,
        Intensity_m49 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5000 AS DATETIME) Date_minute,
        Intensity_m50 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5100 AS DATETIME) Date_minute,
        Intensity_m51 Intensity
	FROM bellabeat_case_study.minute_intensities_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5200 AS DATETIME) Date_minute,
        Intensity_m52 Intensity
	FROM bellabeat_case_study.minute_intensities_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5300 AS DATETIME) Date_minute,
        Intensity_m53 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5400 AS DATETIME) Date_minute,
        Intensity_m54 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5500 AS DATETIME) Date_minute,
        Intensity_m55 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5600 AS DATETIME) Date_minute,
        Intensity_m56 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5700 AS DATETIME) Date_minute,
        Intensity_m57 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5800 AS DATETIME) Date_minute,
        Intensity_m58 Intensity
	FROM bellabeat_case_study.minute_intensities_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5900 AS DATETIME) Date_minute,
        Intensity_m59 Intensity
	FROM bellabeat_case_study.minute_intensities_wide;

-- Here I create the table with long data of the minute_calories_wide table.

CREATE TABLE bellabeat_case_study.minute_steps_narrow2 AS
	SELECT
		User_id,
        Date_hour Date_minute,
        Steps_m00 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 100 AS DATETIME) Date_minute,
        Steps_m01 Steps
	FROM bellabeat_case_study.minute_steps_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 200 AS DATETIME) Date_minute,
        Steps_m02 Steps
	FROM bellabeat_case_study.minute_steps_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 300 AS DATETIME) Date_minute,
        Steps_m03 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 400 AS DATETIME) Date_minute,
        Steps_m04 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 500 AS DATETIME) Date_minute,
        Steps_m05 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 600 AS DATETIME) Date_minute,
        Steps_m06 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 700 AS DATETIME) Date_minute,
        Steps_m07 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 800 AS DATETIME) Date_minute,
        Steps_m08 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 900 AS DATETIME) Date_minute,
        Steps_m09 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1000 AS DATETIME) Date_minute,
        Steps_m10 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1100 AS DATETIME) Date_minute,
        Steps_m11 Steps
	FROM bellabeat_case_study.minute_steps_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1200 AS DATETIME) Date_minute,
        Steps_m12 Steps
	FROM bellabeat_case_study.minute_steps_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1300 AS DATETIME) Date_minute,
        Steps_m13 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1400 AS DATETIME) Date_minute,
        Steps_m14 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1500 AS DATETIME) Date_minute,
        Steps_m15 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1600 AS DATETIME) Date_minute,
        Steps_m16 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1700 AS DATETIME) Date_minute,
        Steps_m17 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1800 AS DATETIME) Date_minute,
        Steps_m18 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 1900 AS DATETIME) Date_minute,
        Steps_m19 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2000 AS DATETIME) Date_minute,
        Steps_m20 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2100 AS DATETIME) Date_minute,
        Steps_m21 Steps
	FROM bellabeat_case_study.minute_steps_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2200 AS DATETIME) Date_minute,
        Steps_m22 Steps
	FROM bellabeat_case_study.minute_steps_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2300 AS DATETIME) Date_minute,
        Steps_m23 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2400 AS DATETIME) Date_minute,
        Steps_m24 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2500 AS DATETIME) Date_minute,
        Steps_m25 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2600 AS DATETIME) Date_minute,
        Steps_m26 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2700 AS DATETIME) Date_minute,
        Steps_m27 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2800 AS DATETIME) Date_minute,
        Steps_m28 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 2900 AS DATETIME) Date_minute,
        Steps_m29 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3000 AS DATETIME) Date_minute,
        Steps_m30 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3100 AS DATETIME) Date_minute,
        Steps_m31 Steps
	FROM bellabeat_case_study.minute_steps_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3200 AS DATETIME) Date_minute,
        Steps_m32 Steps
	FROM bellabeat_case_study.minute_steps_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3300 AS DATETIME) Date_minute,
        Steps_m33 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3400 AS DATETIME) Date_minute,
        Steps_m34 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3500 AS DATETIME) Date_minute,
        Steps_m35 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3600 AS DATETIME) Date_minute,
        Steps_m36 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3700 AS DATETIME) Date_minute,
        Steps_m37 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3800 AS DATETIME) Date_minute,
        Steps_m38 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 3900 AS DATETIME) Date_minute,
        Steps_m39 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4000 AS DATETIME) Date_minute,
        Steps_m40 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4100 AS DATETIME) Date_minute,
        Steps_m41 Steps
	FROM bellabeat_case_study.minute_steps_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4200 AS DATETIME) Date_minute,
        Steps_m42 Steps
	FROM bellabeat_case_study.minute_steps_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4300 AS DATETIME) Date_minute,
        Steps_m43 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4400 AS DATETIME) Date_minute,
        Steps_m44 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4500 AS DATETIME) Date_minute,
        Steps_m45 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4600 AS DATETIME) Date_minute,
        Steps_m46 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4700 AS DATETIME) Date_minute,
        Steps_m47 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4800 AS DATETIME) Date_minute,
        Steps_m48 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 4900 AS DATETIME) Date_minute,
        Steps_m49 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5000 AS DATETIME) Date_minute,
        Steps_m50 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5100 AS DATETIME) Date_minute,
        Steps_m51 Steps
	FROM bellabeat_case_study.minute_steps_wide    
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5200 AS DATETIME) Date_minute,
        Steps_m52 Steps
	FROM bellabeat_case_study.minute_steps_wide  
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5300 AS DATETIME) Date_minute,
        Steps_m53 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5400 AS DATETIME) Date_minute,
        Steps_m54 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5500 AS DATETIME) Date_minute,
        Steps_m55 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5600 AS DATETIME) Date_minute,
        Steps_m56 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5700 AS DATETIME) Date_minute,
        Steps_m57 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5800 AS DATETIME) Date_minute,
        Steps_m58 Steps
	FROM bellabeat_case_study.minute_steps_wide
UNION
	SELECT
		User_id,
        CAST(Date_hour + 5900 AS DATETIME) Date_minute,
        Steps_m59 Steps
	FROM bellabeat_case_study.minute_steps_wide;