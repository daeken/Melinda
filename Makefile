all: melinda.bin
	

objdir:
	-mkdir obj

obj/melinda.s: objdir main.s
	cpp -P < main.s > $@

obj/melinda.o: obj/melinda.s
	mips-linux-as obj/melinda.s -o $@

obj/melinda.tmp: obj/melinda.o
	mips-linux-ld -o $@ obj/melinda.o --section-start=.text=0xBFC00000

melinda.bin: obj/melinda.tmp
	mips-linux-objcopy -O binary -j .text obj/melinda.tmp $@

.PHONY : clean
clean:
	@rm -rf melinda.bin obj
