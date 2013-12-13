#$ SendGP1Command A(48h)

# SendGP1Command(gp1cmd)
export_SendGP1Command:
	lui $t0, 0x1f80
	ori $t0, 0x1814
	sw $a0, 0($t0)
	ret
