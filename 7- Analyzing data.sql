-- ANALYZING DATA

-- Now that I have the tables I will analyze [day_activity, hourly_activity and minute_activity] it is time to analyze them. 

-- First I think it is convenient to calculte the median and quadriles with the min and max values of most columns of the day_activity table to get a good sense of their ranges. 

-- Very_active_minutes
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Very_active_minutes
	FROM bellabeat_case_study.day_activity
	WHERE Very_active_minutes is NOT NULL
	ORDER BY Very_active_minutes
) vam
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 0, Q2 = 4 and Q3 = 32. 
SELECT MIN(Very_active_minutes), MAX(Very_active_minutes)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 210
-- What this means is that 25% of the days the amount have 0 minutes with the highest intensity. Also other 25% is equal to or higher than 0 but lower or equal to 4. The next 25% is bigger or equal than 4 but lower or equal than 32. And the 25% of days with the highest amount of very active minutes are bigger or equal than 32 and lower or equal than 210. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity WHERE Very_active_minutes = 0;
-- To be more precise 43,7% of the days the amount of very active minutes is = 0.
SELECT AVG(Very_active_minutes) FROM bellabeat_case_study.day_activity;
-- And the average value is = 21.2269

-- Moderate_active_minutes
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Moderate_active_minutes
	FROM bellabeat_case_study.day_activity
	WHERE Moderate_active_minutes is NOT NULL
	ORDER BY Moderate_active_minutes
) mam
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 0, Q2 = 7 and Q3 = 19. 
SELECT MIN(Moderate_active_minutes), MAX(Moderate_active_minutes)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 148
-- What this means is that 25% of the days the amount have 0 minutes with the intensity = 2. Also other 25% is equal to or higher than 0 but lower or equal to 7. The next 25% is bigger or equal than 7 but lower or equal than 19. And the 25% of days with the highest amount of very active minutes are bigger or equal than 19 and lower or equal than 148. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Moderate_active_minutes = 0;
-- To be more precise 40,86% of the days the amount of moderate active minutes is = 0.
SELECT AVG(Moderate_active_minutes) FROM bellabeat_case_study.day_activity;
-- And the average value is = 13.7395

-- Light_active_minutes
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Light_active_minutes
	FROM bellabeat_case_study.day_activity
	WHERE Light_active_minutes is NOT NULL
	ORDER BY Light_active_minutes
) lam
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 127, Q2 = 199 and Q3 = 236. 
SELECT MIN(Light_active_minutes), MAX(Light_active_minutes)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 548
-- What this means is that 25% of the days the amount have 127 or less minutes with the intensity = 1. Also other 25% is equal to or higher than 127 but lower or equal to 199. The next 25% is bigger or equal than 199 but lower or equal than 236. And the 25% of days with the highest amount of very active minutes are bigger or equal than 236 and lower or equal than 548. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Light_active_minutes = 0;
-- To be more precise 8,82% of the days the amount of moderate active minutes is = 0.
SELECT AVG(Light_active_minutes) FROM bellabeat_case_study.day_activity;
-- And the average value is = 192.6292

-- Sedentary_active_minutes
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Sedentary_active_minutes
	FROM bellabeat_case_study.day_activity
	WHERE Sedentary_active_minutes is NOT NULL
	ORDER BY Sedentary_active_minutes
) sam
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 1116, Q2 = 1185 and Q3 = 1276. 
SELECT MIN(Sedentary_active_minutes), MAX(Sedentary_active_minutes)
FROM bellabeat_case_study.day_activity;
-- So min = 60 and max = 1440
-- What this means is that 25% of the days the amount have 1116 or less minutes with the intensity = 0. Also other 25% is equal to or higher than 1116 but lower or equal to 1185. The next 25% is bigger or equal than 1185 but lower or equal than 1276. And the 25% of days with the highest amount of very active minutes are bigger or equal than 1276 and lower or equal than 1440. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Sedentary_active_minutes = 0;
-- To be more precise 0% of the days the amount of sedentary active minutes is = 0.
SELECT AVG(Sedentary_active_minutes) FROM bellabeat_case_study.day_activity;
-- And the average value is = 1186.5011.

