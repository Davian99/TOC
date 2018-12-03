library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor is
	port (	
		frec   :  in integer;
		clk_in :   in std_logic;
      clk_out:  out std_logic
	);
end divisor;

architecture Behavioral of divisor is

	signal count: integer := 1;
	signal clk  : std_logic := '0';

begin

	process(clk_in) 
		begin
			if(clk_in'event and clk_in='1') then
				count <= count + 1;
				if(count = frec) then
					clk_out <= not clk;
					clk <= not clk;
					count <= 1;
				end if;
			end if;
	end process;

end Behavioral;