include 'format/format.inc' 
format ELF64
section '.text' executable
public func

func:
; float* a - RDI
; float* b - RSI
; float* x - RDX
; size_t size - RCX
; index i - RAX
    push rbx
    xor rax, rax        ; i = 0
    dec rcx             ; n = size - 1
    jmp loop_condition

loop_condition:
    cmp rax, rcx        ; check if i <= size - 1
    jbe loop_equation
    jmp end_of_func

loop_equation:    
    xor ebx, ebx
    cvtsi2ss xmm0, ebx              ; clear xmm0
    subss xmm0, dword [rsi + 4*rax] ; xmm0 = 0 - b[i]
    movss dword [rsi + 4*rax], xmm0 ; b[i] = -b[i]


    divss xmm0, dword [rdi + 4*rax] ; xmm0 = -b[i] / a[i]
    movss dword [rdx + 4*rax], xmm0 ; x[i] = xmm0
    inc rax                         ; i++
    jmp loop_condition

end_of_func:
    pop rbx
    xor ebx, ebx
    cvtsi2ss xmm0, ebx              ; чистимо xmm0
    ret
