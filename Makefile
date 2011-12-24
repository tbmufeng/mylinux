#光盘启动应用

Image : boot.o
	cd boot; cat boot.bin > ../mkoutput/boot.bin
	cdimage -bmkoutput/boot.bin  mkoutput/ Image2.iso
boot.o	:	boot/boot.s
	nasm boot/boot.s -f bin -o boot/boot.bin
clean	:
	rm boot/boot.o 
	rm mkoutput/boot.bin	
	