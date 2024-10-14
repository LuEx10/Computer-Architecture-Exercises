.data
vetor:  .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
##              0  1  2  3  4  5  6  7  8   9  10  11  12  13  14
tamanho: .word   15
mensagem: .asciiz "Digite o índice: "
newline: .asciiz "\n"

.text
.globl main

main:
    # carrega em $t0
    la $t0, vetor

loop:
    # impressao
    la $a0, mensagem
    li $v0, 4
    syscall

    # leitura indice
    li $v0, 5
    syscall
    move $t1, $v0  
	
	#pula linha
	la $a0, newline
    li $v0, 4
    syscall

    # carrega tamanho
    lw $t2, tamanho

    # checagem
    blt $t1, $zero, fim
    bge $t1, $t2, fim

    # mul por 4
    mul $t1, $t1, 4 
	
	# atualiza end
	add $t0, $t0, $t1

    # carrega em t1
    lw $t3, 0($t0)  

    # Imprime o valor
    move $a0, $t3
    li $v0, 1
    syscall

    # Loop de novo
    j loop
	

fim:
    # Fim do programa
    li $v0, 10
    syscall
