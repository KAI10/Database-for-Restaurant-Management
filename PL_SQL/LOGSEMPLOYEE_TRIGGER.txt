CREATE or REPLACE TRIGGER LOGSEMPLOYEE
before INSERT OR DELETE OR UPDATE OF "e_id", "job_id" ON "rEmployee"
FOR each ROW

DECLARE
V_ChangeType CHAR(1);
v_id NUMBER;
old_j_id NUMBER;
new_j_id NUMBER;

BEGIN
  IF INSERTING THEN
     V_ChangeType := 'I';
     v_id := :new."e_id";

		 INSERT into "rLogs"("changed_by", "change_type", "time", "e_id") VALUES (USER, V_ChangeType, sysdate, v_id);

  ELSIF UPDATING THEN
     V_ChangeType := 'U';
		 
     old_j_id := :old."job_id";
     new_j_id := :new."job_id";

		 INSERT into "rLogs"("changed_by", "change_type", "time", "old_job", "new_job") VALUES (USER, V_ChangeType, sysdate, old_j_id, new_j_id);

  ELSE
     V_ChangeType := 'D';
     v_id := :old."e_id";

		 INSERT into "rLogs"("changed_by", "change_type", "time", "e_id") VALUES (USER, V_ChangeType, sysdate, v_id);

END IF;

END LOGSEMPLOYEE;
/
	