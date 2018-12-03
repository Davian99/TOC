library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity espera_blinker is
	port(
		leds: out std_logic_vector(9 downto 0);
		rst, clk: in std_logic
	);
end espera_blinker;

architecture Behavioral of espera_blinker is
	
	signal estado: std_logic_vector(9 downto 0) := "0000000000";

begin

	blink: process(rst, clk)
		begin
			if rst = '1' then
				estado <= "0000000000";
			else
				if clk'event and clk = '1' then
					case estado is
						when "0000000000" => estado <= "1000000000";
						when "1000000000" => estado <= "1100000000";
						when "1100000000" => estado <= "1110000000";
						when "1110000000" => estado <= "1111000000";
						when "1111000000" => estado <= "1111100000";
						when "1111100000" => estado <= "1111110000";
						when "1111110000" => estado <= "1111111000";
						when "1111111000" => estado <= "1111111100";
						when "1111111100" => estado <= "1111111110";
						when "1111111110" => estado <= "1111111111";
						when "1111111111" => estado <= "0111111111";
						when "0111111111" => estado <= "0011111111";
						when "0011111111" => estado <= "0001111111";
						when "0001111111" => estado <= "0000111111";
						when "0000111111" => estado <= "0000011111";
						when "0000011111" => estado <= "0000001111";
						when "0000001111" => estado <= "0000000111";
						when "0000000111" => estado <= "0000000011";
						when "0000000011" => estado <= "0000000001";
						when "0000000001" => estado <= "0000000000";
						when others => estado <= "0000000000";
					end case;
				end if;
			end if;
	end process;
	
	leds <= estado;

end Behavioral;

