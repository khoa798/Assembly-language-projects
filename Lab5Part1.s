#include <WProgram.h>
#include <xc.h>
/* define all global symbols here */
/* Khoa Hoang, klhoang */
/* Lab5 Part 1: Intro to Uno32 */
.global main


.text
.set noreorder

/* (E0 - E7) are LED */
/* (D8 - D11) are SWITCHES */
/* (RD5 - RD7) (BTN2 -BTN4) && RF1 = BTN1 */


.ent main
main:       
        la $t0, TRISE           # Clears out TRISE
        li $s0, 0               # load up immediate 0
        sw $s0, 0($t0)          # set lights to output

LOOP:   la $t0, PORTD           # Load PORTD address into t0
        lw $t1, 0($t0)          # Load data of t0 into t1
        andi $t2,$t1,0x0F00     # AND t1 with SWITCHES bit positions and store into t2
        srl $t2, 8              # shift the bits right by 8 to match LED bits
        la  $t0, PORTE          # Load PORTE address into t0
        sw  $t2, 0($t0)         # Load switched bits into LED bits and turn on

        la $t0, PORTD           # Similar to above
        lw $t1, 0($t0)          #
        andi $t3,$t1, 0x00E0    # AND t1 with BUTTON bit positions and store into t3
        la $t0, PORTE           # Load PORTE address into t0
        sw $t3, 0($t0)          # Load button bit position into LED bits and turn on
        la $t5, PORTF           # Load PORTF in t5
        lw $t5, 0($t5)          # Load t5 data to itself
        andi $t4,$t5,0x0002     # AND t5 with first button bit position into t4
        sll $t4, 3              # shift left by 3 to match to LED5 for button 1
        sw $t4, 0($t0)          # Load button bit result into LED 5 bit position, turning on
        b LOOP
        NOP

.end main
