.data
	# Define struct for history entry
	history_entry: .space 4  # Operand 1 (float)
               	       .space 4  # Operator (integer)
               	       .space 4  # Operand 2 (float)
              	       .space 4  # Result (float)
              	      
         history: .space 10 * 16  # Assuming sizeof(history_entry) is 16 bytes
         
         # Pointer to next available slot in history array
	current_history_index: .word 0
               
        # background
	frameBuffer: .space 262144      # 512x512
	
	
.text
main:
	displayMenu:
		la $t0, frameBuffer
		la $t4, backgroundImage
		li $t1, 262144
		
		displayMenu2:
			lw $t2, 0($t4)
			sw $t2, 0($t0)
			addi $t0, $t0, 4
			addi $t1, $t1, -1
			addi $t4, $t4, 4
			bnez $t1, displayMenu2
			
		add_to_history:
  			# Save operand1, operator, operand2, and result in registers (replace with your logic)
  			# ...
  
  			# Calculate offset for next available slot in history array
  			sll $t0, $current_history_index, 2  # Multiply by 4 (size of struct)
  			add $t1, $history, $t0               # Get address of next slot

  			# Store operands, operator, and result in the history entry
  			sw $v0, 0($t1)                       # Operand 1 (replace with registers)
  			sw $v1, 4($t1)                       # Operator
  			sw $a0, 8($t1)                       # Operand 2
  			sw $a1, 12($t1)                      # Result

  			# Update pointer to next available slot
  			addi $current_history_index, $current_history_index, 1

  			jr $ra
			
		draw0:
			sw $t1, 2052($t0)
			sw $t1, 2056($t0)
			sw $t1, 2060($t0)
			sw $t1, 4100($t0)
			sw $t1, 4108($t0)
			sw $t1, 6148($t0)
			sw $t1, 6156($t0)
			sw $t1, 8196($t0)
			sw $t1, 8200($t0)
			sw $t1, 8204($t0)
		
		draw1:
			sw $t1, 8($t0)
			sw $t1, 2052($t0)
			sw $t1, 2056($t0)
			sw $t1, 4104($t0)
			sw $t1, 6152($t0)
			sw $t1, 8200($t0)
			sw $t1, 10248($t0)
			sw $t1, 12288($t0)
			sw $t1, 12292($t0)
			sw $t1, 12296($t0)
			sw $t1, 12300($t0)
			sw $t1, 12304($t0)
			
		draw2:
			sw $t1, 0($t0)
			sw $t1, 4($t0)
			sw $t1, 8($t0)
			sw $t1, 12($t0)
			sw $t1, 16($t0)
			sw $t1, 2064($t0)
			sw $t1, 4112($t0)
			sw $t1, 6160($t0)
			sw $t1, 8204($t0)
			sw $t1, 10248($t0)
			sw $t1, 12288($t0)
			sw $t1, 12292($t0)
			sw $t1, 12296($t0)
			sw $t1, 12300($t0)
			sw $t1, 12304($t0)
			
		draw3:
			sw $t1, 0($t0)
			sw $t1, 4($t0)
			sw $t1, 8($t0)
			sw $t1, 12($t0)
			sw $t1, 16($t0)
			sw $t1, 2064($t0)
			sw $t1, 4112($t0)
			sw $t1, 6148($t0)
			sw $t1, 6152($t0)
			sw $t1, 6156($t0)
			sw $t1, 6160($t0)
			sw $t1, 8208($t0)
			sw $t1, 10256($t0)
			sw $t1, 12288($t0)
			sw $t1, 12292($t0)
			sw $t1, 12296($t0)
			sw $t1, 12300($t0)
			sw $t1, 12304($t0)

		draw4:
			sw $t1, 16($t0)
			sw $t1, 2060($t0)
			sw $t1, 2064($t0)
			sw $t1, 4104($t0)
			sw $t1, 4112($t0)
			sw $t1, 6148($t0)
			sw $t1, 6160($t0)
			sw $t1, 8192($t0)
			sw $t1, 8196($t0)
			sw $t1, 8200($t0)
			sw $t1, 8204($t0)
			sw $t1, 8208($t0)
			sw $t1, 10256($t0)
			sw $t1, 12304($t0)

		draw5:
			sw $t1, 0($t0)
			sw $t1, 4($t0)
			sw $t1, 8($t0)
			sw $t1, 12($t0)
			sw $t1, 16($t0)
			sw $t1, 2048($t0)
			sw $t1, 4096($t0)
			sw $t1, 6144($t0)
			sw $t1, 6148($t0)
			sw $t1, 6152($t0)
			sw $t1, 6156($t0)
			sw $t1, 6160($t0)
			sw $t1, 8208($t0)
			sw $t1, 10256($t0)
			sw $t1, 12288($t0)
			sw $t1, 12292($t0)
			sw $t1, 12296($t0)
			sw $t1, 12300($t0)
			sw $t1, 12304($t0)
			
		draw6:
			sw $t1, 4($t0)
			sw $t1, 8($t0)
			sw $t1, 12($t0)
			sw $t1, 16($t0)
			sw $t1, 2052($t0)
			sw $t1, 4100($t0)
			sw $t1, 6148($t0)
			sw $t1, 6152($t0)
			sw $t1, 6156($t0)
			sw $t1, 6160($t0)
			sw $t1, 8196($t0)
			sw $t1, 8208($t0)
			sw $t1, 10244($t0)
			sw $t1, 10256($t0)
			sw $t1, 12292($t0)
			sw $t1, 12296($t0)
			sw $t1, 12300($t0)
			sw $t1, 12304($t0)

		draw7:
			sw $t1, 0($t0)
			sw $t1, 4($t0)
			sw $t1, 8($t0)
			sw $t1, 12($t0)
			sw $t1, 16($t0)
			sw $t1, 2064($t0)
			sw $t1, 4112($t0)
			sw $t1, 6160($t0)
			sw $t1, 8208($t0)
			sw $t1, 10256($t0)
			sw $t1, 12304($t0)

		draw8:

		draw9:
			sw $t1, 4($t0)
			sw $t1, 8($t0)
			sw $t1, 12($t0)
			sw $t1, 2048($t0)
			sw $t1, 2064($t0)
			sw $t1, 4096($t0)
			sw $t1, 4112($t0)
			sw $t1, 6148($t0)
			sw $t1, 6152($t0)
			sw $t1, 6156($t0)
			sw $t1, 6160($t0)
			sw $t1, 8208($t0)
			sw $t1, 10256($t0)
			sw $t1, 12292($t0)
			sw $t1, 12296($t0)
			sw $t1, 12300($t0)

		
		endMenu:
			jr $ra
			