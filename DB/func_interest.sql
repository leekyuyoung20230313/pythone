create or replace NONEDITIONABLE FUNCTION FNC_INTEREST 
(
  price IN NUMBER 
) RETURN NUMBER AS 
    myinterest NUMBER;
BEGIN
  -- 가격이 15000이상이면 10% 그외는 5% 마진;
  if price >=15000 then myinterest := price*0.1;
  else myinterest := price*0.05;
  end if;
  return myinterest;
END FNC_INTEREST;
