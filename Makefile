all: melinda.bin
	

obj:
	mkdir -p obj

obj/all_functions.asm: obj tablebuilder.py functions/*
	python tablebuilder.py

obj/melinda.o: *.asm obj/all_functions.asm
	mips-linux-as main.asm -o $@

obj/melinda.tmp: obj/melinda.o
	mips-linux-ld -o $@ obj/melinda.o --section-start=.text=0xBFC00000

melinda.bin: obj/melinda.tmp
	mips-linux-objcopy -O binary -j .text obj/melinda.tmp $@

.PHONY : clean
clean:
	@rm -rf melinda.bin obj
