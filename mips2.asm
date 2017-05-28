# Question 2
# Q2.s
	 .data 
success: .asciiz "Success! Location: "
fail:    .asciiz "Fail!\n"
end:     .asciiz "\n"
	 .text
	 .global main
	 li $s2, 63
	 li $s3, 0
	 li $s4, 128
	 li $s5, 268435456
main:
    move $a1, $s4
    move $a0, $s5
    li $v0, 8 # read string
    syscall
    move $s0, $a0 # address
    move $a1, $s4 # len
    j read
read:
    li $v0, 12 # read char
    syscall
    move $t0, $s0
    move $t1, $s4
    beq $v0, $s2, exit
    j loop
loop:
    lb $t2, ($t0)
    beq $t2, 0, fai
    beq $t2, $v0, suc
    addi $t0, $t0, 1
    j loop
suc:
    li $v0, 4
    la $a0, end
    syscall
    la $a0, success
    syscall
    li $v0,1
    sub $a0, $t0, $s5
    addi $a0, $a0, 1
    syscall
    li $v0, 4
    la $a0, end
    syscall
    j read 
fai:
    li $v0, 4
    la $a0, end
    syscall
    la $a0, fail
    syscall
    li $v0, 4
    la $a0, end
    syscall
    j read 
exit:
    li $v0, 10
    syscall
    
