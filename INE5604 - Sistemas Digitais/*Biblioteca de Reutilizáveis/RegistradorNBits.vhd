library ieee;
use ieee.std_logic_1164.all;

entity RegistradorNBits is
		generic (width: positive := n
		);
		port(
			-- controle
			clock, reset, load: in std_logic;
			-- dados
			input0: in std_logic_vector(width-1 downto 0);
			output0: out std_logic_vector(width-1 downto 0)
			);
end;

architecture behavior of RegistradorNBits is
	subtype State is std_logic_vector(width-1 downto 0);
	signal nextState, currentState: State;
begin
	-- Next-state Logic
	nextState <= input0 when load='1' else currentState;
	
	-- State Register
	regD: process(clock, reset)
	begin
		if reset='1' then 
			currentState <= (others=>'0'); -- reset state
		elsif rising_edge(clock) then
			currentState <= nextState;
		end if;
	end process;
	-- Output Logic
	output0 <= currentState;
	
end;

-- (69|37|16 => '1' other=> '0')
