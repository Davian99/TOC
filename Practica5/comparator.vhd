library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
	port(
		A, B: in std_logic_vector(3 downto 0);
		same: out std_logic
	);
end comparator;

architecture Behavioral of comparator is

begin

	iguales: process(A, B)
	begin
		if A = B then
			same <= '1';
		else
			same <= '0';
		end if;
	end process;

end Behavioral;

