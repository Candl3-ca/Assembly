.data 
n: .word 4
sum: .word 0

    .text
    #calculate sum = 1+2+...+n
    
main: move $t2, $zero         #set $t2 to $t0
      move $t0, $zero         #set i ($t0) to 1
      addi $t0, $t0, 1      
      lw   $t1, n             #set &t1 to n
      
loop: slt $t3, $t1, $t0       #$t3 = n < i ? 1 : 0
      bne $t3, $zero, finish  #if $t3 =/= 0 go to finish
      add $t2, $t2, $t0       #add i to $t2
      add $t0, $t0, 1         #add i to $t0
      j   loop                #go to top of loop
      
finish: sw $t2, sum           #store $t2 in sum      