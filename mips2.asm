.data
d1:.word 25
d2: .word 18
d3: .word 0
     .text
main: lw $t1,d1
lw $t2,d2
add $t1, $t1, $t2
sw $t1, d3
