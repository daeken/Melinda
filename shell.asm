# This file contains the BIOS shell

shell:
	debug
	li $t0, 0x80030010
	jr $t0

copy_and_run_shell:
	li $t0, copy_and_run_shell
	li $t1, shell
	sub $a2, $t0, $t1 # t0 contains the size of the shell code

	li $a0, 0xbfc30000
	li $a1, 0x80030000
	jal memcpy

	li $t0, 0x80030000
	jr $t0
