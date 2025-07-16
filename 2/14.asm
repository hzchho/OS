org 0x7c00
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
;清空屏幕
mov ah, 02h
mov bh, 0
mov dh, 0
mov dl, 0
int 10h

mov ah, 03h
mov bx, 0
int 10h

mov ah, 09h
mov al, ' '
mov bl, 0000
mov bh, 0
mov cx, 80
int 10h

mov ah, 02h
mov bh, 0
mov dh, 3
mov dl, 0
int 10h

mov ah, 03h
mov bx, 0
int 10h

mov ah, 09h
mov al, ' '
mov bl, 0000
mov bh, 0
mov cx, 80
int 10h

mov ah, 02h
mov bh, 0
mov dh, 7
mov dl, 0
int 10h

mov ah, 03h
mov bx, 0
int 10h

mov ah, 09h
mov al, ' '
mov bl, 0000
mov bh, 0
mov cx, 80
int 10h

;初始化
d_x db 1;定义变量
d_y db 1
count db 0
stri dw 47

mov al, 0
mov bl, 0701
mov dh, 2
mov dl, 0
;初始化位置和颜色

print:
;设计字符
  mov ah, [stri]
  add ah, 1
  mov [stri], ah
  cmp ah, 57
  jz is_ten 

  mov ah, 02h
  mov bh, 0
  add dh, 0
  add dl, 0
  int 10h
 
  mov ah, 03h
  mov bx, 0
  int 10h

  mov ah, 09h
  mov al, [stri]
  add bl, [count]
  mov bh, 0
  mov cx, 1 
  int 10h 
;限定次数  
  mov ah, [count]
  add ah, 1
  mov [count], ah
  cmp ah, 250
  jz end
  
  mov ecx,10000000
;保持一段时间显示效果

loop:
  dec ecx
  cmp ecx, 0
  jne loop
  
  add dh, [d_x]
  add dl, [d_y]
;边界
  cmp dh, 24
  jz turn_left
  
  cmp dh, 0
  jz turn_right
  
  cmp dl, 0
  jz turn_down

  cmp dl, 79
  jz turn_up
  
  jmp print
  
turn_left:
  mov ah, [d_x]
  mov ah, -1
  mov [d_x], ah
  jmp print  

turn_right:
  mov ah, [d_x]
  mov ah, 1
  mov [d_x], ah
  jmp print

turn_up:
  mov ah, [d_y]
  mov ah, -1
  mov [d_y], ah
  jmp print

turn_down:
  mov ah, [d_y]
  mov ah, 1
  mov [d_y], ah
  jmp print

is_ten:
  mov ah, 47
  mov [stri], ah
  jmp print

end:
  mov ah, 02h
xor bh, bh
mov dh, 0
mov dl, 0
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
mov dh, 0
mov dl, 2
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
mov dh, 0
mov dl, 4
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
mov dh, 0
mov dl, 5
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
mov dh, 0
mov dl, 6
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
dw 0xaa55