.text

.org 0
j initBios

.org 0x100 /* Header */

.org 0x200
#include "init.s"

/* Required to pad the BIOS binary */
.org 0x0080000
