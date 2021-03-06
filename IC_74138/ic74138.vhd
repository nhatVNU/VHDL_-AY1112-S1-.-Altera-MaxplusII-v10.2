--DESIGN IC 74LS138
--LIBRARY
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
------------------------------
--entity 
entity ic74138 is
port(
	A: in std_logic_vector(2 downto 0); -- 3 digits;
	Y_L: out std_logic_vector(7 downto 0); -- 8 digits
	G1: in std_logic;
	G2A_L: in std_logic;
	G2B_L: in std_logic
	);
end entity ic74138;


--architecture 
architecture behavioral of ic74138 is
signal p:std_logic_vector(7 downto 0); 
begin
	
	with A select 
		p <=	 "11111110" when "000",
				 "11111101" when "001",
				 "11111011" when "010",
		       "11110111" when "011",
				 "11101111" when "100",
				 "11011111" when "101",
		       "10111111" when "110",
		       "01111110" when "111";
		y_l<=  p when (G1='1' and G2A_L='0' and G2B_L='0') else
		       "11111111";

end architecture behavioral;