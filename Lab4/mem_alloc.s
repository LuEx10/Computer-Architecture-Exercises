#$v0 <- 9 #sbrk
#$a0 <- N #bytes
#syscall
#$v0  #endereço

.text 
.globl main 
main:
	# encontrar bloco:
	addi $v0, $v0, 9	# sbrk
	addi $a0, 400		# 100 palavras = 400 bytes
	syscall

	#preencher o vetor:
	andi $t0, $t0, 0	# t0(i) <- 0
	andi $t2, $t2, 0	# t2(4*i) <- 0
	
LOOP:
	#inicio loop (iterador = $t0)
	sll $t1, $t0, 1	# t1 <- 2*i
	add $t1, $t1, $t0	# t1 <- 2*i + i
	
	add $t3, $t2, $v0
	
	sw $t1, 0($t3)	# V[i] <- 2*i + i	
	
	addi $t0, $t0, 1	# i++	
	addi $t2, $t2, 4	# 4i += 4
	bne $t2, 400, LOOP	# if i != 99, LOOP
EXIT:
# Fim do programa
    li $v0, 10            # Chamada de sistema para sair
    syscall