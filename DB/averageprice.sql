create or replace NONEDITIONABLE PROCEDURE AveragePrice(
  AverageVal OUT NUMBER)
AS
BEGIN
  SELECT AVG(price) INTO AverageVal FROM Book WHERE price IS NOT NULL;
  DBMS_OUTPUT.PUT_LINE('책값 평균: '||AverageVal);
END;
