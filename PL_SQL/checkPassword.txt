create or replace function checkPassword(usrname IN varchar2, pass IN varchar2) return NUMBER IS
curPassword VARCHAR2(10);
BEGIN
SELECT "password" into curPassword
FROM "rLoginInfo"
WHERE "username" = usrname;

IF curPassword = pass THEN RETURN 1;
ELSE return 0;
END IF;
END checkPassword;
/