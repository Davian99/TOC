library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity espera is
	port(
		leds: out std_logic_vector(9 downto 0) := "0000000000";
		rst, clk: in std_logic
	);
end espera;

architecture Behavioral of blinket is
	
	signal s: std_logic := '0';

begin

	blink: process(rst, clk)
		begin
			if rst = '1' then
				leds <= "0000000000";
			else
				if clk'event and clk = '1' then
					case s is
						when '0' => 
							leds <= "1111111111";
							s <= '1';
						when '1' => 
							leds <= "0000000000";
							s <= '0';
						when others => s <= '0';
					end case;
				end if;
			end if;
	end process;

end Behavioral;

