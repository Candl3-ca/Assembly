.data
a: .word 3
b: .word 2
c: .word 5
x: .word 4
y: .word 0

.text
#calculate y=ax^2+bx+c
lw $t1 , a
lw $t2 , b
lw $t3 , c
lw $t4 , x

mul  $t5, $t4, $t4
mul $t1, $t5, $t1

mul $t5, $t2, $t4
add $t5, $t5, $t1
add $t5, $t5, $t3

sw $t5, y
