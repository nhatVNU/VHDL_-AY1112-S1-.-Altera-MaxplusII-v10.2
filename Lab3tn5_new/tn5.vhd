library ieee;
use ieee.std_logic_1164.all;

entity tn5 is
  port (clk,J,K,pr,cl : in std_logic;
        Q: out std_logic;
        Qn : out std_logic);
 end tn5;

architecture JKFF_arch of tn5 is  
  signal nxt_state, prv_state: std_logic;
  signal input: std_logic_vector(1 downto 0);
  begin
   input <= J & K;
    process(clk, pr,cl) is
     begin
      if (cl='0') then
        nxt_state <= '0';
      elsif (pr='0') then
        nxt_state <= '1';
      elsif (clk'event and clk='1') then
       case (input) is
        when "10" => nxt_state <= '1';
        when "01" => nxt_state <= '0';
        when "00" => nxt_state <= prv_state;
        when "11" => nxt_state <= not prv_state; 
        when others => null;
       end case;
      end if;
     end process;
    Q <= nxt_state;
    Qn <= not nxt_state;   
    prv_state <= nxt_state;
end JKFF_arch;