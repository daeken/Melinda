#$ todigit A(0Ah)

# todigit(char)
export_todigit:
	and $a0, $a0, 0x7F
	addi $v0, $a0, -0x30
	bltz $v0, @zeroret
	addi $t0, $a0, -0x3A
	bltz $t0, @ret
	andi $t1, $a0, 0x5F
	addi $t0, $t1, -0x41
	bltz $t0, @zeroret
	addi $t0, $t1, -0x5B
	bltz $t0, @zeroret
	addi $v0, $t1, -0x37
	j @ret

	@zeroret:
		sb $v0, 0
	@ret:
		ret
