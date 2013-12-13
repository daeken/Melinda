.text

.org 0
.globl __start
__start:
j initBios

# Header
.org 0x100

.org 0x200
.include "misc.asm"
.include "cdrom.asm"
.include "init.asm"
.include "obj/all_functions.asm"

.org 0x30000
.include "shell.asm"

# Required to pad the BIOS binary
.org 0x0080000
