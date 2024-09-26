.data 
	# Variáveis alocadas na memória
	b: .word -35
	d: .word 1
	e: .word 0
	c: .word 
.text
main:
	lw $t0, b		# Carregar o reg $t0 com a variável b
	addi $t0, $t0, 35  	# $t0 = a = b + 35
	
	lw $t1, e		# Carregar o reg $t1 com a variável e
	add $t0, $t0, $t1	# $t1 = a + e
		
	lw $t1, d		# Carregar o reg $t1 com a variável d
	# Potenciação??? d^3
	sub $t0, $t1, $t0	# $t0 = d - $t0
syscall
