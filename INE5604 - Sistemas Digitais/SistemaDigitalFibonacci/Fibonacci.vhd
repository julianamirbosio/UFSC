-- PASSO 0: 
--
-- Descrição do comportamento por agoritmo
-- L01: int Fibonacci (int n)
-- L02:	if (n<=2)
-- L03:		return 1
-- L04:	int i = 3; 
-- L05: int primeiro = 1;
-- L06:	int segundo = 1;
-- L07:	int soma;
-- L08:	while (i<=n)
-- L09:		soma = primeiro + segundo;
-- L10:		primeiro = segundo;
-- L11: 	segundo = soma;
-- L12:		i++;
-- L13:		return soma;
--
-- Entradas: int n
-- Saídas: int nElemento
--																								
-- Operações: 															Sinais de Comando:
-- L02:	n<=2							-> Comparador relacional      	==> sttNleq2            -- status
-- L04:	i = 3;							-> Registrador					==> cmdI3				-- comando
-- L05: primeiro = 1					-> Registrador					==> cmdPrim1				
-- L06:	segundo = 1						-> Registrador					==> cmdSeg1
-- L08:	i<=n							-> Comparador relacional		==> sttIleqN
-- L09:	soma = primeiro + segundo		-> Soma							==> cmdSomaPrimPlusSeg
-- L10:	primeiro = segundo				-> Registrador					==> cmdPrimSeg
-- L11: segundo = soma					-> Registrador					==> cmdSegSoma
-- L12:	i++								-> Incrementador				==> cmdIinc



-- PASSO 2: 

library ieee;
use ieee.std_logic_1164.all;

entity Fibonacci is 
    generic(width: positive := 16);
    port(
		-- control inputs
	    	clock, reset: in std_logic;
		iniciar: in std_logic;
		-- control outputs
		pronto: out std_logic;
		-- data inputs
        	n: in std_logic_vector(width-1 downto 0);
		-- data outputs
       	 	nElemento: out std_logic_vector(width-1 downto 0)
    );
end entity;

architecture estrutural of Fibonacci is
	component BlocoControle is
		port(
			clock, reset: in std_logic;
			-- controle externo
			iniciar: in std_logic;
			pronto: out std_logic;
			-- controle interno
			sttNleq2, sttIleqN: in std_logic;
			cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, cmdPrimSeq, cmdSegSoma, cmdIinc: out std_logic;
		);
	end component;

	component BlocoOperativo is
		generic(width: positive);
		port(
			clock, reset: in std_logic;
			cmdI3, cmdPrim1, cmdSeg1, cmdSomaPrimPlusSeg, cmdPrimSeq, cmdSegSoma, cmdIinc: in std_logic;
			sttNleq2, sttIleqN: out std_logic;
			n: in std_logic_vector(width-1 downto 0);
	       	 	nElemento: out std_logic_vector(width-1 downto 0)
		);
	end component;

    signal  -- COMPLETE
begin
    BC: BlocoControle port map(--COMPLETE);
    BO: BlocoOperativo generic map(width) port map(--COMPLETE);
end architecture;
	
	
	
	
	
	
	
	
