.data
X: 	.float 1.0, 2.0, 3.0, 4.0
	.float 5.0, 6.0, 7.0, 8.0
	.float 9.0, 10.0, 11.0, 12.0
	.float 13.0, 14.0, 15.0, 16.0

Y: 	.float 2.0, 0.75, 1.0, 3.5
	.float 1.5, 2.0, 0.25, 1.0
	.float 3.25, 1.0, 0.0, 2.25
	.float 2.0, 3.0, 1.0, 0.875

Z: .space 64 # Espaço par1a a matriz resultante (4x4 * 4 bytes)

separador:  .asciiz ", "
new_line: .asciiz "\n"

.text
.globl main

printArray:
    addi $sp,$sp,-12
    sw $t0,0($sp)
    sw $t1,4($sp)
	sw $s1,8($sp)
    
    li $s1,4

    add $t0,$s4,$zero
    li $t1,0					# i = 0

forPrintArray:
    beq $t1, $s1, endForPrint	# if(i == tamanho), end for

    lwc1   $f12, 0($t0)			# load float
    li   $v0, 2 				# imprimir float
    syscall              

								# Imprime ", "
    la   $a0, separador   
    li   $v0, 4           
    syscall               

								# i++
    addi $t1, $t1, 1
    addi $t0, $t0,4

    j forPrintArray

endForPrint:
    lw $t0,0($sp)
    lw $t1,4($sp)
	lw $s1,8($sp)
	

    addi $sp,$sp,12
    
    la   $a0, new_line   
    li   $v0, 4           
    syscall

    jr $ra

main:
    # Inicializações
    li $s0, 4           # Número de linhas
    la $s1, X           # Endereço de X
    la $s2, Y           # Endereço de Y
    la $s3, Z           # Endereço de Z

	li $t0, 0			# i = 0
for_i:
	li $t1, 0			# j = 0
for_j:
	li $t2, 0			# k = 0
	li.s $f0, 0.0			# temp = 0

for_k:
	li.s $f1, 0.0			# prod = 0
	
	#load X[i][k]
	mul $t3, $s0, $s0	# $t3 = 4*4
	mul $t3, $t3, $t0	# $t3 = 4*4*i
	
	mul $t4, $s0, $t2	# $t4 = 4*k
	
	add $t5, $s1, $t3	# $t5 = X + (4*4*i) -> linha
	add $t5, $t5, $t4	# $t5 = X + (4*4*i) +(4*k) -> linha e coluna
	
	l.s $f2, 0($t5) 		# $f2 = X[i][k]
	
	
	#load Y[k][j]
	mul $t3, $s0, $s0	# $t3 = 4*4
	mul $t3, $t3, $t2	# $t3 = 4*4*k
	
	mul $t4, $s0, $t1	# $t4 = 4*j
	
	add $t5, $s2, $t3	# $t5 = Y + (4*4*i) -> linha
	add $t5, $t5, $t4	# $t5 = Y + (4*4*i) +(4*k) -> linha e coluna
	
	l.s $f3, 0($t5) 		# $f2 = Y[i][k]
	
	#calcular produto
	mul.s $f1, $f2, $f3	# prod = X[i][k] * Y[k][j] 
	add.s $f0, $f0, $f1	# temp += prod
	
	# for(k<4, k++)
	addi $t2, $t2, 1
	blt $t2, $s0, for_k

	# Z[i][j] = temp
	mul $t3, $s0, $s0	# $t3 = 4*4
	mul $t3, $t3, $t0	# $t3 = 4*4*i
	
	mul $t4, $s0, $t1	# $t4 = 4*j
	
	add $t5, $s3, $t3	# $t5 = Z + (4*4*i) -> linha
	add $t5, $t5, $t4	# $t5 = Z + (4*4*i) +(4*j) -> linha e coluna
	
	s.s $f0, 0($t5)		# $f2 = Z[i][k]


	# for(j<4, j++)
	addi $t1, $t1, 1
	blt $t1, $s0, for_j
	
	# for(i<4, i++)
	addi $t0, $t0, 1
	blt $t0, $s0, for_i 
	
print_Z:
	la $s4, 0($s3)		#carrega a linha de Z
	jal printArray

    la $s4, 16($s3)		#carrega a linha de Z
	jal printArray

    la $s4, 32($s3)		#carrega a linha de Z
	jal printArray

    la $s4, 48($s3)		#carrega a linha de Z
	jal printArray

exit:
    li $v0, 10          # Syscall para encerrar o programa
    syscall
