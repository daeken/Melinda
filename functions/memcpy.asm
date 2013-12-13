#$ memcpy A(2Ah)

# memcpy(src, dest, n)
memcpy:
export_memcpy:
	pro
	beq $0, $a2, @ret

	@loop:
		lbu $t0, 0($a0)
		sb $t0, 0($a1)
		inc $a0
		inc $a1
		dec $a2
		bne $0, $a2, @loop

	@ret:
		ret
