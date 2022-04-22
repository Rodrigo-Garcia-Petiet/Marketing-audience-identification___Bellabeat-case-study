-- TABLES FOR VISUALIZATION

SELECT 
	User_id,
    Date,
    CASE
		WHEN (Very_active_minutes + Moderate_active_minutes = 0) THEN "Equal 0"
        WHEN (Very_active_minutes + Moderate_active_minutes <= 30) THEN "Less 30"
        WHEN (Very_active_minutes + Moderate_active_minutes > 30) THEN "More 30"
	END Active_minutes
FROM bellabeat_case_study.day_activity;

SELECT
	HOUR(Date_minute) Hour,
    SUM(CASE WHEN Intensity = 2 OR Intensity = 3 THEN 1 ELSE 0 END) Amount_minutes
FROM bellabeat_case_study.minute_activity
GROUP BY Hour
ORDER BY Amount_minutes DESC;

SELECT 
	User_id, 
    Date,
    Very_active_minutes + Moderate_active_minutes Amount_minutes
FROM bellabeat_case_study.day_activity
ORDER BY Amount_minutes;
