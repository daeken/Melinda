.macro debug
	.long 0xDEADBEEF
.endm

abort:
	j abort # should probably kill everything

abort_debug:
	debug
	j abort

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
	debug
	jr $ra
