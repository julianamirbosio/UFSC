library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ParityGenerator is
      generic(n: positive);
      port(input0: in std_logic_vector(n-1 downto 0);
           output0: out std_logic );
end;

architecture comportamento of ParityGenerator is
  signal paridade: std_logic;
begin
  paridade <= 0;
  for i in input0'range 
    paridade <= paridade xnor input0(i);
  end loop;
  output0 <= paridade;
end;
