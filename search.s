.data
newline: .asciiz "\n"
promptArray: .asciiz "Please enter 10 numbers from least to greatest\n"
promptValue: .asciiz "What is the target: "
foundMsg: .asciiz "Number at index: "

.align 2
array: .space 40

.text
.globl main

main:
	li $v0, 4
	la $a0, promptArray
	syscall

	la $t0, array
	li $t1, 0

loop:
	beq $t1, 10, read

	li $v0, 5
	syscall

	sw $v0, 0($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j loop

read:
	li $v0, 4
	la $a0, promptValue
	syscall

	li $v0, 5
	syscall
	move $t7, $v0

	la $t0, array
	li $t4, 0

search:
	lw $t6, 0($t0)
	beq $t6, $t7, found

	addi $t0, $t0, 4
	addi $t4, $t4, 1
	j search

found:
	li $v0, 4
	la $a0, foundMsg
	syscall

	li $v0, 1
	move $a0, $t4
	syscall

	li $v0, 4
	la $a0, newline
	syscall
	j exit

exit:
	li $v0, 10
	syscall
