#Kyle Stanfield
#larger.asm --prints larger of two integers given by user

main:
        li      $v0, 5 #Read an integer into t0
        syscall
        move    $t0, $v0
        
        li      $v0, 5 #Read an integer into t1
        syscall
        move    $t1, $v0
        
        bgt     $t0, $t1, t0_larger #If t0 is larger go to t0_larger
        move    $a0, $t1
        b       end_if #Otherwise t1 is larger and go to end_if
t0_larger:
        move    $a0, $t0
end_if:
        li      $v0, 1
        syscall
        
        li      $v0, 10
        syscall