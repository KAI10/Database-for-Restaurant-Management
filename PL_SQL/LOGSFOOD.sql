CREATE or REPLACE TRIGGER LOGSFOOD
before INSERT OR DELETE OR UPDATE OF "food_id", "food_price" ON "rFoodItem"
FOR each ROW

DECLARE
V_ChangeType CHAR(1);
v_id NUMBER;
old_price NUMBER;
new_price NUMBER;

BEGIN
  IF INSERTING THEN
     V_ChangeType := 'I';
     v_id := :new."food_id";

		 INSERT into "rLogs"("changed_by", "change_type", "time", "food_id") VALUES (USER, V_ChangeType, sysdate, v_id);

  ELSIF UPDATING THEN
     V_ChangeType := 'U';
		 
     old_price := :old."food_price";
     new_price := :new."food_price";

		 INSERT into "rLogs"("changed_by", "change_type", "time", "old_food_price", "new_food_price") VALUES (USER, V_ChangeType, sysdate, old_price, new_price);

  ELSE
     V_ChangeType := 'D';
     v_id := :old."food_id";

		 INSERT into "rLogs"("changed_by", "change_type", "time", "food_id") VALUES (USER, V_ChangeType, sysdate, v_id);

END IF;

END LOGSEMPLOYEE;
/
	