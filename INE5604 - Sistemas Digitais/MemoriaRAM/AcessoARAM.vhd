library ieee;
use ieee.std_logic_1164.all;

--- Implemetação de um acesso à memória ram
entity AcessoARAM is
	port(
		clk: in std_logic;
		dadoEntrada: in std_logic_vector(7 downto 0);
		endereco: in std_logic_vector(9 downto 0);
		dadoSaida: out std_logic_vector(7 downto 0);
		escrita: in std_logic
		);
end entity;

architecture estrutura of AcessoARAM is 
	component RAM
		PORT
		(
			address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
		
	end component;
begin
	memoria: RAM port map(
		address => endereco,
		clock => clk,
		data => dadoEntrada,
		wren => escrita,
		q	=> dadoSaida
		);

end;
