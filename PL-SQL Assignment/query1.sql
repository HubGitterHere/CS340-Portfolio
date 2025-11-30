-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/13/2025
-- Copied from /OR/ Adapted from /OR/ Based on 
-- based code of examples within w3schools.com references
-- Source URL: https://www.w3schools.com/sql/func_mysql_hour.asp
-- Source URL: https://www.w3schools.com/sql/sql_ref_set.asp
-- Source URL: https://www.w3schools.com/sql/func_mysql_str_to_date.asp
-- used for context on statements used
-- Source URL: https://www.geeksforgeeks.org/sql/mysql-if-if-then-if-then-else-and-if-then-elseif-else-statement/
-- Checked for ELSEIF Statement and proper syntax
-- If AI tools were used: Google AI Overview
-- (Used Google AI to define terms and provide examples of code structuresl)


-- Leave the following query code untouched
DROP PROCEDURE IF EXISTS sp_query1;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE PROCEDURE sp_query1 (IN timeNow VARCHAR(4), OUT greeting VARCHAR(50))
DETERMINISTIC
BEGIN
    DECLARE current_hour INT;
    DECLARE formatted_time TIME;
    
    -- Validate input format
    IF LENGTH(timeNow) != 4 OR timeNow NOT REGEXP '^[0-2][0-9][0-5][0-9]$' THEN
        SET greeting = 'Invalid time format. Please use HHMM.';
    ELSE

        -- Convert the input timeNow to TIME format
        SET formatted_time = (SELECT STR_TO_DATE(timeNow, "%H%i"));
        SET current_hour = (SELECT HOUR(formatted_time));
        -- Check for valid time range
        IF current_hour < 00 OR current_hour > 24 THEN
            SET greeting = 'Invalid time format. Please use HHMM.';
        -- SET OUTVAR 'greeting' to a string value based on current_hour
            -- e.g. SET greeting = 'Good evening';
        ELSEIF current_hour >= 06 AND current_hour < 12 THEN
            SET greeting = 'Good morning'; 
        ELSEIF current_hour >= 12 AND current_hour < 17 THEN
            SET greeting = 'Good afternoon';
        ELSEIF current_hour >= 17 AND current_hour < 24 THEN
            SET greeting = 'Good evening';
        ELSEIF current_hour < 06 THEN
            SET greeting = "My it's late, shouldn't you be in bed?";
        END IF;

    END IF;
END //
-- ------- Do not alter query code below this line -----------
DELIMITER ;