#Kyle Stanfield
#test.asm -- loop 1 through 100, printing i and remainder of i/3
#Registers Used:
#   t0 -- holds i
#   t1 -- holds upper bound(100)
#   t2 -- holds 3 for division
#   t3 -- holds remainder from $HI

        .text
main:
        li      $t0, 1
        li      $t1, 100
        li      $t2, 3
loop:
        move    $a0, $t0            #Print i 
        li      $v0, 1
        syscall
        li      $a0, 0x20           #Load space character into a0
        li      $v0, 0xB            #load 11 into v0, which prints lower 8 bits of a0 as ascii
        
        syscall
        
        div     $t0, $t2            #divide i by 3
        mfhi    $t3                 #move remainder into t3
        
        move    $a0, $t3            #print t3
        li      $v0, 1
        syscall
        
        li      $a0, 0xA
        li      $v0, 0xB
        syscall
    
        addi    $t0, 1
        beq     $t0, $t1, exit
        b       loop

exit:
        li      $v0, 10
        syscall
        