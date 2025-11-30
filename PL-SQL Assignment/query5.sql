-- Note: Only use single-line comments in this file.

-- Citation for the following code: PL/SQL Quick Start Guide
-- Date: 11/14/2025
-- Copied from /OR/ Adapted from /OR/ Based on 
-- Source URL: https://canvas.oregonstate.edu/courses/2017561/pages/exploration-pl-slash-sql-quick-start-guide?module_item_id=25842917
-- Used for understanding definition and syntax for UPDATE and COMMIT terms.
-- If AI tools were used: Microsoft Copilot, Google AI Overview
-- (Used Copilot to check for errors in syntax and recommend corrections,
-- Corrections include fixing nested SELECT in Function call:
-- SELECT func_cert_count(SELECT title FROM bsg_cert WHERE id = cer_id) AS cert_count;
-- To DECLARE cert_title VARCHAR(255);
-- SELECT title INTO cert_title FROM bsg_cert WHERE id = cert_id; Commit;
-- SELECT func_cert_count(cert_title) AS cert_count;
-- fixed parameter order in INSERT statement on line 52
-- Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP PROCEDURE IF EXISTS sp_add_person_certification;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE PROCEDURE sp_add_person_certification (
    IN person_id INT,
    IN cert_id INT
)
BEGIN
    DECLARE cert_exists INT;
    DECLARE cert_title VARCHAR(255);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback the transaction in case of an error
        ROLLBACK;
        -- Return -99 to indicate an error
        SELECT -99 AS cert_count;
    END;

    -- Start a transaction
    START TRANSACTION;

    -- Check if the certification exists
    SELECT COUNT(*) INTO cert_exists FROM bsg_cert WHERE id = cert_id;
    IF cert_exists = 0 THEN
    
        -- If the certification does not exist, rollback and return -99
        ROLLBACK;
        SELECT -99 AS cert_count;
    ELSE
        -- If the certification exists, insert the new certification for the person
        INSERT INTO bsg_cert_people (cid, pid) VALUES (cert_id, person_id);
        -- Commit the transaction
        COMMIT;
        -- Return the count of people with the new certification
        SELECT title INTO cert_title FROM bsg_cert WHERE id = cert_id;
        COMMIT;
        SELECT func_cert_count(cert_title) AS cert_count;
    END IF;
END //


-- ------- Do not alter query code below this line -----------
DELIMITER ;