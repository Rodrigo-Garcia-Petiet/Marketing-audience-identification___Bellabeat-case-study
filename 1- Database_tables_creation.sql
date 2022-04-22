-- DATABASE AND TABLES CREATION
-- In this script I will create the database for the bellabeat's study case proposed by Google and Coursera. Apart of the database I will create the basic tables and import them data.
CREATE DATABASE bellabeat_case_study;
USE bellabeat_case_study;
-- ----------------------------------------------------------------------
CREATE TABLE daily_activity
(
	User_id BIGINT NOT NULL,
    Date DATE NOT NULL,
    Total_steps INT,
    Total_distance DOUBLE,
    Tracker_distance DOUBLE,
    Logged_activities_distance DOUBLE,
    Very_active_distance DECIMAL(6,4),
    Moderately_active_distance DECIMAL(6,4),
    Light_active_distance DECIMAL(6,4),
    Sedentary_active_distance DECIMAL(6,4),
    Very_active_minutes INT,
    Moderately_active_minutes INT,
    Light_active_minutes INT,
    Sedentary_active_mintes INT,
    Calories INT,
    PRIMARY KEY (User_id, Date)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/daily_activity.csv'
	INTO TABLE daily_activity
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE daily_calories
(
    User_id BIGINT,
    Date DATE,
    Calories INT,
    PRIMARY KEY (User_id, Date)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/daily_calories.csv'
	INTO TABLE daily_calories
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE daily_intensities
(
    User_id BIGINT,
    Date DATE,
    Sedentary_active_mintes INT,
    Light_active_minutes INT,
    Moderately_active_minutes INT,
    Very_active_minutes INT,
    Sedentary_active_distance DECIMAL(6,4),
    Light_active_distance DECIMAL(6,4),
    Moderately_active_distance DECIMAL(6,4),
    Very_active_distance DECIMAL(6,4),    
    PRIMARY KEY (User_id, Date)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/daily_intensities.csv'
	INTO TABLE daily_intensities
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE daily_steps
(
    User_id BIGINT,
    Date DATE,
    Total_steps INT,
    PRIMARY KEY (User_id, Date)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/daily_steps.csv'
	INTO TABLE daily_steps
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE heartrate_seconds
(
    User_id BIGINT,
    Date_time DATETIME,
    Heartrate INT,
    PRIMARY KEY (User_id, Date_time)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/heartrate_seconds.csv'
	INTO TABLE heartrate_seconds 
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE hourly_calories
(
    User_id BIGINT,
    Date_hour DATETIME,
    Calories INT,
    PRIMARY KEY (User_id, Date_hour)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/hourly_calories.csv'
	INTO TABLE hourly_calories
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE hourly_intensities
(
	User_id BIGINT,
    Date_hour DATETIME,
    Total_intensity INT,
    Average_intensity DECIMAL(7,6),
    PRIMARY KEY (User_id, Date_hour)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/hourly_intensities.csv'
	INTO TABLE hourly_intensities
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE hourly_steps
(
	User_id BIGINT,
    Date_hour DATETIME,
    Total_steps INT,
    PRIMARY KEY (User_id, Date_hour)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/hourly_steps.csv'
	INTO TABLE hourly_steps
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_calories_narrow
(
    User_id BIGINT,
    Date_minute DATETIME,
    Calories DECIMAL(6,4),
    PRIMARY KEY (User_id, Date_minute)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_calories_narrow.csv'
	INTO TABLE minute_calories_narrow
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_calories_wide
(
    User_id BIGINT,
    Date_hour DATETIME,
    Calories_m00 DECIMAL(6,4),
    Calories_m01 DECIMAL(6,4),
    Calories_m02 DECIMAL(6,4),
    Calories_m03 DECIMAL(6,4),
    Calories_m04 DECIMAL(6,4),
    Calories_m05 DECIMAL(6,4),
    Calories_m06 DECIMAL(6,4),
    Calories_m07 DECIMAL(6,4),
    Calories_m08 DECIMAL(6,4),
    Calories_m09 DECIMAL(6,4),
    Calories_m10 DECIMAL(6,4),
    Calories_m11 DECIMAL(6,4),
    Calories_m12 DECIMAL(6,4),
    Calories_m13 DECIMAL(6,4),
    Calories_m14 DECIMAL(6,4),
    Calories_m15 DECIMAL(6,4),
    Calories_m16 DECIMAL(6,4),
    Calories_m17 DECIMAL(6,4),
    Calories_m18 DECIMAL(6,4),
    Calories_m19 DECIMAL(6,4),
    Calories_m20 DECIMAL(6,4),
    Calories_m21 DECIMAL(6,4),
    Calories_m22 DECIMAL(6,4),
    Calories_m23 DECIMAL(6,4),
    Calories_m24 DECIMAL(6,4),
    Calories_m25 DECIMAL(6,4),
    Calories_m26 DECIMAL(6,4),
    Calories_m27 DECIMAL(6,4),
    Calories_m28 DECIMAL(6,4),
    Calories_m29 DECIMAL(6,4),
    Calories_m30 DECIMAL(6,4),
    Calories_m31 DECIMAL(6,4),
    Calories_m32 DECIMAL(6,4),
    Calories_m33 DECIMAL(6,4),
    Calories_m34 DECIMAL(6,4),
    Calories_m35 DECIMAL(6,4),
    Calories_m36 DECIMAL(6,4),
    Calories_m37 DECIMAL(6,4),
    Calories_m38 DECIMAL(6,4),
    Calories_m39 DECIMAL(6,4),
    Calories_m40 DECIMAL(6,4),
    Calories_m41 DECIMAL(6,4),
    Calories_m42 DECIMAL(6,4),
    Calories_m43 DECIMAL(6,4),
    Calories_m44 DECIMAL(6,4),
    Calories_m45 DECIMAL(6,4),
    Calories_m46 DECIMAL(6,4),
    Calories_m47 DECIMAL(6,4),
    Calories_m48 DECIMAL(6,4),
    Calories_m49 DECIMAL(6,4),
    Calories_m50 DECIMAL(6,4),
    Calories_m51 DECIMAL(6,4),
    Calories_m52 DECIMAL(6,4),
    Calories_m53 DECIMAL(6,4),
    Calories_m54 DECIMAL(6,4),
    Calories_m55 DECIMAL(6,4),
    Calories_m56 DECIMAL(6,4),
    Calories_m57 DECIMAL(6,4),
    Calories_m58 DECIMAL(6,4),
    Calories_m59 DECIMAL(6,4),
    PRIMARY KEY (User_id, Date_hour)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_calories_wide.csv'
	INTO TABLE minute_calories_wide
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_intensities_narrow
(
    User_id BIGINT,
    Date_minute DATETIME,
    Intensity INT,
    PRIMARY KEY (User_id, Date_minute)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_intensities_narrow.csv'
	INTO TABLE minute_intensities_narrow
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_intensities_wide
(
	User_id BIGINT,
    Date_hour DATETIME,
    Intensity_m00 INT,
    Intensity_m01 INT,
    Intensity_m02 INT,
    Intensity_m03 INT,
    Intensity_m04 INT,
    Intensity_m05 INT,
    Intensity_m06 INT,
    Intensity_m07 INT,
    Intensity_m08 INT,
    Intensity_m09 INT,
    Intensity_m10 INT,
    Intensity_m11 INT,
    Intensity_m12 INT,
    Intensity_m13 INT,
    Intensity_m14 INT,
    Intensity_m15 INT,
    Intensity_m16 INT,
    Intensity_m17 INT,
    Intensity_m18 INT,
    Intensity_m19 INT,
    Intensity_m20 INT,
    Intensity_m21 INT,
    Intensity_m22 INT,
    Intensity_m23 INT,
    Intensity_m24 INT,
    Intensity_m25 INT,
    Intensity_m26 INT,
    Intensity_m27 INT,
    Intensity_m28 INT,
    Intensity_m29 INT,
    Intensity_m30 INT,
    Intensity_m31 INT,
    Intensity_m32 INT,
    Intensity_m33 INT,
    Intensity_m34 INT,
    Intensity_m35 INT,
    Intensity_m36 INT,
    Intensity_m37 INT,
    Intensity_m38 INT,
    Intensity_m39 INT,
    Intensity_m40 INT,
    Intensity_m41 INT,
    Intensity_m42 INT,
    Intensity_m43 INT,
    Intensity_m44 INT,
    Intensity_m45 INT,
    Intensity_m46 INT,
    Intensity_m47 INT,
    Intensity_m48 INT,
    Intensity_m49 INT,
    Intensity_m50 INT,
    Intensity_m51 INT,
    Intensity_m52 INT,
    Intensity_m53 INT,
    Intensity_m54 INT,
    Intensity_m55 INT,
    Intensity_m56 INT,
    Intensity_m57 INT,
    Intensity_m58 INT,
    Intensity_m59 INT,
    PRIMARY KEY (User_id, Date_hour)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_intensities_wide.csv'
	INTO TABLE minute_intensities_wide
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_mets_narrow
(
	User_id BIGINT,
    Date_minute DATETIME,
    METs INT,
    PRIMARY KEY (User_id, Date_minute)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_mets_narrow.csv'
	INTO TABLE minute_mets_narrow
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_sleep
(
	ID INT NOT NULL AUTO_INCREMENT,
	User_id BIGINT,
    Date_minute DATETIME,
    Value INT,
    Log_id BIGINT,
    PRIMARY KEY (ID)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_sleep.csv'
	INTO TABLE minute_sleep
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_steps_narrow
(
	User_id BIGINT,
    Date_minute DATETIME,
    Steps INT,
    PRIMARY KEY (User_id, Date_minute)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_steps_narrow.csv'
	INTO TABLE minute_steps_narrow
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE minute_steps_wide
(
	User_id BIGINT,
    Date_hour DATETIME,
    Steps_m00 INT,
    Steps_m01 INT,
    Steps_m02 INT,
    Steps_m03 INT,
    Steps_m04 INT,
    Steps_m05 INT,
    Steps_m06 INT,
    Steps_m07 INT,
    Steps_m08 INT,
    Steps_m09 INT,
    Steps_m10 INT,
    Steps_m11 INT,
    Steps_m12 INT,
    Steps_m13 INT,
    Steps_m14 INT,
    Steps_m15 INT,
    Steps_m16 INT,
    Steps_m17 INT,
    Steps_m18 INT,
    Steps_m19 INT,
    Steps_m20 INT,
    Steps_m21 INT,
    Steps_m22 INT,
    Steps_m23 INT,
    Steps_m24 INT,
    Steps_m25 INT,
    Steps_m26 INT,
    Steps_m27 INT,
    Steps_m28 INT,
    Steps_m29 INT,
    Steps_m30 INT,
    Steps_m31 INT,
    Steps_m32 INT,
    Steps_m33 INT,
    Steps_m34 INT,
    Steps_m35 INT,
    Steps_m36 INT,
    Steps_m37 INT,
    Steps_m38 INT,
    Steps_m39 INT,
    Steps_m40 INT,
    Steps_m41 INT,
    Steps_m42 INT,
    Steps_m43 INT,
    Steps_m44 INT,
    Steps_m45 INT,
    Steps_m46 INT,
    Steps_m47 INT,
    Steps_m48 INT,
    Steps_m49 INT,
    Steps_m50 INT,
    Steps_m51 INT,
    Steps_m52 INT,
    Steps_m53 INT,
    Steps_m54 INT,
    Steps_m55 INT,
    Steps_m56 INT,
    Steps_m57 INT,
    Steps_m58 INT,
    Steps_m59 INT,
    PRIMARY KEY (User_id, Date_hour)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/minute_steps_wide.csv'
	INTO TABLE minute_steps_wide
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE sleep_day
(
	ID INT NOT NULL AUTO_INCREMENT,
    User_id BIGINT,
    Date DATETIME,
    Total_sleep_records INT,
    Total_minutes_asleep INT,
    Total_minutes_in_bed INT,
    PRIMARY KEY (ID)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/sleep_day.csv'
	INTO TABLE sleep_day
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
-- ----------------------------------------------------------------------
CREATE TABLE weight_log_info
(
	ID INT NOT NULL AUTO_INCREMENT,
    User_id BIGINT,
    Date_time DATETIME,
    Weight_kg DOUBLE,
    Weight_pounds DOUBLE,
    Fat INT,
    bmi DOUBLE,
    Is_manual_report BOOL,
    Log_id BIGINT,
    PRIMARY KEY (ID)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bellabeat_case_study/weight_log_info.csv'
	INTO TABLE weight_log_info
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;