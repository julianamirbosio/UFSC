--- programa feito para deslocamento a esquerda, dado uma entrada de tamanho n

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binarydecoder is
	generic (n: positive := 7);
	port(
		input0: in std_logic_vector(n-1 downto 0);
		output0: out std_logic_vector(2**n-1 downto 0)
		);
end;

architecture comportamental1 of binarydecoder is
begin
	output0 <= std_logic_vector(
						shift_left(
							to_unsigned(1,2**n),
							to_integer(unsigned(input0))
						)
					);   --- Deslocamento à Esquerda (sll): Aplicável a bit_vector. 
end;
