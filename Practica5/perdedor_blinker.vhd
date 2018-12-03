library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity perdedor_blinker is
	port(
		leds: out std_logic_vector(9 downto 0);
		rst, clk, ini: in std_logic
	);
end perdedor_blinker;

architecture Behavioral of perdedor_blinker is

	signal s: std_logic_vector(1 downto 0);
	signal count: integer := 0;

begin

	blink: process(rst, clk, ini)
		begin
			if rst = '1' then
				s <= "00";
				count <= 0;
			else
				if clk'event and clk = '1' and ini = '1' then
					if count = 10 then
						s <= "11";
					elsif s = "00" then
						count <= count + 1;
						s <= "01";
					elsif s = "01" then
						count <= count + 1;
						s <= "00";
					end if;
				end if;
			end if;
	end process;
	
	asignar: process(s)
	begin
		case s is
			when "00" =>	leds <= "0101010101";
			when "01" =>	leds <= "1010101010";
			when others => leds <= "0000000000";
		end case;
	end process;

end Behavioral;

