library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
	port(
		A, B: in std_logic_vector(3 downto 0);
		C: out std_logic_vector(3 downto 0)
	);
end adder;

architecture Behavioral of adder is

begin

	C <= std_logic_vector(unsigned(A) + unsigned(B));

end Behavioral;

