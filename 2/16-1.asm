xor ax, ax ; eax = 0
; 初始化段寄存器, 段地址全部设为0
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

; 初始化栈指针
mov sp, 0x7c00
mov ax, 0xb800
mov gs, ax

mov ah, 02h
xor bh, bh
mov dh, 4
mov dl, 5
int 10h

mov ah, 03h
xor bh, bh
int 10h

mov ah, 09h
mov al, 'x'
xor bh, bh
mov bl, 0901
mov cx, 1
int 10h

mov ah, 02h
xor bh, bh
mov dh, 5
mov dl, 6
int 10h

mov ah, 03h
xor bh, bh
int 10h

mov ah, 09h
mov al, 'y'
xor bh, bh
mov bl, 0901
mov cx, 1
int 10h

jmp $


times 510 - ($-$$) db 0
db 0x55, 0xaa