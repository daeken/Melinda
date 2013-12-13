writeCdReg:
	pro
	li $t0, 0x1F801800
	add $t0, $t0, $a1
	sb $a0, 0($t0)
	ret
writeCdReg0:
	li $a1, 0
	j writeCdReg
writeCdReg1:
	li $a1, 1
	j writeCdReg
writeCdReg2:
	li $a1, 2
	j writeCdReg
writeCdReg3:
	li $a1, 3
	j writeCdReg

readCdReg:
	pro
	li $t0, 0x1F801800
	add $t0, $t0, $a0
	lb $v0, 0($t0)
	ret
readCdReg0:
	li $a0, 0
	j readCdReg
readCdReg1:
	li $a0, 1
	j readCdReg
readCdReg2:
	li $a0, 2
	j readCdReg
readCdReg3:
	li $a0, 3
	j readCdReg

# a/s0: command
# a/s1: address of parameters (or null if size == 0)
# a/s2: size of parameters
cdCommand:
	pro

	move $s0, $a0
	move $s1, $a1
	move $s2, $a2

	beq $s2, $0, @endParams
	@paramLoop:
		lb $a0, 0($s1)
		jal writeCdReg2 # Push param byte
		inc $s1
		dec $s2
		bne $s2, $0, @paramLoop
	@endParams:

	move $a0, $s0
	debug
	print "before"
	jal writeCdReg1 # Push command byte
	debug
	print "after"

	ret

cdInit:
	pro

	print "cdInit"

	li $a0, 0x0A # Init
	li $a1, 0 # No parameters
	jal cdCommand

	ret
