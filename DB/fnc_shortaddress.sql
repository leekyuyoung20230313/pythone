CREATE OR REPLACE FUNCTION FNC_SHORTADDRESS 
(
  ADDRESS IN VARCHAR2 
) RETURN VARCHAR2 AS 
    myaddress varchar2(10);
BEGIN
  if ADDRESS like '%영국%' then myaddress := '영국';
  elsif ADDRESS like '%대한민국%' then myaddress := '한국';
  elsif ADDRESS like '%미국%' then myaddress := '미국';
  else myaddress := ADDRESS;
  end if;
  return myaddress;
END FNC_SHORTADDRESS;
