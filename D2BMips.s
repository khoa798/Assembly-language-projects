 
#include <WProgram.h>

#include <xc.h>
# Khoa Hoang
# klhoang
# 
/* define all global symbols here */
.global main
.global read
.text
.set noreorder

.ent main
main:
    /* this code blocks sets up the ability to print, do not alter it */
   ADDIU $v0,$zero,1
    LA $t0,__XC_UART
    SW $v0,0($t0)
    LA $t0,U1MODE
    LW $v0,0($t0)
    ORI $v0,$v0,0b1000
    SW $v0,0($t0)
    LA $t0,U1BRG
    ADDIU $v0,$zero,12
    SW $v0,0($t0)

    
    
    LA $a0,WelcomeMessage
    JAL puts
    NOP
    
    
    
    LA $a0, inNumericString         # Load up address of inNumericString
    LOOP:
    LB $t0, 0($a0)                  # Load up first char of inNumericString
    LW $t1, MinusSign               # To check for negative
    ADD $t1, $t1, $t0               # Check for the ASCII value of minus sign
    BEQ $t1, $zero, isNegative      # Jump to flag number is negative if it is
    NOP
    BEQ $t0, $zero, MaskPTR         # Branch to MASK if end of decimal number in string
    NOP
    LA $t2, Int                     # Load up address of int
    LW $t4, 0($t2)                  # Load up data value of int
    BEQ $t4, $zero, STInt           # If it is first number of string, jump to store
    NOP
    ADDI $t3, $zero, 10             # for multiplication
    MUL $t4, $t4, $t3               # Do INT x 10
    LW $t3, DigitOP                 # To get decimal value of current number
    ADD $t3, $t3, $t0               # Char - 48 , gets decimal value from ASCII
    ADD $t4, $t4, $t3               # Add current number to INT x 10 ; Example: 2-->4 = 24
    SW $t4, Int                     # Store result into INT
    ADDI $a0, $a0, 1                # Point to next value in string
    B LOOP
    NOP
    #------
    STInt:
    LW $t3, DigitOP                 # Char - 48 to get decimal value
    ADD $t3, $t3, $t0               # Char - 48 here
    SW $t3, Int                     # Store that operation inside Int, now holding decimal value
    ADDI $a0, $a0, 1                # Point to next number in string
    B LOOP
    NOP
    #-------
    isNegative:
    LA $t2, NumIsNeg                # Load up address to remember number is negative
    LW $t3, NumIsNeg                # Load up data value of NumIsNeg
    ADDI $t3, $t3, 1                # Label the number is negative
    SW $t3, 0($t2)                  # Store into NumIsNeg to remember number is negative
    ADDI $a0, $a0, 1                # Point to next value in inNumericString
    B LOOP
    NOP
    #------
    Invert:
    LA $t1, Int                     # Load up address of Int
    LW $t2, 0($t1)                  # Load up data value of int
    NOR $t3, $t2, $zero             # Invert the decimal value
    ADDI $t3, $t3, 1                # Add 1 to get full 2sc representation
    SW $t3, 0($t1)                  # Store into Int
    B MaskAfterInvert               # Jump to mask new number after
    NOP
    MaskPTR:
    LW $t4, NumIsNeg                # Load up to see if number was negative
    ADDI $t4, $t4, -1               # Check for if number is negative
    BEQ $t4, $zero, Invert          # Jump to invert the number if was negative
    NOP
    MaskAfterInvert:
    LW $t1, Int                     # Load up the INT to be masked
    LW $t2, BitMask                 # Load up the mask
    LW $t3, Counter                 # Load up the counter to control mask
    LA $a1, outBinaryString         # Load up address storing outBinaryString
    MaskCONT:
    AND $t4, $t2, $t1               # use AND of mask to check
    BEQ $t4, $zero, StoreZero       # Go to store 0 if result is 0
    NOP
    ADDI $t6, $zero, 1              # Else it must be 1
    ADDI $t6, $t6, 48                # Get ASCII value of 1
    SB $t6, 0($a1)                  # Store 1 into char address of outBinaryString
    ADDI $a1, $a1, 1                # increment to point to next char in string
    SRL $t2, 1                      # Shift the mask to the right by 1
    ADDI $t3,$t3,-1                 # Decrement counter
    BGTZ $t3, MaskCONT              # Continue until counter is 0
    NOP
    BLEZ $t3, Done
    NOP
    #------
    StoreZero:
    ADDI $t5, $zero, 0              # Initialize register to be 0
    ADDI $t5, $t5, 48               # Get ASCII value of 0
    SB $t5, 0($a1)                  # Store 0 into char address of outBinaryString
    ADDI $a1, $a1, 1                # increment to point to next char in string
    SRL $t2, 1                      # Shift the mask to the right by 1
    ADDI $t3,$t3,-1                 # Decrement counter
    BGTZ $t3, MaskCONT              # Continue until counter is 0
    NOP
    BLEZ $t3, Done
    NOP
    #-----
    
    Done:
    LA $a0,DecimalMessage
    JAL puts
    NOP
    LA $a0,inNumericString
    JAL puts
    NOP
    
    LA $a0,BinaryMessage
    JAL puts
    NOP
    LA $a0,outBinaryString
    JAL puts
    NOP
    
    

    
    

endProgram:
    J endProgram
    NOP
.end main




.data
WelcomeMessage: .asciiz "Welcome to the converter\n"
DecimalMessage: .asciiz "The decimal number is: "
BinaryMessage: .asciiz "The decimal number is: "
BitMask:         .word 0x80000000
Counter:        .word 32
inNumericString: .asciiz "-5845"
MinusSign:      .word -45
Int:            .word 0
DigitOP:        .word -48
NumIsNeg:       .word 0
outBinaryString: .asciiz "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

