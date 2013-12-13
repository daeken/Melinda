#$ SendGP1Command A(48h)

# SendGP1Command(gp1cmd)
export_SendGP1Command:
	pro
	li $t0, 0x1f801814
	sw $a0, 0($t0)
	ret
