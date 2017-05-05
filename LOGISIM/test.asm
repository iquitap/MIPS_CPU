.text
lui $a0, 0x1

addi $t0, $zero, 4
srav $a0, $a0, $t0

lui $a0, 0xf000

addi $t0, $zero, 8
srav $a0, $a0, $t0

addi $t0, $zero, 0x1
addi $sp, $sp, 4
sw $a0, ($sp)
sb $t0, ($sp)
lw $a0, ($sp)


addi $v0,$zero,10
addi $t0, $zero, 1
addi $a0, $zero, 1
bgtz $t0, l1
addi $a0, $zero, 2
syscall

l1:
addi $t0, $zero, -1
addi $a0, $zero, 3
bgtz $t0, l2
addi $a0, $zero, 4
syscall

l2:
addi $t0, $zero, 1
addi $a0, $zero, 5
addi $a0, $zero, 6
syscall