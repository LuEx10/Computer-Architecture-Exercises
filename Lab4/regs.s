.text
.globl main

main:

#passa valor
addi $s0, $zero, 15 #g

#passa valor
addi $s1, $zero, 36 #h

#passa valor
addi $s2, $zero, 12 #i

#passa valor
addi $s3, $zero, 19 #j

add $t0, $s0, $s1 #soma g e h em t0

add $t1, $s2, $s3 #soma i e j em t1

sub $s4, $t0, $t1 #subtrai t1 e t0

jr $ra