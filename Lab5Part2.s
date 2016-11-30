#include <WProgram.h>
#include <xc.h>
/* define all global symbols here */
/* Khoa Hoang, klhoang */
/* Lab5 Part 2: Intro to Uno32 */
.global main
.global myDelay


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

LOOP:   la $t0, PORTESET        # Load up address of PORTE(LEDs)
        lw $t4, LEDNum          # Load up binary value to turn on LEDs
        sw $t4, 0($t0)          # Store t4 into PORTE, turning on first LED
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# Load up address of PORTE(LEDs)
		lw $t4, LEDNum			# Load up current LED
		sw $t4, 0($t0)			# Turn off LED after delay
		# -------- TURN ON&OFF LED2 --------------
		la $t0, PORTESET		# To turn on LED2
		lw $t4, LEDNum
		sll $t4, 1				# Shift number of bits to left for LED2
		sw $t4, 0($t0)			# Turn on LED2
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED2
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 1
		sw $t4, 0($t0)			# Turn off LED2
		# -------------- TURN ON&OFF LED3 -------------- 
		la $t0, PORTESET		# To turn on LED3
		lw $t4, LEDNum
		sll $t4, 2				# Shift number of bits to left for LED3
		sw $t4, 0($t0)			# Turn on LED3
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED3
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 2
		sw $t4, 0($t0)			# Turn off LED3
		# --------------- TURN ON&OFF LED4 ----------------
		la $t0, PORTESET		# To turn on LED4
		lw $t4, LEDNum
		sll $t4, 3				# Shift number of bits to left for LED4
		sw $t4, 0($t0)			# Turn on LED4
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED4
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 3
		sw $t4, 0($t0)			# Turn off LED4
		# --------------- TURN ON&OFF LED5 ----------------
		la $t0, PORTESET		# To turn on LED5
		lw $t4, LEDNum
		sll $t4, 4				# Shift number of bits to left for LED5
		sw $t4, 0($t0)			# Turn on LED5
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED5
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 4
		sw $t4, 0($t0)			# Turn off LED5
		# --------------- TURN ON&OFF LED6 ----------------
		la $t0, PORTESET		# To turn on LED6
		lw $t4, LEDNum
		sll $t4, 5				# Shift number of bits to left for LED6
		sw $t4, 0($t0)			# Turn on LED6
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED6
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 5
		sw $t4, 0($t0)			# Turn off LED6
		# --------------- TURN ON&OFF LED7 ----------------
		la $t0, PORTESET		# To turn on LED7
		lw $t4, LEDNum
		sll $t4, 6				# Shift number of bits to left for LED7
		sw $t4, 0($t0)			# Turn on LED7
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED7
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 6
		sw $t4, 0($t0)			# Turn off LED7
		# --------------- TURN ON&OFF LED8 ----------------
		la $t0, PORTESET		# To turn on LED8
		lw $t4, LEDNum
		sll $t4, 7				# Shift number of bits to left for LED8
		sw $t4, 0($t0)			# Turn on LED8
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED8
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 7
		sw $t4, 0($t0)			# Turn off LED8
		# --------------- TURN ON&OFF LED7 ----------------
		la $t0, PORTESET		# To turn on LED7
		lw $t4, LEDNum
		sll $t4, 6				# Shift number of bits to left for LED7
		sw $t4, 0($t0)			# Turn on LED7
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED7
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 6
		sw $t4, 0($t0)			# Turn off LED7
		# --------------- TURN ON&OFF LED6 ----------------
		la $t0, PORTESET		# To turn on LED6
		lw $t4, LEDNum
		sll $t4, 5				# Shift number of bits to left for LED6
		sw $t4, 0($t0)			# Turn on LED6
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED6
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 5
		sw $t4, 0($t0)			# Turn off LED6
		# --------------- TURN ON&OFF LED5 ----------------
		la $t0, PORTESET		# To turn on LED5
		lw $t4, LEDNum
		sll $t4, 4				# Shift number of bits to left for LED5
		sw $t4, 0($t0)			# Turn on LED5
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED5
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 4
		sw $t4, 0($t0)			# Turn off LED5
		# --------------- TURN ON&OFF LED4 ----------------
		la $t0, PORTESET		# To turn on LED4
		lw $t4, LEDNum
		sll $t4, 3				# Shift number of bits to left for LED4
		sw $t4, 0($t0)			# Turn on LED4
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED4
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 3
		sw $t4, 0($t0)			# Turn off LED4
		# -------------- TURN ON&OFF LED3 -------------- 
		la $t0, PORTESET		# To turn on LED3
		lw $t4, LEDNum
		sll $t4, 2				# Shift number of bits to left for LED3
		sw $t4, 0($t0)			# Turn on LED3
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED3
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 2
		sw $t4, 0($t0)			# Turn off LED3
		# -------- TURN ON&OFF LED2 --------------
		la $t0, PORTESET		# To turn on LED2
		lw $t4, LEDNum
		sll $t4, 1				# Shift number of bits to left for LED2
		sw $t4, 0($t0)			# Turn on LED2
        la $t1, PORTD           # Load PORTD address into t1, to check for switches
        lw $t2, 0($t1)          # Load data of t1 into t2
        andi $a0, $t2,0x0F00    # AND t1 with 1111 and store into a0, for values of switches
        ADD $a0, $a0, 1       	# Add value of 1 to result and store into a0
		jal myDelay				# Wait for delay
		NOP
		la $t0, PORTECLR		# To turn off LED2
		lw $t4, LEDNum			# Load up current LED
		sll $t4, 1
		sw $t4, 0($t0)			# Turn off LED2
		b LOOP
		NOP
.end main

.ent myDelay
.text
myDelay:   
		lw $t5, baseDelay		# Load up large constant for loop
		mul $t5, $t5, $a0		# Multiply 
Timer:	ADD $t5, $t5, -4		# Decrement loop
		BGTZ $t5, Timer			# Apply software delay
		NOP
		jr $ra					# Return to main function.
		NOP
.end myDelay


.data
baseDelay: .word 0x0800 # .word(MIPS) = .fill(LC3)
LEDNum: .word 0x1 # To turn on LED1-LED7, starting at 1