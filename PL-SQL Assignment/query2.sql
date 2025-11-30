-- Note: Only use single-line comments in this file.

-- Citation for the following code:
-- Date: 11/13/2025
-- Copied from /OR/ Adapted from /OR/ Based on 
-- based of my submitted code in query3.sql for intermediate_quiz
-- If AI tools were used: Google AI Overview
-- (Used Google AI to define terms and provide examples of code structures)


-- Leave the following query code untouched
DROP VIEW  IF EXISTS v_cert_people;

-- ------- Write your code below this line -----------
CREATE VIEW v_cert_people AS
SELECT bsg_cert.title, bsg_people.fname, bsg_people.lname, bsg_planets.name AS planet_name
    -- columns here
FROM bsg_cert_people
    -- table here
JOIN bsg_cert ON bsg_cert_people.cid = bsg_cert.id
    -- table join here
JOIN bsg_people ON bsg_cert_people.pid = bsg_people.id
    -- table join here
LEFT JOIN bsg_planets ON bsg_people.homeworld = bsg_planets.id;
    -- table join here
-- ORDER BY 
    -- order by column here
