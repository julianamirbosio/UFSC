library ieee;
use ieee.std_logic_1164.all;

entity BlocoControle is
	port(clock, reset: in std_logic;
			-- controle externo
			iniciar: in std_logic;
			pronto: out std_logic;
			-- controle interno
			sttNleq2, sttIleqN: in std_logic;
			cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, cmdPrimSeg, cmdSegSoma, cmdIinc: out std_logic;
	);
end entity;

architecture comportamental of BlocoControle is
	type State is {L01, L02, L03, L04, L05, L06, L07, L08, L09, L10, L11, L12, L13}
	signal currentState, nextState: State;
begin
	-- logica de proximo estado
	process(currentState, iniciar, sttNleq2, sttIleqN) is
	begin
		nextState <= currentState;
		case currentState is 
			when L01 => 
				if iniciar='1' then
					nextState <= L02;
				end if;
			when L02 => 
				if sttNleq2 ='1'
					nextState <= L03;
				else
					nextState <= L04;
				end if;
			when L03 => 
				nextState <= L01;
			when L04 => 
				nextState <= L05;
			when L05 => 
				nextState <= L06;
			when L06 => 
				nextState <= L07;
			when L07 => 
				nextState <= L08;
			when L08 => 
				if sttIleqN='1'
					nextState <= L09;
				else
					nextState <= L13;
				end if;	
			when L09 => 
				nextState <= L10;
			when L10 => 
				nextState <= L11;
			when L11 => 
				nextState <= L12;
			when L12 => 
				nextState <= L08;
			when L13 => 
				nextState <= L01;
	end process;
	
	-- registador D (elemento de memoria ou estado interno)
	process(clock, reset) is 
	begin
		if reset ='1'
			currentState <= L01;
		elsif (rising_edgeclock = '1') then 
			currentState => nextState
		end if;
	end process;
			
	-- logica de saida 
	cmdI3 <= '1' when currentState=L04 else '0';
	cmdPrim1 <= '1' when currentState=L12 else '0';
	cmdSeg1 <= '1' when currentState=L05 else '0';
	cmdSomaPrimPlusSeg <= '1' when currentState=L10 else '0';
	cmdPrimSeg <= '1' when currentState=L06 else '0';
	cmdSegSoma <= '1' when currentState=L11 else '0';
	cmdIinc <= '1' when currentState=L09 else '0';
	pronto <= '1' when currentState=L01 else '0';
end;
