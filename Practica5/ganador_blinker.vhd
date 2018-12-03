library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ganador_blinker is
	port(
		leds: out std_logic_vector(9 downto 0);
		rst, clk, ini: in std_logic
	);
end ganador_blinker;

architecture Behavioral of ganador_blinker is

	signal s: std_logic := '0';
	signal count: integer := 0;

begin

	blink: process(rst, clk, ini)
		begin
			if rst = '1' then
				s <= '0';
				count <= 0;
			else
				if clk'event and clk = '1' and count < 10 and ini = '1' then
					case s is
						when '0' => 
							s <= '1';
							count <= count+1;
						when '1' => 
							s <= '0';
							count <= count+1;
						when others =>
							s <= '0';
							count <= 0;
					end case;
				end if;
			end if;
	end process;
	
	asignar: process(s)
	begin
		case s is
			when '1' =>	leds <= "1111111111";
			when '0' =>	leds <= "0000000000";
			when others => leds <= "0000000000";
		end case;
	end process;

end Behavioral;

