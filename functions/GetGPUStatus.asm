#$ GetGPUStatus A(4Dh)

# GetGPUStatus()
export_GetGPUStatus:
	lui $t0, 0x1f80
	ori $t0, 0x1814
	lw $v0, 0($t0)
	ret
