library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
	port(
		input   :  in std_logic_vector(3 downto 0);
		output  : out std_logic_vector(3 downto 0);
		clk, rst:  in std_logic
	);
end registro;

architecture Behavioral of registro is

begin

	process(clk, rst)
	begin
		if rst = '1' then 
			output <= "0000";
		elsif clk'event and clk = '1' then
			output <= input;
		end if;
	end process;
	
end Behavioral;

