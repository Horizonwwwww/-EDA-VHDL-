library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY xuanqu IS

	PORT( 	e:IN	STD_LOGIC;
			f:IN	STD_LOGIC;
			clk:IN	STD_LOGIC;
			clk20mhz: IN	STD_LOGIC;
			a:IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			a1 :OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
			add:OUT	STD_LOGIC_VECTOR(1 DOWNTO 0));

END xuanqu;

ARCHITECTURE B OF xuanqu IS

	SIGNAL add1:STD_LOGIC_VECTOR( 1 DOWNTO 0);

	SIGNAL add2: STD_LOGIC_VECTOR( 1 DOWNTO 0);

	SIGNAL add3:STD_LOGIC_VECTOR(1 DOWNTO 0);

	SIGNAL key_out1:STD_LOGIC;

	SIGNAL key_out2: STD_LOGIC;

	SIGNAL count1:STD_LOGIC_VECTOR(20 DOWNTO 0);

	SIGNAL count2:STD_LOGIC_VECTOR(20 DOWNTO 0);
	
		BEGIN

			PROCESS(a)

			BEGIN

				iF a= "1000" THEN add1 <= "00";

				ELSIF a= "0100" THEN add1 <= "01" ;

				ELSIF a= "0010" THEN add1 <= "10";

				ELSIF a= "0001" THEN add1 <= "11";

				ELSE add1 <= "00";END IF;

			END PROCESS;
			
			PROCESS(clk20mhz)

			BEGIN

				IF clk20mhz'EVENT AND clk20mhz='1'THEN

					IF e ='0' THEN

						IF count1="110000110101010000" THEN count1<=count1;
							ELSE count1<=count1+1;

						END IF;

						IF count1<= "11000011010011111" THEN key_out1<='0';
							ELSE key_out1<='1';

						END IF;

						ELSE count1<= "000000000000000000000";

						END IF;

				IF f ='0' THEN

					If count2 = "11000011010101000" THEN count2<=count2;
						ELSE count2<= count2+1;

					END IF;

					IF count2 <= "11000011010011111" THEN key_out2<= '0';
						ELSE key_out2<= '1';

					END IF;

					ELSE count2 <= "000000000000000000000";
					END IF;
				END IF;
			END PROCESS;
			PROCESS(key_out1)

			BEGIN

				IF a= "0000" OR a= "0011" OR a= "0101" OR a= "0110" OR a= "0111" OR a= "1001" OR a ="1010" OR a= "1011" OR a= "1100" OR a="1101" OR a= "1110" OR a= "1111" THEN add2 <="00";
					ELSIF key_out1'EVENT AND key_out1='1'THEN
						add2<=add2+1;
				END IF;
			END PROCESS;
			PROCESS(key_out2 )
			BEGIN
			IF a= "0000" OR a= "0011" OR a="0101" OR a="0110" OR a= "0111" OR a= "1001"  OR a="1010" OR a= "1011" OR a ="1100" OR a="1101" OR a="1110" OR a= "1111" THEN add3<= "00";
			ELSIF key_out2'EVENT AND key_out2='1' THEN
				add3<=add3+1;
				END IF; 
			END PROCESS;
			process(clk)
			begin
				if clk'event and clk='1'then
					add<=add1+add2-add3;
				end if;
				a1<=a;
			end process;
end B;

			