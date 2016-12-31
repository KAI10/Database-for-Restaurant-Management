Create or Replace Function getIncome(days IN number) RETURN number
IS
	income number(10) := 0;
	BEGIN
		select sum("bill_total") into income from "rBills" where
		"bill_date" >= to_date(to_char(sysdate, 'DD-MON-YYYY'), 'DD-MON-YYYY') - days;

		IF income IS NULL THEN income := 0;
		END IF;
     RETURN income;
  END;
/