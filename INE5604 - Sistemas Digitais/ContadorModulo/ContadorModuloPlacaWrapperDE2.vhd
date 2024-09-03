library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity ContadorModuloPlacaWrapperDE2 is
	generic(	module: positive := 1e6;
				generateLoad: boolean := false;
				generateEnb: boolean := true;
				generateInc: boolean := false;
				resetValue: integer := 0 );
	port(	-- control
			CLOCK_50: in std_logic;
			KEY: in std_logic_vector(0 to 3);
			SW: in std_logic_vector(17 downto 0);
			
			-- data			
			LEDR: out std_logic_vector(17 downto 0)
		 );
end entity;


architecture estructural of ContadorModuloPlacaWrapperDE2 is

	component ContadorModuloPlacaDE2 is
	generic(	module: positive;
				generateLoad: boolean;
				generateEnb: boolean;
				generateInc: boolean;
				resetValue: integer := 0 );
	port(	-- control
			clock, reset: in std_logic;
			load, enb, inc: in std_logic;
			-- data
			input: in std_logic_vector(integer(ceil(log2(real(module))))-1 downto 0);
			output: out std_logic_vector(integer(ceil(log2(real(module))))-1 downto 0)	);
	end component;
	
	signal tempOutput: std_logic_vector(integer(ceil(log2(real(module))))-1 downto 0);
begin
	cont0: ContadorModuloPlacaWrapperDE2 generic map(module, generateLoad, generateEnb, generateInc, resetValue)
													port map( 
															clock => CLOCK_50, reset => KEY(0), load => SW(0), enb => SW(1), inc => SW(2),
															input =>(others => '0'), 
															output => LEDR
															);
	LEDR <= tempOutput(tempOutput'high downto tempOutput'high-17);
	
end architecture;
