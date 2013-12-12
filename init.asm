abort:
	j abort # this should throw an exception to cause the emulator to bail

abort_debug:
	j abort # this should dump debug information

initBios:
	jal initRAM

	j abort

# initialize first 64k here
initRAM:
	li $t0, dispatch_A
	sw $t0, 0x000000A0
	li $t0, dispatch_B
	sw $t0, 0x000000B0
	li $t0, dispatch_C
	sw $t0, 0x000000C0
	jr $ra
