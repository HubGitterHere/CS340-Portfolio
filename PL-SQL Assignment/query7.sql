-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 
-- Copied from /OR/ Adapted from /OR/ Based on 
-- Source URL: https://canvas.oregonstate.edu/courses/2017561/pages/exploration-pl-slash-sql-part-2-stored-procedures-for-cud?module_item_id=25645141
-- Source URL: https://www.w3schools.com/sql/sql_alter.asp
-- Used for definition and syntax for ALTER TABLE
-- If AI tools were used: Microsoft Copilot, Google AI Overview
-- (Used Copilot to check for errors in syntax and recommend corrections,
-- followed recommendation to remove quotations from cert_total in ALTER TABLE
-- Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP PROCEDURE  IF EXISTS sp_modify_cert_table;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE PROCEDURE sp_modify_cert_table()
BEGIN
    -- Add the new column cert_total to bsg_cert table
    ALTER TABLE bsg_cert ADD COLUMN cert_total INT DEFAULT 0;
END //


-- ------- Do not alter query code below this line -----------
DELIMITER ;
