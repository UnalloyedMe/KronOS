; first version of boot.asm, from babystep 2. Interesting for me to keep in mind the core principle of it
   mov ax, 0x07c0
   mov ds, ax ;puts Data Segment at 0x07c0 (standard bootloader adress)

   mov si, msg 
   cld
loop:
   lodsb ;loads si into al
   cmp al, 0
   je hang
   mov ah, 0x0E ;display function from BIOS video mode
   mov bh, 0
   int 0x10 ;BIOS interrupt video 
   jmp loop

hang:
   jmp hang

msg   db 'Hello World', 13, 10, 0 ;without the specifications at the end, the bootloader wouldn't know when to stop
   times 510-($-$$) db 0
   db 0x55
   db 0xAA