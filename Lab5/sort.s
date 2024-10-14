.data
array:      .word 117, 250, 105, 50, 91, 122, 131, 45, 75, 92, 58, 8, 79, 231, 16, 113
separador:  .asciiz ", "
new_line: .asciiz "\n"
arraybasemsg: .asciiz "Array inicial: "
arraysortmsg: .asciiz "Array ordenado: "

.text
.globl main

printArray:
    addi $sp,$sp,-8
    sw $t0,0($sp)
    sw $t1,4($sp)
    
    li $s1,16
    la $s0,array

    add $t0,$s0,$zero
    li $t1,0					# i = 0

forPrintArray:
    beq $t1, $s1, endForPrint	# if(i == tamanho), end for

    lw   $a0, 0($t0)			# $t1 = Array(i)
    li   $v0, 1 				# imprimir inteiro
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

    addi $sp,$sp,8
    
    la   $a0, new_line   
    li   $v0, 4           
    syscall
	syscall

    jr $ra

bubbleSort:
    blez $s1, endBubbleSort

    li $t0, 0					# i1 = 0
    li $t1, 1					# i2 = 1
	
bubbleFor:
    bge $t0, $s1, endLoop  	

								# $t2 = arr[i], $t3 = arr[i+1]
    sll $t4, $t0, 2        
    add $t4, $t4, $s0      
    lw $t2, 0($t4)         

    sll $t5, $t1, 2        
    add $t5, $t5, $s0      
    lw $t3, 0($t5)         

    ble $t2, $t3, noSwap   		# Se arr[i] <= arr[i+1], não troca
	
								# swap arr[i] e arr[i+1]
    sw $t3, 0($t4)         		# $t3 = arr[i]
    sw $t2, 0($t5)         		# $t2 = arr[i+1]

noSwap:
    addi $t0, $t0, 1       		# i1++
    addi $t1, $t1, 1       		# i2++
    j bubbleFor

endLoop:
    addi $s1, $s1, -1      		# Decrementa o tamanho do array
    addi $sp,$sp,-4
    sw $ra,0($sp)
    j bubbleSort           		# Chamada recursiva

endBubbleSort:
    lw $ra,0($sp)
    addi $sp,$sp,4

    jr $ra
	
main:
    la   $s0, array         	# Base do array
    li   $s1, 16           		# Numero de elementos

    add $t0,$s0,$zero 		
    li $t1,0
	
	la $a0, arraybasemsg
	li $v0, 4
	syscall
	
    jal printArray
    jal bubbleSort
	
	la $a0, arraysortmsg
	li $v0, 4
	syscall
	
    jal printArray

EXIT:
    li $v0, 10             
    syscall
