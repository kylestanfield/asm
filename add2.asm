#Kyle J. Stanfield -- 9/8/17
#add.asm -- A program that computes the sum of 1 and 2,
#       leaving the result in register $t0.
#Registers used:
#       t0  -used to hold the first integer
#       t1  -used to hold the second integer
#       t2  -used to hold
#       v0  -syscall parameter
#       a0  -syscall parameter
#       

main:
        li      $v0, 5
        syscall
        move    $t0, $v0
        
        li      $v0, 5
        syscall
        move    $t1, $v0
        
        add     $t2, $t0, $t1
        
        move    $a0, $t2
        li      $v0, 1
        syscall        
        
        li $v0, 10
        syscall