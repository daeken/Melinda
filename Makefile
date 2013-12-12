all: melinda.bin
	

obj:
	mkdir -p obj obj/pp

obj/all_functions.asm: obj util/tablebuilder.py functions/*
	python util/tablebuilder.py

obj/melinda.o: *.asm util/preprocess.py obj/all_functions.asm
	python util/preprocess.py
	cd obj/pp; mipsel-linux-as main.asm -o ../../$@

obj/melinda.tmp: obj/melinda.o
	mipsel-linux-ld -o $@ obj/melinda.o --section-start=.text=0xBFC00000

melinda.bin: obj/melinda.tmp
	mipsel-linux-objcopy -O binary -j .text obj/melinda.tmp $@

.PHONY : clean
clean:
	@rm -rf melinda.bin obj
