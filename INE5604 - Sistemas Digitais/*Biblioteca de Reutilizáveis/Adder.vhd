library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is
	generic(N: positive:=8);
	port( a,b: in std_logic_vector(N-1 downto 0);
			sum: out std_logic_vector(N-1 downto 0);
			cout: out std_logic);
end;

 architecture forGenExample1 of Adder is
	component HalfAdder is
		port(a,b: in std_logic;
			  sum, cout: out std_logic);
	end component;
	component FullAdder is
		port(cin, a,b: in std_logic;
			  sum, cout: out std_logic);
	end component;
	signal carry: std_logic_vector(N-2 downto 0);
 begin
	geraAdder: for i in sum'range generate
		menorbit: if i = sum'low generate
			ha: HalfAdder port map(a=>a(i), b=>b(i), sum=>sum(i), cout=>carry(i));
		end generate;
		bitsdomeio: if i > sum'low and i < sum'high generate
			ha: FullAdder port map(cin=>carry(i-1), a=>a(i), b=>b(i),
				 sum=>sum(i), cout=>carry(i));
		end generate;
		bitmaisalto: if i = sum'high generate
			ha: FullAdder port map(cin=>carry(i-1), a=>a(i), b=>b(i),
				 sum=>sum(i), cout=>cout);
		end generate;
	end generate;
 end;
