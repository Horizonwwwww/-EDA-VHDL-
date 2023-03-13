library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity shukongfenpin is
	  port(clk: in std_logic;
		 E: in std_logic_vector(15 downto 0);
		 co: out std_logic);
end shukongfenpin;
ARCHITECTURE a OF shukongfenpin is
	signal q1:std_logic_vector(15 downto 0);
	signal co1,co2:std_logic;
	begin
		process(clk)
		  begin
		    if clk'event and clk ='1'then
		      if q1=e-1 then
		        q1<="0000000000000000";co1<='1';
		        else
		        q1<=q1+1;co1<='0';
		        end if;
		        end if;
		      end process;
		      process(co1)
		      begin
		        if co1'event and co1='1'then
				co2<=not co2;
				end if;
				co<=co2;
				end process;
end a;