# KronOS
The goal is to make a OS based on reversing, just as Kali is based on hacking.
## To emulate the bootloader :
### With emulation :
```bash
nasm boot.asm -f bin -o boot.bin
qemu-system-i386 -hda boot.bin
```