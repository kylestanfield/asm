#Kyle J. Stanfield -- 9/8/17
#add.asm -- A program that computes the sum of 1 and 2,
#       leaving the result in register $t0.
#Registers used:
#       t0  -used to hold the result
#       t1  -used to hold the value 1
#       v0  -syscall parameter

main:
        li      $t1, 1
        add     $t0, $t1, 2
        
        move      $v0,$t0
        
        
        li $v0, 10
        syscall