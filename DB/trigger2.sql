CREATE OR REPLACE TRIGGER TRIGGER2 
AFTER INSERT ON CUSTOMER for each ROW
BEGIN
  insert into customer_log values(:new.custid, :new.name, :new.address, :new.phone);
END;
