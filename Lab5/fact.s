.data
input: .asciiz "Entre um Inteiro: "
output: .asciiz "Resultado: "
newline: .asciiz "\n"
.text 
.globl main 

fact:
	#ajustar stack
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	#if(n<1)
	slti $t0, $a0, 1
	beq $t0, $zero, Loop
	addi $v0, $zero, 1
	addi $sp, $sp, 8
	jr $ra
	
Loop:
	#else:
	addi $a0, $a0, -1
	jal fact
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	mul $v0, $a0, $v0
	jr $ra
	
main:
	#Pedir input
	la $a0, input
	li $v0, 4
	syscall
	
	#le int
	li $v0, 5
	syscall
	move $a0, $v0
	
	#executar fatorial
	jal fact
	
	#exibir resultado
	move $t1, $v0
	
	#pula linha
	la $a0, newline
	li $v0, 4
	syscall
	
	la $a0, output
	li $v0, 4
	syscall
	
	move $a0, $t1
    li $v0, 1
    syscall
	
EXIT:
# Fim do programa
    li $v0, 10            # Chamada de sistema para sair
    syscall