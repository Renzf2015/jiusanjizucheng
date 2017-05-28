# Question 1
# Q1.s
	.data 
array1:  .asciiz  "zero    \n", "First   \n", "Second  \n", "Third   \n", "Fourth  \n",
                  "Fifth   \n", "Sixth   \n", "Seventh \n", "Eighth  \n", "Ninth   \n",
                  "*       \n", "*       \n", "*       \n", "*       \n", "*       \n", "*       \n", "*       \n",
                  "Alpha   \n", "Bravo   \n", "China   \n", "Delta   \n", "Echo    \n",
                  "Foxtrot \n", "Golf    \n", "Hotel   \n", "India   \n", "Juliet  \n",
                  "Kilo    \n", "Lima    \n", "Mary    \n", "November\n", "Oscar   \n",
                  "Paper   \n", "Quebec  \n", "Research\n", "Sierra  \n", "Tango   \n",
                  "Uniform \n", "Victor  \n", "Whisky  \n", "X-ray   \n", "Yankee  \n", "Zulu    \n",
                  "*       \n", "*       \n", "*       \n", "*       \n", "*       \n", "*       \n",
                  "alpha   \n", "bravo   \n", "china   \n", "delta   \n", "echo    \n",
                  "foxtrot \n", "golf    \n", "hotel   \n", "india   \n", "juliet  \n",
                  "kilo    \n", "lima    \n", "mary    \n", "november\n", "oscar   \n",
                  "paper   \n", "quebec  \n", "research\n", "sierra  \n", "tango   \n",
                  "uniform \n", "victor  \n", "whisky  \n", "x-ray   \n", "yankee  \n", "zulu    \n"
oth: .asciiz "*\n"
end: .asciiz "\n"
	.text
	.global main
	li $s0, 63 # ascii ? = 63
	li $s1, 48 # ascii 0 = 48
	li $s2, 122 # ascii z = 122
	li $s3, 10
main:
    li $v0, 12
    syscall
    move $t0, $v0
    li $v0, 4
    la $a0, end
    syscall
    move $v0, $t0
    beq $v0, $s0, exit
    bge $v0, $s1, haha
    j other
haha:
    ble $v0, $s2, hehe
    j other
hehe:
    sub $a0, $v0, $s1
    la $a1, array1
    mul $a0, $a0, $s3
    add $a0, $a1, $a0
    li $v0, 4
    syscall
    j main
other:
    li $v0, 4
    la $a0, oth
    syscall
    j main
exit:
    li $v0, 10
    syscall
    