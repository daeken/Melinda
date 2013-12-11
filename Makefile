all: melinda.bin
	

objdir:
	mkdir -p obj

obj/melinda.o: objdir *.asm
	mips-linux-as main.asm -o $@

obj/melinda.tmp: obj/melinda.o
	mips-linux-ld -o $@ obj/melinda.o --section-start=.text=0xBFC00000

melinda.bin: obj/melinda.tmp
	mips-linux-objcopy -O binary -j .text obj/melinda.tmp $@

.PHONY : clean
clean:
	@rm -rf melinda.bin obj
