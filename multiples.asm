#Kyle Stanfield
#multiples.asm
#Registers Used:
#   t0  --Stores the int A
#   t1  --Stores the int B
#   t2  --Stores the int S, which is A*B
#   t3  --Stores the int m, which is the current multiple
        
        .text
main:
        li      $v0, 5      #read an int A from the user and put it into t0
        syscall
        move    $t0, $v0
        
        li      $v0, 5      #read an int B from the user and put it into t1
        syscall
        move    $t1, $v0
        
        blez    $t1, exit #If t1 is less than 0, jump to the_end
        mul     $t2, $t1, $t0
        
        move    $t3, $t0
        
multiple_loop:

        move    $a0, $t3
        li      $v0, 1
        syscall
        la      $a0, space
        li      $v0, 4
        syscall
        beq     $t3, $t2, exit
        
        add     $t3, $t3, $t0
        b       multiple_loop
        
        
exit:

        li      $v0, 10
        syscall
        
        .data
space:      .asciiz " "