.macro debug
	.long 0xDEADBEEF
.endm

.macro pro size=0
	addiu $sp, -\size+4
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
	.align 1
.endm

.macro print1 msg, r0
	add $t0, \r0, $0
	.long 0xDEADBEEE
	.asciz "\msg"
	.align 1
.endm

.macro print2 msg, r0, r1
	add $t0, \r0, $0
	add $t1, \r1, $0
	.long 0xDEADBEEE
	.asciz "\msg"
	.align 1
.endm

.macro print3 msg, r0, r1, r2
	add $t0, \r0, $0
	add $t1, \r1, $0
	add $t2, \r2, $0
	.long 0xDEADBEEE
	.asciz "\msg"
	.align 1
.endm

.macro print4 msg, r0, r1, r2, r3
	add $t0, \r0, $0
	add $t1, \r1, $0
	add $t2, \r2, $0
	add $t3, \r3, $0
	.long 0xDEADBEEE
	.asciz "\msg"
	.align 1
.endm

abort:
	j abort # should probably kill everything

abort_debug:
	debug
	j abort
