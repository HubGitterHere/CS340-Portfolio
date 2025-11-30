-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/13/2025
-- Copied from /OR/ Adapted from /OR/ Based on PL/SQL Quick Start Guide
-- Source URL: https://canvas.oregonstate.edu/courses/2017561/pages/exploration-pl-slash-sql-quick-start-guide?module_item_id=25842917
-- Based structure of query off of example code
-- If AI tools were used: Google AI Overview
-- (Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP PROCEDURE IF EXISTS sp_insert_person;
DELIMITER //

-- ------- Write your code below this line -----------

CREATE PROCEDURE sp_insert_person(
    IN fname VARCHAR(255),
    IN lname VARCHAR(255),
    IN age INT,
    IN homeworld INT,
    IN cert_id INT,
    OUT person_id INT
)
DETERMINISTIC
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- In case of an error, set the person_id to -99
        SET person_id = -99;
        ROLLBACK;
    END;

    START TRANSACTION;
    
    -- Insert into bsg_people table
        INSERT INTO bsg_people (fname, lname, age, homeworld) VALUES(fname, lname, age, homeworld);
    -- Get the last inserted id
        SET person_id = LAST_INSERT_ID();
    -- Insert into bsg_cert_people table
        INSERT INTO bsg_cert_people (cid, pid) VALUES(cert_id, person_id);
    COMMIT;
    -- RETURN person_id;
END //


-- ------- Do not alter query code below this line -----------
DELIMITER ;