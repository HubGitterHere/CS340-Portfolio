-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/15/2025
-- Copied from /OR/ Adapted from /OR/ Based on 
-- Source URL: https://canvas.oregonstate.edu/courses/2017561/assignments/10111732
-- copied code recommendations from assignment page
-- If AI tools were used: Microsoft Copilot, Google AI Overview
-- (Used Copilot to check for errors in syntax and recommend corrections,
-- specifically correcte variable name mismatch between rows_deleted and rows_affected
-- validation of input_cid in bsg_cert, error handling, and not updating totals without certificate
-- Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP PROCEDURE IF EXISTS sp_delete_cert_person_update_total;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE PROCEDURE sp_delete_cert_person_update_total (
    IN input_cid INT,
    IN input_pid INT
)
BEGIN
    -- Declare a variable to store the number of rows affected by the DELETE
    DECLARE rows_affected INT;
    DECLARE cert_exists INT;

    IF cert_exists = 0 THEN
        SELECT 'Delete error!' AS message;
    ELSE
        -- Attempt to delete the row with the specified cid and pid
        DELETE FROM bsg_cert_people WHERE cid = input_cid AND pid = input_pid;
        -- Get the number of rows affected by the DELETE
        SET rows_affected = ROW_COUNT();
        -- Check if the DELETE was successful
        IF rows_affected > 0 THEN
            CALL sp_update_cert_count_totals();
            -- Return single combined success message
            SELECT 'cert deleted and cert count total updated' AS message;
        ELSE
            -- Return error message
            SELECT 'Delete error!' AS message;
        END IF;
    END IF;
END //


-- ------- Do not alter query code below this line -----------
DELIMITER ;