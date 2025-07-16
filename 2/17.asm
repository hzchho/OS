%include "head.include"
; you code here

your_if:
  mov ecx, [a1]
  cmp ecx, 12 
  jl less_12

  cmp ecx, 24
  jl less_24 

  mov eax, [a1]
  shl eax, 4
  mov [if_flag], eax
  jmp end_if

less_12:
  mov ebx, [a1]
  shr ebx, 1
  inc ebx
  mov [if_flag], ebx
  jmp end_if
  
less_24:
  mov eax, 24
  sub eax, [a1]
  imul eax, [a1]
  mov [if_flag], eax
  jmp end_if
  
end_if:
  mov ecx, [while_flag]
  jmp your_while


your_while:
  mov edx, [a2]
  cmp edx, 11
  jg while1
 
  jmp end_while

while1:
  push ebx
  push ecx
  push edx
  call my_random
  pop edx
  pop ecx
  pop ebx
  mov ebx, [a2]
  sub ebx, 12
  mov [ecx+ebx], al
  
  add ebx, 11
  mov [a2], ebx
  jmp your_while
  
end_while:
  popad
  ret

%include"end.include"
your_function:
  pushad
  mov ecx, 0
  mov edx, [your_string]
for1:
  mov eax, [edx+ecx]
  cmp al, 0
  je end_function
  
  pushad
  push ebx
  push ecx
  push edx
  push eax
  call print_a_char
  pop eax
  pop edx
  pop ecx
  pop ebx
  popad

  inc ecx
  jmp for1

end_function:
  popad
  
  ret

