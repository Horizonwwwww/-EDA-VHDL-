library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity m8hz is
	port(clk:	in std_logic;
		 c:	 	out std_logic);
end m8hz;

architecture A of m8hz is
	signal q1:std_logic_vector(22 downto 0);
	signal co1,co2:std_logic;
		begin 
			process(clk)
				begin 
					if clk'EVENT AND clk='1'then 
						if q1="00100110001001011001111"
							then q1<="00000000000000000000000";co1<='1';
						else q1<=q1+1;co1<='0';
						end if;
					end if;
			end process;
			process(co1)
				begin 
					if co1'EVENT AND co1='1'then 
						co2<=NOT co2;
						end if;
						c<=co2;
			end process;
end A;