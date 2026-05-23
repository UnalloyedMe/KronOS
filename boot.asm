; boot.asm
   mov ax, 0x07c0
   mov ds, ax ;puts Data Segment at 0x07c0 (standard bootloader adress)

   mov si, msg 
   cld
loop:
   lodsb ;loads si into al
   or al, al ; zero=end of str
   jz hang   ; get out
   mov ah, 0x0E ;display function from BIOS video mode
   mov bh, 0
   int 0x10 ;BIOS interrupt video 
   jmp loop

hang:
   jmp hang

msg   db 'Hello World', 13, 10, 0 ;wihtout the specifications at the end, the bootloader wouldn't know when to stop
   times 510-($-$$) db 0
   db 0x55
   db 0xAA