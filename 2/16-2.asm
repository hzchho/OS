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
mov al, '2'
xor bh, bh
mov bl, 0501
mov cx, 2
int 10h

mov ah, 02h
xor bh, bh
mov dh, 4
mov dl, 7
int 10h

mov ah, 03h
xor bh, bh
int 10h

mov ah, 09h
mov al, '3'
xor bh, bh
mov bl, 0601
mov cx, 2
int 10h

mov ah, 02h
xor bh, bh
mov dh, 4
mov dl, 9
int 10h

mov ah, 03h
xor bh, bh
int 10h

mov ah, 09h
mov al, '6'
xor bh, bh
mov bl, 0701
mov cx, 1
int 10h

mov ah, 02h
xor bh, bh
mov dh, 4
mov dl, 10
int 10h

mov ah, 03h
xor bh, bh
int 10h

mov ah, 09h
mov al, '0'
xor bh, bh
mov bl, 0801
mov cx, 1
int 10h

mov ah, 02h
xor bh, bh
mov dh, 4
mov dl, 11
int 10h

mov ah, 03h
xor bh, bh
int 10h

mov ah, 09h
mov al, '4'
xor bh, bh
mov bl, 0901
mov cx, 2
int 10h

jmp $

times 510 - ($-$$) db 0
db 0x55, 0xaa