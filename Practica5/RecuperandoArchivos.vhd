library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test is
	port(
		leds_salida: out std_logic_vector(9 downto 0);
		salida1, salida2: out std_logic_vector(6 downto 0);
		clk, rst, ini, fin: in std_logic
	);
end test;

architecture Behavioral of test is

	signal clk_1hz, clk_counter1, clk_counter2, iguales: std_logic;
	signal s_counter1, s_counter2, s_registro1, s_registro2: std_logic_vector(3 downto 0);
	signal selec: std_logic_vector(1 downto 0);
	
	component conv_7seg is
   port ( 
		x:         in  STD_LOGIC_VECTOR (3 downto 0);
      display : out  STD_LOGIC_VECTOR (6 downto 0)
	);
	end component;
	
	component divisor is
		port(
			frec   :   in integer;
			clk_in :   in std_logic;
			clk_out:  out std_logic
		);
	end component;
	
	component counter_mod10 is
		port(
			rst, clk, ini, fin: in std_logic;
			salida: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component leds_genedador is
	port(
		leds: out std_logic_vector(9 downto 0);
		selec: in std_logic_vector(1 downto 0);
		rst, clk: in std_logic
	);
	end component;
	
	component registro is
	port(
		input   :  in std_logic_vector(3 downto 0);
		output  : out std_logic_vector(3 downto 0);
		clk, rst:  in std_logic
	);
	end component;
	
	component comparator is
	port(
		A, B: in std_logic_vector(3 downto 0);
		same: out std_logic
	);
	end component;
	
	component control is
	port(
		rst, ini, fin, iguales, clk: in std_logic;
		selec: out std_logic_vector(1 downto 0)
	);
	end component;
	
begin
	
	display1: conv_7seg port map(
		x => s_registro1,
		display => salida1
	);
	
	display2: conv_7seg port map(
		x => s_registro2,
		display => salida2
	);
	
	controlacion: control port map(
		clk => clk,
		rst => rst,
		ini => ini,
		fin => fin,
		iguales => iguales,
		selec => selec
	);

	comparador: comparator port map(
		A => s_registro1,
		B => s_registro2,
		same => iguales
	);

	divisor_1hz: divisor port map(
		frec => 25000000, --25000000 en implementacion
		clk_in => clk,
		clk_out => clk_1hz
	);
	
	secuencias: leds_genedador port map(
		leds => leds_salida,
		selec => selec,
		rst => rst,
		clk => clk_1hz
	);
	
	divisor_counter1: divisor port map(
		frec => 3000000, --3000000 en implementacion
		clk_in => clk,
		clk_out => clk_counter1
	);
	
	counter1: counter_mod10 port map(
		ini => ini,
		fin => fin,
		rst => rst,
		clk => clk_counter1,
		salida => s_counter1
	);
	
	divisor_counter2: divisor port map(
		frec => 5000000, --5000000 en implementacion
		clk_in => clk,
		clk_out => clk_counter2
	);
	
	counter2: counter_mod10 port map(
		ini => ini,
		fin => fin,
		rst => rst,
		clk => clk_counter2,
		salida => s_counter2
	);
	
	registro1: registro port map(
		input => s_counter1,
		output => s_registro1,
		clk => clk,
		rst => rst
	);
	
	registro2: registro port map(
		input => s_counter2,
		output => s_registro2,
		clk => clk,
		rst => rst
	);

end Behavioral;

