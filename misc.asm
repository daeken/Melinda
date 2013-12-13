.macro debug
	.long 0xDEADBEEF
.endm

.macro pro size=0
	addiu $sp, -\size-4
	sw $ra, 0($sp)
.endm

.macro epi size=0
	lw $ra, 0($sp)
	addiu $sp, \size+4
.endm

.macro ret size=0
	epi \size
	jr $ra
.endm

.macro print msg
	.long 0xDEADBEEE
	.asciz "\msg"
	.balign 4
.endm

.macro inc reg
	addi \reg, \reg, 1
.endm

.macro dec reg
	addi \reg, \reg, -1
.endm

abort:
	j abort # should probably kill everything

abort_debug:
	debug
	j abort
