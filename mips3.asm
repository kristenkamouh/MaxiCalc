# 		CSC320 Final Project
#		Kristen Al Kamouh,
# 		Olexandr Ghanem &
#		Rabih Houssami



# variables
.data
	intro: .asciiz "Welcome to MaxiCalc \n"
	opQ: .asciiz "What do you want to solve:\n1- addition problem\n2- subraction problem\n3- integer multiplication problem\n4- integer division problem\n5- modulo problem\n6- square problem\n7- factorial problem\n8- sum(n,m) problem\n9- powers problem\n"
	varA: .asciiz "Enter your first number: "
	additionText: .asciiz "addition problem?\n"
	subtractionText: .asciiz "subtraction problem?\n"
	multiplicationText: .asciiz "multiplication problem?\n"
	divisionText: .asciiz "division problem?\n"
	leadingZero: .asciiz "0"
	moduloText: .asciiz "modulo problem?\n"
	squareText: .asciiz "What integer would you like to square?\n"
	factorialText: .asciiz "What integer do you want solved for your factorial problem?\nFactorials are solved using non-negative numbers\n***Please use non-negative numbers***\n"
	sumText: .asciiz "sum problem?\n"
	sumWarningText:	.asciiz "***Please make sure your first variable is smaller than your second variable***\n***Please use non-negative numbers***\n"
	powersText: .asciiz "powers problem? [x^n, n>=0]\n"
	powersWarningText: .asciiz "**ENTER NON-NEGATIVE NUMBERS**\n"
	varB: .asciiz "Enter your second number: "
	res: .asciiz "The answer is: "
	decimal: .asciiz "."
	spacer: .asciiz "\n"
	contQ: .asciiz "\nDo you want to solve another problem? Yes (1) or No (2) ?\n"
	gB: .asciiz "Goodbye!"
	zero: .asciiz "0"
	one: .asciiz "1"
	division_by_zero_message: .asciiz "Error: Division by zero !\n"
	

