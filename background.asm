.data
	frameBuffer: .space 262144      # Assuming frame buffer size is 8192 bytes

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
		
		endMenu:
			jr $ra
			