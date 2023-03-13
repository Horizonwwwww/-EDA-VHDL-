library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_ARITH.ALL;
use ieee.std_logic_UNSIGNED.ALL;
entity top is
	port(clk20mhz: in std_logic;
		 e: in std_logic;
		 f: in std_logic;
		 a: in std_logic_vector(3 downto 0);
		 co3: out std_logic);
	end top;
architecture B of top is
	signal s1:std_logic;
	signal s2:std_logic_vector(3 downto 0);
	signal s3:std_logic_vector(1 downto 0);
	signal s4:std_logic_vector(9 downto 0);
	signal s5:std_logic_vector(3 downto 0);
	signal s6:std_logic_vector(15 downto 0);
	
	component m8hz is
	  port(clk:in std_logic;
		   c:	out std_logic);
	end component m8hz;
	component rom_jianpu is
	  port(address:in std_logic_vector(9 downto 0);
		   clock:  in std_logic;
		   q:	   out std_logic_vector(3 downto 0));
	  end component rom_jianpu;
	  component fanyi is
		port(a:in std_logic_vector(3 downto 0);
		     E:out std_logic_vector(15 downto 0));
	  end component fanyi;
	  component shukongfenpin is
		port(clk:in std_logic;
		     E:in std_logic_vector(15 downto 0);
		     co:out std_logic);        
		end  component shukongfenpin;
	  component xuanqu is
		port(e:in std_logic;
		     f:in std_logic;
		     clk:in std_logic;
		     clk20mhz:in std_logic;
		     a:in std_logic_vector(3 downto 0);
		     a1:out std_logic_vector(3 downto 0);
		     add:out std_logic_vector(1 downto 0));        
		end  component xuanqu;     
	  component dizhifasheng is
		port(clk:in std_logic;
		     a:in std_logic_vector(3 downto 0);
		     e:in std_logic;
		     f:in std_logic;
		     add:in std_logic_vector(1 downto 0);
		     q:out std_logic_vector(9 downto 0));        
		end  component dizhifasheng;
	BEGIN
U1:m8hz PORT MAP(clk20mhz,s1) ;
U2:rom_jianpu PORT MAP (s4,s1,s5) ;
U3:fanyi PORT MAP(s5,s6);
U4:shukongfenpin PORT MAP(clk=>clk20mhz,E=>s6,co=>co3);
U5:xuanqu PORT MAP(e,f,s1,clk20mhz,a,s2,s3);
U6:dizhifasheng PORT MAP (s1,s2,e,f,s3,s4);
end B;