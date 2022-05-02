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

mul $t1, $t1, $t4
add $t1, $t1, $t2
mul $t1, $t1, $t4
add $t1, $t1, $t3

sw $t1, y