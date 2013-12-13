#$ tolower A(25h)

# tolower(har)
export_tolower:
	and $a0, $a0, 0xFF
	addi $v0, $a0, 0
	addi $t0, $a0, -0x41
	bltz $t0, @ret
	addi $t1, $a0, -0x5B
	bgez $t1, @ret
	addi $v0, $a0, 0x20

	@ret:
		ret
