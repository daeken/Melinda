#$ GetGPUStatus A(4Dh)

# GetGPUStatus()
export_GetGPUStatus:
	pro
	li $t0, 0x1f801814
	lw $v0, 0($t0)
	ret
