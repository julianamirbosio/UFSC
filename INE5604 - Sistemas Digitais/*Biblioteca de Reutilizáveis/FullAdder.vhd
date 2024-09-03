library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port (
        a, b, cin: in std_logic;
        sum, cout: out std_logic
    );
end;

architecture Behavioral of FullAdder is
begin
    sum <= (a xor b) xor cin;
    cout <= (a and b) or ((a xor b) and cin);
end architecture Behavioral;
