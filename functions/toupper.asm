#$ toupper A(25h)

# toupper(har)
export_toupper:
	pro
	and $a0, $a0, 0xFF
	addi $v0, $a0, 0
	addi $t0, $a0, -0x61
	bltz $t0, @ret
	addi $t1, $a0, -0x7B
	bgez $t1, @ret
	addi $v0, $a0, -0x20

	@ret:
		ret
