#Kyle Stanfield
#fizzbuzz.asm --Prints one through one-hundred, with numbers
#               divisible by three printing fizz, numbers
#               divisible by five printing buzz, and numbers
#               divisible by both printing fizzbuzz
#Registers Used:
#   t0 -- the iterative variable in the loop(i)
#   t1 -- the upper bound, 100 in this case
#   t2 -- stores 3 for division
#   t3 -- stores 5 for division
#   t4 -- stores $HI
#   t4 -- printed fizz or buzz flag


        .text
main:
        li      $t0, 1
        li      $t1, 100                #Setting registers
        li      $t2, 3
        li      $t3, 5
loop:
        move    $t5, $zero              #Set print flag to zero
        div     $t0, $t2                #divide i by 3
        mfhi    $t4                     #move remainder into t4
        beq     $t4, $zero, print_fizz  #
        
        move      $a0, $t0              #set i to be printed
        li      $v0, 1                  #print int
        syscall
        addi    $t0, $t0, 1
        
print_fizz:
        li      $t5, 1                  #set print flag to 1(printed)
        la      $a0, fizz               #
        li      $v0, 4
        syscall
        
        
exit:
        li      $v0, 10
        syscall
        
        .data
fizz:       .ascii "fizz"
buzz:       .ascii "buzz"
fizzbuzz:   .asciiz "fizzbuzz" #NOT NECESSARY