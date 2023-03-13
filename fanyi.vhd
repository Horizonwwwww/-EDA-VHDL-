library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fanyi IS
	port(A:in std_logic_vector(3 downto 0);
		 E:out std_logic_vector(15 downto 0));
end fanyi;
ARCHITECTURE aa OF fanyi is
	begin
	 process(A)
		begin
		  case A is
			when"0000"=>E<="1111111111111111";
			when"0001"=>E<="1001010101100001";
			when"0010"=>E<="1000010100010111";
			when"0011"=>E<="0111011010001101";
			when"0100"=>E<="0110111111101101";
			when"0101"=>E<="0110001110100110";
			when"0110"=>E<="0101100011000111";
			when"0111"=>E<="0100111100010011";
			when"1000"=>E<="0100101010110000";
			when"1001"=>E<="0100010101110010";
			when"1010"=>E<="0011101101000110";
			when"1011"=>E<="0011011111011100";
			when"1100"=>E<="0011000111010011";
			when"1101"=>E<="0010110001100011";
			when"1110"=>E<="0010011110110111";
			when"1111"=>E<="0010010101011000";
			when others=>E<=null;
		end case;
	end process;
end aa;