-- Very_active_steps
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Very_active_steps
	FROM bellabeat_case_study.day_activity
	WHERE Very_active_steps is NOT NULL
	ORDER BY Very_active_steps
) vas
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 0, Q2 = 302 and Q3 = 3015. 
SELECT MIN(Very_active_steps), MAX(Very_active_steps)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 27068
-- What this means is that 25% of the days the amount have 0 steps with the intensity = 3. Also other 25% is equal to or higher than 0 but lower or equal to 302. The next 25% is bigger or equal than 302 but lower or equal than 3015. And the 25% of days with the highest amount of very active minutes are bigger or equal than 3015 and lower or equal than 27068. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Very_active_steps = 0;
-- To be more precise 44.01% of the days the amount of very active steps is = 0.
SELECT AVG(Very_active_steps) FROM bellabeat_case_study.day_activity;
-- And the average value is = 1969.3319

-- Moderate_active_steps
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Moderate_active_steps
	FROM bellabeat_case_study.day_activity
	WHERE Moderate_active_steps is NOT NULL
	ORDER BY Moderate_active_steps
) mas
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 0, Q2 = 343 and Q3 = 1126. 
SELECT MIN(Moderate_active_steps), MAX(Moderate_active_steps)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 9998
-- What this means is that 25% of the days the amount have 0 steps with the intensity = 2. Also other 25% is equal to or higher than 0 but lower or equal to 343. The next 25% is bigger or equal than 343 but lower or equal than 1126. And the 25% of days with the highest amount of very active minutes are bigger or equal than 1126 and lower or equal than 9998. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Moderate_active_steps = 0;
-- To be more precise 40.97% of the days the amount of moderate active minutes is = 0.
SELECT AVG(Moderate_active_steps) FROM bellabeat_case_study.day_activity;
-- And the average value is = 817.4706

-- Light_active_steps
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Light_active_steps
	FROM bellabeat_case_study.day_activity
	WHERE Light_active_steps is NOT NULL
	ORDER BY Light_active_steps
) mas
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 2806, Q2 = 4915 and Q3 = 6879. 
SELECT MIN(Light_active_steps), MAX(Light_active_steps)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 15050
-- What this means is that 25% of the days the amount have 2806 or less steps with the intensity = 1. Also other 25% is equal to or higher than 2806 but lower or equal to 4915. The next 25% is bigger or equal than 4915 but lower or equal than 6879. And the 25% of days with the highest amount of very active minutes are bigger or equal than 6879 and lower or equal than 15050. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Light_active_steps = 0;
-- To be more precise 8.82% of the days the amount of light active minutes is = 0.
SELECT AVG(Light_active_steps) FROM bellabeat_case_study.day_activity;
-- And the average value is = 4765.5368

-- Sedentary_active_steps
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Sedentary_active_steps
	FROM bellabeat_case_study.day_activity
	WHERE Sedentary_active_steps is NOT NULL
	ORDER BY Sedentary_active_steps
) mas
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 0, Q2 = 0 and Q3 = 0. 
SELECT MIN(Sedentary_active_steps), MAX(Sedentary_active_steps)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 232
-- What this means is that 75% of the days the amount have 0 steps with the intensity = 0. And the 25% of days with the highest amount of very active minutes are  lower or equal than 232. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Sedentary_active_steps = 0;
-- To be more precise 88.03% of the days the amount of sedentary active minutes is = 0.
SELECT AVG(Sedentary_active_steps) FROM bellabeat_case_study.day_activity;
-- And the average value is = 2.3078

-- Total_steps
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Total_steps
	FROM bellabeat_case_study.day_activity
	WHERE Total_steps is NOT NULL
	ORDER BY Total_steps
) mas
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 3672, Q2 = 7328 and Q3 = 10694. 
SELECT MIN(Total_steps), MAX(Total_steps)
FROM bellabeat_case_study.day_activity;
-- So min = 0 and max = 36019
-- What this means is that 25% of the days the amount have 3672 or less steps. Also other 25% is equal to or higher than 3672 but lower or equal to 7328. The next 25% is bigger or equal than 7328 but lower or equal than 10694. And the 25% of days with the highest amount of very active minutes are bigger or equal than 10694 and lower or equal than 36019. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Total_steps = 0;
-- To be more precise 8.82% of the days the amount of steps is = 0.
SELECT AVG(Total_steps) FROM bellabeat_case_study.day_activity;
-- And the average value is = 7554.6471

