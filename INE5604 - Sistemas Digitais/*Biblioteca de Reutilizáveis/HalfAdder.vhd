library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
  port (a, b: in std_logic;
    sum, cout: out std_logic); 
  end HalfAdder;

architecture dataflow of HalfAdder is 
  begin
  sum <= a xor b;
  cout <= a and b; 
end dataflow;
