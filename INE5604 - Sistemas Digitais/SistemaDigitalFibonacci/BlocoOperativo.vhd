library ieee;
use ieee.std_logic_1164.all;

entity BlocoOperativo is
		generic(width: positive);
		port(
				clock, reset: in std_logic;
				cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, cmdPrimSeq, cmdSegSoma, cmdIinc: in std_logic;
				sttNleq2, sttIleqN: out std_logic;
				n: in std_logic_vector(width-1 downto 0);
	    		nElemento: out std_logic_vector(width-1 downto 0)
		);
	end entity;

	architecture structure of fibonacciOperatingBlock is
		component registerN is
			generic(	width: positive;
						generateLoad: boolean := false;
						clearValue: integer := 0 );
			port(	-- control
					clock, clear, load: in std_logic;
					-- data
					input: in std_logic_vector(width-1 downto 0);
					output: out std_logic_vector(width-1 downto 0));
		end component;
	
		component addersubtractor is
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
		end component;
	
		component compare is
			generic(	width: positive;
						isSigned: boolean := false;
						generateEqual: boolean := false ;
						generateLessThan: boolean := false;
						useFixedSecodOperand: boolean := false;
						fixedSecodOperand: integer := 0 );
			port(	input0, input1: in std_logic_vector(width-1 downto 0);
					lessThan, equal: out std_logic );
		end component;
	
		component multiplexer2x1 is
			generic(	width: positive );
			port(	input0, input1: in std_logic_vector(width-1 downto 0);
					sel: in std_logic;
					output: out std_logic_vector(width-1 downto 0) );
		end component;
	
	signal --COMPLETE
begin
	-- n<=2    ---> stt1
	-- i<n       ---> stt2
	-- COMPLETE

	-- i=3         ---> ctrl1
    -- i=i+1      ---> ctrl2
	-- COMPLETE
	
	--  t1 = 1     ---> ctrl3
	--  t1 = t2    ---> ctrl4 
	-- COMPLETE
	
	-- t2=1       ---> ctrl5
    -- t2=res    ---> ctrl6
	-- COMPLETE
    
	-- res = 1         ---> ctrl7
    -- res = 2         --->  ctrl8
    -- res = t1+t2   --->  ctrl9
	-- COMPLETE
end architecture;
