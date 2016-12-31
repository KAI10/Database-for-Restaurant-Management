create or replace procedure changePassword(isAdmin IN INTEGER, usrname IN varchar2, newPass IN varchar2) IS

BEGIN

IF isAdmin = -1 THEN
UPDATE "rAdmin" SET "password" = newPass WHERE "username" = usrname;
DBMS_OUTPUT.PUT_LINE('OK');
ELSE
UPDATE "rLoginInfo" SET "password" = newPass WHERE "username" = usrname;
END IF;

END changePassword;
/

