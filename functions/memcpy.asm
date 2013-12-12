#$ memcpy A(2Ah)

# memcpy(src, dest, n)
memcpy:
export_memcpy:
	beq $0, $a2, @ret

	@loop:
		debug
		lbu $t0, 0($a0)
		sb $t0, 0($a1)
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		addi $a2, $a2, -1
		bne $0, $a2, @loop

	@ret:
		jr $ra
