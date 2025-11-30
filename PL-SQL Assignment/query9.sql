-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/14/2025
-- Copied from /OR/ Adapted from /OR/ Based on Exploration: PL/SQL quick start guide
-- based off example from Trigger section
-- Source URL: https://canvas.oregonstate.edu/courses/2017561/pages/exploration-pl-slash-sql-part-2-stored-procedures-for-cud?module_item_id=25645141
-- Source URL: https://www.geeksforgeeks.org/mysql/mysql-after-insert-trigger/
-- If AI tools were used: <icrosoft Copilot, Google AI Overview
-- (Used Microsoft Copilot for finding errors
-- added timing clause
-- Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP TRIGGER IF EXISTS trigger_after_cert_person_inserted;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE TRIGGER trigger_after_cert_person_inserted
AFTER INSERT ON bsg_cert_people
    -- CALL sp_update_cert_count_totals(); in the trigger body
FOR EACH ROW
BEGIN
    CALL sp_update_cert_count_totals();
END //

-- ------- Do not alter query code below this line -----------
DELIMITER ;