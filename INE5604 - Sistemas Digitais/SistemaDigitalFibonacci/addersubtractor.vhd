library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addersubtractor is
	generic(	width: positive;
				isAdder: boolean := false;
				isSubtractor: boolean := false;
				generateCout: boolean := false;
				generateOvf: boolean := false;
				fixedSecodOperand: integer := 0);
	port(	
		    	input0, input1: in std_logic_vector(width-1 downto 0);
			op: in std_logic;
			result: out std_logic_vector(width-1 downto 0);
			ovf, cout: out std_logic );
	begin
		assert isAdder or isSubtractor report "At least one operation (+,-) should be selected" severity error;
end entity;

architecture arch1 of addersubtractor is
	signal carry: std_logic_vector(width downto 0);
	signal operandB: std_logic_vector(width-1 downto 0);
	signal secondOperand: std_logic_vector(width-1 downto 0);
begin
	fixed: if fixedSecodOperand /= 0 generate
		secondOperand <= std_logic_vector(to_unsigned(fixedSecodOperand,
							secondOperand’length));
	end generate;
	notfixed: if fixedSecodOperand = 0 generate
		secondOperand <= input1;
	end generate;
	gera: for i in 0 to width-1 generate
		result(i) <= carry(i) xor input0(i) xor operandB(i);
		carry(i+1) <= (carry(i) and input0(i)) or (carry(i) and operandB(i)) or
				(input0(i) and operandB(i));
	end generate;
	generateAdder: if isAdder and not isSubtractor generate
		carry(0) <= '0';
		operandB <= secondOperand;
	end generate;
	generateSubtractor: if not isAdder and isSubtractor generate
		carry(0) <= '1';
		operandB <= not secondOperand;
	end generate;
	generateBoth: if (isAdder and isSubtractor) or not(isAdder or isSubtractor) generate
		carry(0) <= op;
		operandB <= secondOperand when op='0' else not secondOperand;
	end generate;
	generateOverflow: if generateOvf generate
		ovf <= carry(width) xor carry(width-1);
	end generate;
	generateCarryOut: if generateCout generate
		cout <= carry(width);
	end generate;
end architecture;
