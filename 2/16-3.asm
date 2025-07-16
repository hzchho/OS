mov ah, 0  
int 16h

main:
    mov ah, 0    ; 读取键盘输入
    int 16h      ; 调用键盘中断     

    mov ah, 0eh  ; tty输出，光标保持不动
    mov bh, 0    ; 页号
    mov bl, 07h  ; 文字颜色
    int 10h      ; 调用显示输出中断

    jmp main  

times 510 - ($-$$) db 0
dw 0xaa55 