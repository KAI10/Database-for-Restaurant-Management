CREATE OR REPLACE 
function getDeptName(id IN NUMBER) RETURN VARCHAR2 IS
ret VARCHAR2(30);
BEGIN
SELECT "dept_name" INTO ret
FROM "rDepartment"
WHERE "dept_id" = id;
return ret;

END getDeptName;
