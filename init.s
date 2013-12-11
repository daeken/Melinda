abort:
	j abort /* this should throw an exception to cause the emulator to bail */

initBios:
	jal initRAM

	j abort

initRAM:
	/* initialize first 64k here */
	jr $ra
