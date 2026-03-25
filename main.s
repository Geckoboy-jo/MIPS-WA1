.data
newline: .asciiz "\n"

.text
.globl main

call: .word 0
startValOne: .word 0
startValTwo: .word 0
index: .word 0
main:
    li $a0, 0
    li $a1, 1
    li $a2, 7

    sw $a0, startValOne
    sw $a1, startValTwo
    sw $a2, call

    jal fibFunction

    li $a0, 0
    li $a1, 1
    li $a2, 7
    sw $a0, startValOne
    sw $a1, startValTwo
    sw $a2, call

    jal fibFunctionRecursive

end:
    li $v0, 10
    syscall
fibFunction:
    li $t2, 0
    sw $t2, index
forLoop:
    lw $t2, index
    lw $t3, call
    beq $t2, $t3, done

    lw $a0, startValOne
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    lw $t0, startValOne
    lw $t1, startValTwo
    add $t4, $t0, $t1
    sw $t1, startValOne
    sw $t4, startValTwo

    addi $t2, $t2, 1
    sw $t2, index
    j forLoop

done:
    lw $v0, startValOne
    jr $ra
fibFunctionRecursive:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    lw $t0, call
    beqz $t0, return
    li $t4, 1
    beq $t0, $t4, baseCase
    addi $t0, $t0, -1
    sw $t0, call
    jal fibFunctionRecursive

    lw $t1, startValOne
    lw $t2, startValTwo
    add $t3, $t1, $t2
    sw $t2, startValOne
    sw $t3, startValTwo

    lw $a0, startValOne
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    j return

baseCase:
    lw $a0, startValOne
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

return:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


