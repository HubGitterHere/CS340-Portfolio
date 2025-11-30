-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/16/2025
-- Copied from /OR/ Adapted from /OR/ Based on 
-- Source URL: https://www.w3schools.com/mysql/mysql_exists.asp
-- Used for definition and syntax for UPDATE term
-- If AI tools were used: Microsoft Copilot, Google AI Overview
-- (Used Copilot to check for errors in syntax and recommend corrections,
-- corrections done include storing SELECT COUNT results into new world_count INt,
-- completing UPDATE bsg_people SET homeworld, and changing
-- UPDATE bsg_people SET homeworld = myworld WHER id = person_id; into
-- UPDATE bsg_people SET homeworld = world_id WHERE id = person_id;
-- Checked for Test update using invalid planet name, updated
-- code to check for null value
-- Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP PROCEDURE IF EXISTS sp_update_person_homeworld;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE PROCEDURE sp_update_person_homeworld(
    IN person_id INT,
    IN myworld VARCHAR(255)
)
BEGIN
    DECLARE world_id INT;
    DECLARE world_count INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Update error!' AS result;
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    -- Handle NULL input
    IF myworld IS NULL THEN
        UPDATE bsg_people SET homeworld = NULL WHERE id = person_id;
    ELSE
        -- Check if myworld is an integer
        IF myworld REGEXP '^[0-9]+$' THEN
            SET world_id = CAST(myworld AS UNSIGNED);
            
            -- Check if world_id exists as a planet, if so, update bsg_people
            SELECT COUNT(*) INTO world_count FROM bsg_planets WHERE id = world_id;
            IF world_count > 0 THEN
                UPDATE bsg_people SET homeworld = world_id WHERE id = person_id;
            -- else, return error
            ELSE
                SELECT 'Update error!' AS result;
            END IF;
        ELSE
            -- myworld is assumed to be a name, therefore proceed:
            -- Get the ID value of a planet with the name matching myworld's value
             SET world_id = (SELECT id FROM bsg_planets WHERE name = myworld);

             IF world_id IS NULL THEN
                ROLLBACK;
                SELECT 'Update error!' AS result;
            -- Update the person's homeworld in bsg_people
            ELSE
                UPDATE bsg_people SET homeworld = world_id WHERE id = person_id;
            END IF;  
        END IF;
    END IF;
    
    -- Return the updated person's details
    SELECT 
        p.fname,
        p.lname,
        CASE WHEN p.age IS NULL THEN 'NULL' ELSE CAST(p.age AS CHAR) END as age,
        CASE WHEN pl.name IS NULL THEN 'NULL' ELSE pl.name END as homeworld
    FROM bsg_people p
    LEFT JOIN bsg_planets pl ON p.homeworld = pl.id
    WHERE p.id = person_id;
    
    COMMIT;
END //

-- ------- Do not alter query code below this line -----------
DELIMITER ;