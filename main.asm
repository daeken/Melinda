.text

.org 0
.globl __start
__start:
j initBios

.org 0x100 /* Header */

.org 0x200
.include "init.asm"

/* Required to pad the BIOS binary */
.org 0x0080000
