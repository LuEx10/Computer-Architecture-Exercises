.data
mask_highest_bit: .word 0x80000000
mask_frac: .word 0x007FFFFF
new_line: .asciiz "\n"
input: .asciiz "insira um valor inteiro sem sinal: "
output: .asciiz "representacao em ponto flutuante: "

.text
.globl main
	
main:
#a) pedir input de numero decimal sem sinal
	#le int
	li $v0, 5
	syscall
	move $a0, $v0
	
#b) conversao do numero para float de 32 bits
	move $t1, $a0			# t1 e usado para calcular o expoente
	li $t0, 0				# zera para o resultado final
	li $t2, 0				# contador de shifts para calcular o expoente
	
loop_exp: # sll até o primeiro '1' no bit mais significativo (descontando bit de sinal)
	lw $t5, mask_highest_bit
	and $t3, $t1, $t5
	beq $t3, $t5, end_loop
	
	sll $t1, $t1, 1			# shift left
	addi $t2, $t2, 1		# incrementa contador
	
	j loop_exp
end_loop:

	addi $t2, $t2, 8
	li $t4, 31
	sub $t2, $t4, $t2		# exp real = t2
	addi $t2, $t2, 127		# exp normalizado
	sll $t2, $t2, 23		# exp na posicao correta
	
	srl $t1, $t1, 8			# mantissa na posicao certa
	lw $t5, mask_frac
	and $t1, $t1, $t5 # elimina o '1' antes da virgula
	
	or $t0, $t1, $t2		#guarda o resultado em t0	
	
#c) copiar para um dos registradores de ponto flutuante	

	mtc1 $t0, $f0

#d) imprimir na tela o numero resultante
    la $a0, output
	li $v0, 4
	syscall
	
	mov.s $f12, $f0 
	li $v0, 2
	syscall

EXIT:
    li $v0, 10             
    syscall
