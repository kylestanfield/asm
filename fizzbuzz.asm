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
#   t5 -- printed fizz or buzz flag


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
        
        b       check_buzz
        
print_fizz:
        li      $t5, 1                  #set print flag to 1(printed)
        la      $a0, fizz               #then print "fizz"
        li      $v0, 4
        syscall

check_buzz:
        div     $t0, $t3                #divide i by 5
        mfhi    $t4                     #move the remainder into t4
        beq     $t4, $zero, print_buzz  #check if remainder is 0, if so branch to print buzz
        b       check_i                 #otherwise jump past it

print_buzz:
        li      $t5, 1
        la      $a0, buzz               #print buzz
        li      $v0, 4
        syscall

check_i:
        bgtz    $t5, prep_loop          #if fizz or buzz has been printed do not print i
        move    $a0, $t0                #otherwise print i
        li      $v0, 1
        syscall
        
prep_loop:
        addi    $t0, 1                  #add one to i, print a newline
        li      $a0, 0xA
        li      $v0, 0xB
        syscall
        bne     $t0, $t1, loop          #if i is equal to 100, stop loop, otherwise loop
        
        
exit:
        li      $v0, 10
        syscall
        
        .data
fizz:       .asciiz "fizz"
buzz:       .asciiz "buzz"