-- Total_calories
SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		User_id,
		Date,
		@row_num := @row_num + 1 row_num, 
		Total_calories
	FROM bellabeat_case_study.day_activity
	WHERE Total_calories is NOT NULL
	ORDER BY Total_calories
) mas
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num*3/4));
-- So Q1 = 1830.6783, Q2 = 2123.8818 and Q3 = 2783.0802. 
SELECT MIN(Total_calories), MAX(Total_calories)
FROM bellabeat_case_study.day_activity;
-- So min = 64.8720 and max = 4552.3537
-- What this means is that 25% of the days have 64.8720 or more and 1830.6783 or less calories burned. Also other 25% is equal to or higher than 1830.6783 but lower or equal to 2123.8818. The next 25% is bigger or equal than 2123.8818 but lower or equal than 2783.0802. And the 25% of days with the highest amount of very active minutes are bigger or equal than 2783.0802 and lower or equal than 4552.3537. 
SELECT COUNT(*)/@row_num FROM bellabeat_case_study.day_activity 
WHERE Total_calories = 0;
-- To be more precise 0% of the days the amount of steps is = 0.
SELECT AVG(Total_calories) FROM bellabeat_case_study.day_activity;
-- And the average value is = 2293.65975777

-- For me to have these results more at hand I will create a temporary table and insert them there.
CREATE TEMPORARY TABLE bellabeat_case_study.day_quartiles_median
(
	Column_name VARCHAR(30),
    Min_value DECIMAL(9,4),
    Quartile_1 DECIMAL(9,4),
    Median DECIMAL(9,4),
    Quartile_3 DECIMAL(9,4),
    Max_value DECIMAL(9,4),
    Average DECIMAL(9,4)
);
INSERT INTO bellabeat_case_study.day_quartiles_median 
VALUES ('Very_active_minutes', 0, 0, 4, 32, 210, 21.2269),
	   ('Moderate_active_minutes', 0, 0, 7, 19, 148, 13.7395),
       ('Light_active_minutes', 0, 123, 199, 236, 548, 192.6292),
       ('Sedentary_active_minutes', 60, 1116, 1185, 1276, 1440, 1186.5011),
       ('Very_active_steps', 0, 0, 302, 3015, 27068, 1969.3319),
       ('Moderate_active_steps', 0, 0, 343, 1126, 9998, 817.4706),
       ('Light_active_steps', 0, 2806, 4915, 6879, 15050, 4765.5368),
       ('Sedentary_active_steps', 0, 0, 0, 0, 232, 2.3078),
       ('Total_steps', 0, 3672, 7382, 10694, 36019, 7554.6471),
       ('Total_calories', 64.8720, 1830.6783, 2123.8818, 2783.0802, 4552.3537, 2293.6598);

-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------

-- Now that I have a better understanding of the ranges of values o the different columns I want to know if there is any relation between the intensity and the calories burned, amount of steps or METs. 

