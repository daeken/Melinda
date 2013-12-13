initBios:
	li $sp, 0x801FFFF0
	jal initRAM
	jal cdInit

	j copy_and_run_shell

# initialize first 64k here
initRAM:
	pro
	li $t0, dispatch_A
	sw $t0, 0x000000A0
	li $t0, dispatch_B
	sw $t0, 0x000000B0
	li $t0, dispatch_C
	sw $t0, 0x000000C0
	ret
