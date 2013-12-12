#$ memset A(2Bh)

# memset(dest, fill, n)
memset:
export_memset:
	beq $0, $a2, @ret

	@loop:
		sb $a1, 0($a0)
		addi $a0, $a0, 1
		addi $a2, $a2, -1
		bne $0, $a2, @loop

	@ret:
		jr $ra
