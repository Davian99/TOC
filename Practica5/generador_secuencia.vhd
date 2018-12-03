library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity leds_genedador is
	port(
		leds: out std_logic_vector(9 downto 0);
		selec: in std_logic_vector(1 downto 0);
		rst, clk: in std_logic
	);
end leds_genedador;

architecture Behavioral of leds_genedador is

	signal leds_esperar, leds_ganar, leds_perder: std_logic_vector(9 downto 0);
	signal ini: std_logic;
	
	component espera_blinker is
	port(
		leds: out std_logic_vector(9 downto 0);
		rst, clk: in std_logic
	);
	end component;
	
	component ganador_blinker is
	port(
		leds: out std_logic_vector(9 downto 0);
		rst, clk, ini: in std_logic
	);
	end component;
	
	component perdedor_blinker is
	port(
		leds: out std_logic_vector(9 downto 0);
		rst, clk, ini: in std_logic
	);
	end component;

begin

	esperar_mod: espera_blinker port map(
		leds => leds_esperar,
		rst => rst,
		clk => clk
	);
	
	ganador_mod: ganador_blinker port map(
		leds => leds_ganar,
		rst => rst,
		clk => clk,
		ini => ini
	);
	
	perdedor_mod: perdedor_blinker port map(
		leds => leds_perder,
		rst => rst,
		clk => clk,
		ini => ini
	);
	
	luces: process(rst, clk, selec)
	begin
		if rst = '1' then
			leds <= "0000000000";
			ini <= '0';
		elsif rst = '0' then
			if clk'event and clk = '1' then
				if selec = "00" then 
					leds <= "0000000000";
				elsif selec = "01" then
					leds <= leds_esperar;
				elsif selec = "10" then
					ini <= '1';
					leds <= leds_ganar;
				elsif selec = "11" then
					ini <= '1';
					leds <= leds_perder;
				else
					leds <= "0000000000";
				end if;
			end if;
		end if;
	end process;

end Behavioral;

