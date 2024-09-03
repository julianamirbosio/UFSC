library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerN is
    generic(
        width: positive;
        generateLoad: boolean := false;
        clearValue: integer := 0
    );
    port(
        -- control
        clock, clear, load: in std_logic;
        -- data
        input: in std_logic_vector(width-1 downto 0);
        output: out std_logic_vector(width-1 downto 0)
    );
end registerN;

architecture Behavioral of registerN is
    signal reg: std_logic_vector(width-1 downto 0) := (others => '0');
begin
    process(clock, clear)
    begin
        if clear = '1' then
            reg <= std_logic_vector(to_unsigned(clearValue, width));
        elsif rising_edge(clock) then
            if generateLoad and load = '1' then
                reg <= input;
            elsif not generateLoad then
                reg <= input;
            end if;
        end if;
    end process;
    
    output <= reg;
end Behavioral;
