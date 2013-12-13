#$ memset A(2Bh)

# memset(dest, fill, n)
memset:
export_memset:
	pro
	beq $0, $a2, @ret

	@loop:
		sb $a1, 0($a0)
		inc $a0
		dec $a2
		bne $0, $a2, @loop

	@ret:
		ret
