LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY IC74183 IS
	PORT ( c, b, a : IN STD_LOGIC;
	e,e1,e2: IN STD_LOGIC;
	y : OUT STD_LOGIC_VECTOR(7 downto 0));
END IC74183;

ARCHITECTURE flow OF IC74183 IS
SIGNAL data: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL temp: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
data <= c & b & a;
WITH data SELECT temp <= "11111110" WHEN "000" ,
"11111101" WHEN "001" ,
"11111011" WHEN "010" ,
"11110111" WHEN "011" ,
"11101111" WHEN "100" ,
"11011111" WHEN "101" ,
"10111111" WHEN "110" ,
"01111111" WHEN "111" ;
y <= temp WHEN (e AND NOT e1 AND NOT e2) = '1' 
ELSE "11111111"; 
END flow;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tn8 IS
PORT(
	x, y, z: IN STD_LOGIC;
	f: OUT STD_LOGIC
	);
end tn8;

ARCHITECTURE model OF tn8 IS
SIGNAL w: STD_LOGIC_VECTOR (7 DOWNTO 0);
COMPONENT IC74183 
	PORT ( c, b, a : IN STD_LOGIC;
	e,e1,e2: IN STD_LOGIC;
	y : OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

BEGIN
model1: IC74183 PORT MAP (x, y, z, '1', '0', '0', w);

f <= NOT(w(0) AND w(3) AND w(4) AND w(7));

END model;





