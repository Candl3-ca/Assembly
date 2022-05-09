
.data
st1: .asciiz "Enter 2 numbers \n"
choice: .asciiz "Enter Choice for operation\n"
ch1: .asciiz "1-addition(+)\n"
ch2: .asciiz "2-Subtraction (-)\n"
ch3: .asciiz "3- multiplication(*)\n"
ch4: .asciiz "4-division (/)\n"
an1: .asciiz "\nSum is \n"
an2: .asciiz "\nDifference is \n"
an3: .asciiz "\nProduct is \n"
an4: .asciiz "\nQoutiet is \n"
an4_: .asciiz "\nRemainder is \n"

#$s0 contains number 1
#$s1 contains number 2
#$t0 contains choice


.text
.globl main
main:

li $v0, 4
la $a0, st1
syscall
li $v0,5
syscall
addi $s0,$v0,0
li $v0,5
syscall
addi $s1, $v0,0
li $v0,4
la $a0, choice
syscall
li $v0,4
la $a0, ch1
syscall
li $v0,4
la $a0, ch2
syscall
li $v0,4
la $a0, ch3
syscall
li $v0,4
la $a0, ch4
syscall
li $v0, 5
syscall
#CASES

add $t0, $zero, $v0
#case 1
addi $t1,$zero,1
beq  $t0,$t1, addd
#case 2
addi $t1, $zero,2
beq $t0, $t1, subb
#case 3
addi $t1, $zero,3
beq $t0, $t1, mull
#case 4
addi $t1, $zero, 4
beq $t0, $t1, divv
#default case
j alll
#case 1 ... executes this part
addd:
li $v0, 4
la $a0,an1
syscall
add $a0, $s0, $s1
li $v0, 1
syscall
j exit
#case 2 ... executes this part
subb:
li $v0, 4
la $a0,an2
syscall
sub $a0, $s0, $s1
li $v0, 1
syscall
j exit
#case 3 ... executes this part
mull:
li $v0, 4
la $a0,an3
syscall
mult $s0, $s1
li $v0, 1
mfhi $a0
syscall
mflo $a0
syscall
j exit
#case 4 ... executes this part
divv:
li $v0, 4
la $a0,an4
syscall
div $s0, $s1
li $v0, 1
mflo $a0
syscall
li $v0, 4
la $a0,an4_
syscall
li $v0,1
mfhi $a0
syscall
j exit
# by defualt... executes this part
alll:
#addition
li $v0, 4
la $a0,an1
syscall
add $a0, $s0, $s1
li $v0, 1
syscall
#subtraction
li $v0, 4
la $a0,an2
syscall
sub $a0, $s0, $s1
li $v0, 1
syscall
#multiplication
li $v0, 4
la $a0,an3
syscall
mult $s0, $s1
li $v0, 1
mfhi $a0
syscall
mflo $a0
syscall
#division..Q and R
li $v0, 4
la $a0,an4
syscall
div $s0, $s1
li $v0, 1
mflo $a0
syscall
li $v0, 4
la $a0,an4_
syscall
li $v0,1
mfhi $a0
syscall
#exit 
exit:
li $v0, 10
syscall
