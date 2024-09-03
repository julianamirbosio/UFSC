library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity BinaryCounter is
		generic (width: positive := 8
		);
		port(
			-- controle
			clock, reset, load, enable: in std_logic;
			-- dados
			input0: in std_logic_vector(width-1 downto 0);
			output0: out std_logic_vector(width-1 downto 0)
			);
end;

architecture behavior of BinaryCounter is
	subtype State is unsigned(width-1 downto 0);
	signal nextState, currentState: State;
begin
	-- Next-state Logic
	nextState <= unsigned(input0) when load='1' else 
					 currentState + 1 when enable='1' else
					 currentState;
	
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
	output0 <= std_logic_vector(currentState);
	
end;

-- (69|37|16 => '1' other=> '0')
-- std_logic_vector para unsigned --> unsigned(std0)
-- integer para unsigned --> to_unsigned(int0)