-- Calories, Intensity = 0
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Calories
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 0
    ORDER BY Calories
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 0.9337, Q2 = 1.1415 and Q3 = 1.3754
SELECT MIN(Calories), MAX(Calories), ROUND(AVG(Calories),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 0;
-- Min = 0, Max = 2.1079, Avg = 1.1518

-- Calories, Intensity = 1
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Calories
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 1
    ORDER BY Calories
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 2.4943, Q2 = 3.1697 and Q3 = 3.9348
SELECT MIN(Calories), MAX(Calories), ROUND(AVG(Calories),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 1;
-- Min = 1.6865, Max = 16.5048, Avg = 3.4415

-- Calories, Intensity = 2
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Calories
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 2
    ORDER BY Calories
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 4.1262, Q2 = 5.2931 and Q3 = 6.1368
SELECT MIN(Calories), MAX(Calories), ROUND(AVG(Calories),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 2;
-- Min = 2.5297, Max = 8.7087, Avg = 5.2114

-- Calories, Intensity = 3
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Calories
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 3
    ORDER BY Calories
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 7.0309, Q2 = 8.8522 and Q3 = 10.5333
SELECT MIN(Calories), MAX(Calories), ROUND(AVG(Calories),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 3;
-- Min = 4.2162, Max = 19.7499, Avg = 9.0704
 
-- Steps, Intensity = 0
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Steps
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 0
    ORDER BY Steps
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 0, Q2 = 0 and Q3 = 0
SELECT MIN(Steps), MAX(Steps), ROUND(AVG(Steps),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 0;
-- Min = 0, Max = 93, Avg = 0.0019

-- Steps, Intensity = 1
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Steps
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 1
    ORDER BY Steps
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 8, Q2 = 18 and Q3 = 34
SELECT MIN(Steps), MAX(Steps), ROUND(AVG(Steps),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 1;
-- Min = 0, Max = 180, Avg = 24.7394

-- Steps, Intensity = 2
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Steps
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 2
    ORDER BY Steps
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 44, Q2 = 63 and Q3 = 77
SELECT MIN(Steps), MAX(Steps), ROUND(AVG(Steps),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 2;
-- Min = 0, Max = 133, Avg = 59.4979

-- Steps, Intensity = 3
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, Steps
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 3
    ORDER BY Steps
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 69, Q2 = 105 and Q3 = 120
SELECT MIN(Steps), MAX(Steps), ROUND(AVG(Steps),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 3;
-- Min = 0, Max = 220, Avg = 92.7753

-- METs, Intensity = 0
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, METs
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 0
    ORDER BY METs
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 10, Q2 = 10 and Q3 = 10
SELECT MIN(METs), MAX(METs), ROUND(AVG(METs),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 0;
-- Min = 0, Max = 15, Avg = 10.3532

-- METs, Intensity = 1
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, METs
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 1
    ORDER BY METs
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 26, Q2 = 29 and Q3 = 34
SELECT MIN(METs), MAX(METs), ROUND(AVG(METs),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 1;
-- Min = 16, Max = 129, Avg = 31.9651

-- METs, Intensity = 2
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, METs
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 2
    ORDER BY METs
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 42, Q2 = 50 and Q3 = 54
SELECT MIN(METs), MAX(METs), ROUND(AVG(METs),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 2;
-- Min = 36, Max = 59, Avg = 48.3725

-- METs, Intensity = 3
SET @row_num = 0;
SELECT *
FROM
(
	SELECT @row_num := @row_num + 1 row_num, METs
    FROM bellabeat_case_study.minute_activity
    WHERE Intensity = 3
    ORDER BY METs
) mc_i0
WHERE row_num IN (FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 66, Q2 = 74 and Q3 = 85
SELECT MIN(METs), MAX(METs), ROUND(AVG(METs),4)
FROM bellabeat_case_study.minute_activity
WHERE Intensity = 3;
-- Min = 60, Max = 157, Avg = 78.6399

CREATE TEMPORARY TABLE bellabeat_case_study.minute_intensity_quar_median
(
	Intensity INT,
    Column_name VARCHAR(10),
    Min_value DECIMAL(8,4),
    Quartile_1 DECIMAL(8,4),
    Median DECIMAL(8,4),
    Quartile_3 DECIMAL(8,4),
    Max_value DECIMAL(8,4),
    Average DECIMAL(8,4)
);
INSERT INTO bellabeat_case_study.minute_intensity_quar_median
VALUES 
	(0, 'Calories', 0, 0.9337, 1.1415, 1.3754, 2.1079, 1.1518),
    (1, 'Calories', 1.6865, 2.4943, 3.1697, 3.9348, 16.5048, 3.4415), 
    (2, 'Calories', 2.5297, 4.1262, 5.2931, 6.1368, 8.7087, 5.2114),
    (3, 'Calories', 4.2162, 7.0309, 8.8522, 10.5333, 19.7499, 9.0704),
    (0, 'Steps', 0, 0, 0, 0, 93, 0.0019),
    (1, 'Steps', 0, 8, 18, 34, 180, 24.7394),
    (2, 'Steps', 0, 44, 63, 77, 133, 59.4979),
    (3, 'Steps', 0, 69, 105, 120, 220, 92.7753),
    (0, 'METs', 0, 10, 10, 10, 15, 10.3532),
    (1, 'METs', 16, 26, 29, 34, 129, 31.9651),
    (2, 'METs', 36, 42, 50, 54, 59, 48.3725),
    (3, 'METs', 60, 66, 74, 85, 157, 78.6399);

SELECT 
	Intensity, Min_value, Quartile_1, 
    Median, Quartile_3, Max_value, Average
FROM bellabeat_case_study.minute_intensity_quar_median
WHERE Column_name = 'Calories';
-- As we can see from this table as the intensity of the activity rises also rises the calories burned in that minute. We can see this because the average calories burned in a minute for a certain intensity rises (1.1518 -> 3.4415 -> 5.2114 -> 9.0704). We can also notice that the 1st quartile and 3rd quartile (these values create a range that contains 50% of the original values) create ranges of values that doesn't have any intersections with the other ranges, meaning the 3rd quartile from intensity 0 is lower than the 1st quartile of intensity 1.
-- The thing is that because there are values for one intensity that are higher than other values of a higher intensity, we can't determine for sure which intensity has one certain minute based in the amount of calories burned in that minute.

SELECT 
	Intensity, Min_value, Quartile_1, 
    Median, Quartile_3, Max_value, Average
FROM bellabeat_case_study.minute_intensity_quar_median
WHERE Column_name = 'Steps';
-- Something similar happens with the amount of steps. The average value increses when the intensity increses and there are certain ranges that the values for certain intensities are more probable to be found in. 
-- The only thing is that for the intensity 2 and 3 their ranges determined by their 1st and 3rd quartile have an intersection, so the amount of steps taken in a minute is even more unreliable method to determine the intensity of the activity in a minute than the amount of calories burned. 

SELECT 
	Intensity, Min_value, Quartile_1, 
    Median, Quartile_3, Max_value, Average
FROM bellabeat_case_study.minute_intensity_quar_median
WHERE Column_name = 'METs';
-- With the METs for a certain minute happens a similar case than from the calories burned.

-- In the overall I can say that as the intensity value increses it also increases, generally speacking, the amount of calories burned, the amount of steps taken and the METs.

-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
-- ---------------------------------------------------
	
-- According to the information provided by the Mayo Clinic about weight loss on their web site <https://www.mayoclinic.org/> in their article "Exercise for weight loss: Calories burned in 1 hour" a light physical activity consumes at least around 300 calories for a person that is around 73 kg. 

SELECT Average * 60 hour_calories_avg
FROM bellabeat_case_study.minute_intensity_quar_median
WHERE Column_name = 'Calories';

-- With this information I will supose that the intensities 2 and 3 refers to physical activity, because the average multiplied by 60 is greater than 300. Now I want to know how much minutes a day the users spend exercising.

SET @row_num = 0;
SELECT *
FROM
(
	SELECT 
		@row_num := @row_num + 1 row_num, 
		Very_active_minutes + Moderate_active_minutes Physical_minutes
    FROM bellabeat_case_study.day_activity
    ORDER BY Physical_minutes
) pm
WHERE row_num IN 
	(FLOOR(@row_num/4),FLOOR(@row_num/2),FLOOR(@row_num/4*3));
-- Q1 = 0, Q2 = 21 and Q3 = 58
SELECT 
	MIN(Very_active_minutes + Moderate_active_minutes), -- Min = 0
	MAX(Very_active_minutes + Moderate_active_minutes), -- Max = 275
    ROUND(AVG(Very_active_minutes + Moderate_active_minutes)) -- Avg ~= 35
FROM bellabeat_case_study.day_activity;

SET @tot_row = (SELECT COUNT(*) FROM bellabeat_case_study.day_activity);
SELECT 
	ROUND(SUM(CASE WHEN Very_active_minutes + Moderate_active_minutes = 0 THEN 1 ELSE 0 END) / @tot_row * 100, 2) Equal_0,
    ROUND(SUM(CASE WHEN Very_active_minutes + Moderate_active_minutes > 0 AND Very_active_minutes + Moderate_active_minutes <= 30 THEN 1 ELSE 0 END) / @tot_row * 100, 2) Greater_0_lower_30,
    ROUND(SUM(CASE WHEN Very_active_minutes + Moderate_active_minutes > 30 THEN 1 ELSE 0 END) / @tot_row * 100, 2) Greater_30
FROM bellabeat_case_study.day_activity;
-- =0 -> 40.34% ; 0< x <=30 -> 18.17% ; <30 -> 41.49%

-- From the previous queries now I know that ~40% of the days our user do no physical activity, ~17% of the days they do less than 30 minutes of physical activity and ~41% of the days our users do more than 30 minutes of physical activity. The average of the amount of minutes per day from all of our users is around 35 minutes. Also the maximum amount of minutes in a day spent in physical activity is 275 and the 25% of days that have the most minutes of physical activity have at least 58 minutes. 

-- Knowing this I want to know when along the day our users exercise more often.

SELECT
	HOUR(Date_minute) Hour,
    SUM(CASE WHEN Intensity = 2 OR Intensity = 3 THEN 1 ELSE 0 END) Amount_minutes
FROM bellabeat_case_study.minute_activity
GROUP BY Hour
ORDER BY Amount_minutes DESC;

-- From this query I see that the most popular times to do exercise are in the afternoon, then the midday and then the morning.