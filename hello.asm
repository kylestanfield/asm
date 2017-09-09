#Kyle Stanfield
#hello.asm
        .text
main:
        la      $a0, hello_msg   #load the address of hello_msg into $a0
        li      $v0, 4
        syscall
        
        li      $v0,10
        syscall
#Data
        .data
hello_msg:      .asciiz "Hello World\n"