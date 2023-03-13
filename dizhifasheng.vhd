library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

	
	entity dizhifasheng is
		port(clk: IN STD_LOGIC;
		 a: in std_logic_vector(3 downto 0);
		 e: in std_logic;
		 f: in std_logic;
		  t: in std_logic;
		  n: in std_logic;
		  m: in std_logic;
		 add: in std_logic_vector(1 downto 0);
		 q: out std_logic_vector(9 downto 0));
		end dizhifasheng;
	architecture B of dizhifasheng 	IS
		signal counter:std_logic_vector(9 downto 0);
		signal counter1:std_logic_vector(9 downto 0);
		begin
		process(clk)
			begin
			if add="00"then counter<="0000000000";
			elsif add="01"then counter<="0010001011";
			elsif add="10"then counter<="0100001011";
			elsif add="11"then counter<="0111000011";
			end if;
			if clk'event and clk='1'then
			if a="0000"or a="0011"or a="0101"or a="0110"or a="0111"or a="1001"
			 or a="1010"or a="1011"or a="1100"or a="1101"or a="1110"or a="1111"
			 then counter1<="0000000000";
		  elsif e='0'then counter1<="0000000000";
		  elsif f='0'then counter1<="0000000000";
		  elsif add="00"and counter1="0010001010"then counter1<="0000000000";
		  elsif add="01"and counter1="0001111111"then counter1<="0000000000";
		  elsif add="10"and counter1="0010110111"then counter1<="0000000000";
		  elsif add="11"and counter1="0010000011"then counter1<="0000000000";
		  else counter1<=counter1+1;
			end if;
		end if;
		 if t='1'then clk<='0';--²¥·ÅÔÝÍ£
			ELSE
					clk<=clk;
						end if;
		 if n='1'then counter1<=counter1+5;
			ELSE
					counter1<=counter1;
						end if;
		 if m='1'then counter1<=counter1+5;
			ELSE
					counter1<=counter1;
			end if;
		q<=counter+counter1;
	end process;
end B;