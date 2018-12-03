library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
	port(
		rst, ini, fin, iguales, clk: in std_logic;
		selec: out std_logic_vector(1 downto 0)
	);
end control;

architecture Behavioral of control is

begin

	controlador: process(clk, rst, ini, fin, iguales)
	begin
		if rst = '1' then
			selec <= "01";
		elsif rising_edge(clk) then
			if ini = '1' and fin = '0' then
				selec <= "00";
			elsif fin = '1' and iguales = '1' then
				selec <= "10";
			elsif fin = '1' and iguales = '0' then
				selec <= "11";
			else
				selec <= "01";
			end if;
		end if;
	end process;

end Behavioral;

