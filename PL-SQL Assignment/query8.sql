-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/14/2025
-- Copied from /OR/ Adapted from /OR/ Based on 
-- Source URL: https://canvas.oregonstate.edu/courses/2017561/pages/exploration-pl-slash-sql-quick-start-guide?module_item_id=25842917
-- Copied code for sp_update_rentalCount() but modified terms to reflect bsg_cert
-- If AI tools were used: Microsoft Copilot, Google AI Overview
-- (Used Copilot to check for errors in syntax and recommend corrections,
-- corrected bsg_cert.cert_total = total to cert.cert_total = certPerson.total,
-- Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP PROCEDURE IF EXISTS sp_update_cert_count_totals;
DELIMITER //

-- ------- Write your code below this line -----------
CREATE PROCEDURE sp_update_cert_count_totals()
BEGIN
    -- Update the cert_total column with the count of people holding each certificate
    UPDATE bsg_cert cert 
    LEFT JOIN(
        SELECT cid, COUNT(*) as total
        FROM bsg_cert_people
        GROUP BY cid
    ) certPerson ON cert.id = certPerson.cid SET cert.cert_total = certPerson.total;
END //


-- ------- Do not alter query code below this line -----------
DELIMITER ;