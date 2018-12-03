library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_mod10 is
	port(
		rst, clk, ini, fin: in std_logic;
		salida: out std_logic_vector(3 downto 0)
	);
end counter_mod10;

architecture Behavioral of counter_mod10 is

	signal contador: std_logic_vector(3 downto 0) := "0000";
	signal uno: std_logic_vector(3 downto 0) := "0001";
	
begin

	counter: process(rst, clk, ini, fin, contador)
		begin
			if rst = '1' or ini = '0' then
				salida <= "0000";
				uno <= "0001";
			else
				if fin = '1' then
					salida <= contador;
				elsif clk'event and clk = '1' then
					contador <= std_logic_vector(unsigned(contador) + unsigned(uno));
					salida <= contador;
					if contador = "1001" then
						contador <= "0000";
						salida <= contador;
					end if;
				end if;
			end if;
	end process;
end Behavioral;