.text
	.globl main

		main:
			#greeting
			li $v0, 4
			la $a0, intro
			
			# background
			

		#keep asking the operation question till the user breaks

		loop:
			#operation question
			li $v0, 4
			la $a0, opQ
			syscall

			#read operation type input
			li $v0, 5
			syscall
			move $s0, $v0 

			#operation types
			#checks if the user wanted an addition problem
			bne $s0, 1, onto2
			j aditionFunction

		#checks if the user wanted a subtraction problem
		onto2:	
			bne $s0, 2, onto3
			j subtractionFunction

		#checks if the user wanted a multiplication function
		onto3:	
			bne $s0, 3, onto4
			j multiplicationFunction

		#checks if the user wanted a division problem
		onto4:	
			bne $s0, 4, onto5
			j divisionFunction

		#checks if the user wanted a modulus problem
		onto5:	
			bne $s0, 5, onto6
			j moduloFunction

		#checks if the user wanted an x^2 problem
		onto6:	
			bne $s0, 6, onto7
			j squareFunction

		#checks if the user wanted a factorial problem
		onto7:	
			bne $s0, 7, onto8
			j factorialFunctionStart

		#checks if the user wanted a sum(n,m) function
		onto8:	
			bne $s0, 8, onto9
			j sumFunction

		#checks if the user wanted a x^n, n>=0 problem
		#My "special function"
		onto9:	
			bne $s0, 9, loop
			j powersFunction


		aditionFunction:
			#var1Q
			li $v0, 4
			la $a0, varA
			syscall
			li $v0, 4
			la $a0, additionText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			#var2Q
			li $v0, 4
			la $a0, varB
			syscall
			li $v0, 4
			la $a0, additionText
			syscall
			li $v0, 5
			syscall
			move $t2, $v0

			#operation
			add $t3, $t1, $t2
	
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	

		subtractionFunction:
			#var1Q
			li $v0, 4
			la $a0, varA
			syscall
			li $v0, 4
			la $a0, subtractionText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			#var2Q
			li $v0, 4
			la $a0, varB
			syscall
			li $v0, 4
			la $a0, subtractionText
			syscall
			li $v0, 5
			syscall
			move $t2, $v0
	
			#operation
			sub $t3, $t1, $t2
		
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again


		multiplicationFunction:
			#var1Q
			li $v0, 4
			la $a0, varA
			syscall
			li $v0, 4
			la $a0, multiplicationText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			#var2Q
			li $v0, 4
			la $a0, varB
			syscall
			li $v0, 4
			la $a0, multiplicationText
			syscall
			li $v0, 5
			syscall
			move $t2, $v0
	
			#operation
			mul $t3, $t1, $t2
		
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	
	
		divisionFunction:
	    		# Prompt for first number
	    		li $v0, 4
	    		la $a0, varA
	    		syscall
	    
	    		# Read first number
	    		li $v0, 5
	   		syscall
	    		move $t0, $v0
	       
	    		# Prompt for second number
	    		li $v0, 4
	    		la $a0, varB
	    		syscall
	    
	    		# Read second number
	    		li $v0, 5  
	    		syscall
	    		move $t1, $v0
	    		beqz $t1, division_by_zero  # Branch if divisor (t1) is zero
	
	    		# Store $t0 to $t4 to preserve it
	   		 move $t4, $t0
	    
	    		# Perform integer division
	    		div $t0, $t0, $t1   # $t0 = $t0 / $t1
	    
	    		# Store remainder in $t2
	    		mfhi $t2  # $t2 = $t0 % $t1
	    
	    		# Convert remainder to decimal part (2 decimal places)
	    		mul $t2, $t2, 100
	    
	    		# Calculate decimal part
	    		div $t2, $t2, $t1   # $t2 = $t2 / $t1
	
	    		# Display division result (integer part)
	    		li $v0, 4
	    		la $a0, res
	    		syscall
	    		li $v0, 1
	    		move $a0, $t0
	    		syscall
	
	    		# Display decimal point
	    		li $v0, 4
	    		la $a0, decimal
	    		syscall
	
	   		# Check if the decimal part is less than 10
	    		# If so, print a leading zero
	    		li $t3, 10
	    		bge $t2, $t3, skipLeadingZero
	    		li $v0, 4
	    		la $a0, zero
	    		syscall
	
		skipLeadingZero:
	    		move $a0, $t2
	    		li $v0, 1
	    		syscall
	
	    		# Restore $t0
	    		move $t0, $t4
	
	    		# Display spacer
	    		li $v0, 4
	    		la $a0, spacer
	    		syscall
	
	    		j again
	    		
	    	division_by_zero:
	  		# Print error message for division by zero
	  		li $v0, 4
	  		la $a0, division_by_zero_message  # Load address of error message string
	  		syscall
	
	  		j divisionFunction
    		
    		
		moduloFunction:
			#var1Q
			li $v0, 4
			la $a0, varA
			syscall
			li $v0, 4
			la $a0, moduloText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			#var2Q
			li $v0, 4
			la $a0, varB
			syscall
			li $v0, 4
			la $a0, moduloText
			syscall
			li $v0, 5
			syscall
			move $t2, $v0
	
			#exception handeling
			bltz $t1, moduloFunction
			bltz $t2, moduloFunction
	
			#operation
			rem $t3, $t1, $t2
		
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	
	
		squareFunction:
			#var1Q
			li $v0, 4
			la $a0, squareText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
		
			#operation
			mul $t2, $t1, $t1
		
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t2
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
	
			j again
		
		
		factorialFunctionStart:
			#var1Q
			li $v0, 4
			la $a0, factorialText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
	
			add $t7, $t1, 0
			sub $t7, $t7, 1
	
			#special cases for factorial
			bltz $t1, factorialFunctionStart
			beq $t1, 0, ans1
			beq $t1, 1, ans1
			j factorialFunctionLoop
	
	
		factorialFunctionLoop:
			mul $t1, $t1, $t7
			sub $t7, $t7, 1
			bne $t7, 0, factorialFunctionLoop
			j factorialAns


		factorialAns:
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t1
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	
	
		sumFunction:
			#var1Q
			li $v0, 4
			la $a0, sumWarningText
			syscall
			li $v0, 4
			la $a0, varA
			syscall
			li $v0, 4
			la $a0, sumText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			#var2Q
			li $v0, 4
			la $a0, varB
			syscall
			li $v0, 4
			la $a0, sumText
			syscall
			li $v0, 5
			syscall
			move $t2, $v0
	
			#register set asside
			add $t3, $t1, 0
	
			#Exception handling
			bltz $t1, factorialFunctionStart
			slt $t5, $t1, $t2
			bne $t5, 1, sumFunction
			j sumFunctionLoop
	
	
		sumFunctionLoop:
			add $t1, $t1, 1
			add $t3, $t1, $t3
			bne $t2, $t1, sumFunctionLoop
			j sumAns
	
	
		sumAns:
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	
		
	
		powersFunction:
			#var1Q
			li $v0, 4
			la $a0, varA
			syscall
			li $v0, 4
			la $a0, powersText
			syscall
			li $v0, 5
			syscall
			move $t1, $v0
			
			#var2Q
			li $v0, 4
			la $a0, varB
			syscall
			li $v0, 4
			la $a0, powersText
			syscall
			li $v0, 5
			syscall
			move $t2, $v0
	
			#load my variables
			mul $t3, $t1, $t1
			sub $t4, $t2, 1
	
			#exception handeling
			beq $t2, 0, ans1
			beq $t1, 0, ans0
			beq $t2, 2, powersExceptionAns
			bltz $t1, powersFunction
			bltz $t2, powersFunction
			j powersFunctionLoop
	
	
		powersExceptionAns:
			#operation
			mul $t3, $t1, $t1
		
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
	
			j again
	
	
		powersFunctionLoop:
			mul $t3, $t3, $t1
			sub $t4, $t4, 1
			beq $t4, 1, powersAns
			j powersFunctionLoop
		
		

		powersAns:
			#print
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 1
			move $a0, $t3
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	
	
		#special case function
		ans1:
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 4
			la $a0, one
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
		
		

		#special case function
		ans0:
			li $v0, 4
			la $a0, res
			syscall
			li $v0, 4
			la $a0, zero
			syscall
			li $v0, 4
			la $a0, spacer
			syscall
			j again
	
	
		#asks user if they want to solve another equation
		again:
			li $v0, 4
			la $a0, contQ
			syscall

			#read cont ques input
			li $v0, 5
			syscall
			move $s0, $v0
	
			#reloopQ
			bne $s0, 1, goodbye
			j loop
	
	
		#terminate and exit program
		goodbye:
			li $v0, 4
			la $a0, gB
			syscall
	
			li $v0, 10
			syscall


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# In the extra folder, you'll find the background image utilized for the bitmap display feature. Presently, the functionality is limited to loading the image itself. There are no interactive elements such as buttons or controls overlaid on the image.
